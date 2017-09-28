# Messaging
----------------------
----------------------

Delegates
Notifications
Blocks / Closures
KVO


This is one of the biggest topics when it comes to programming in most languages -  How can we cleanly get information from one place to another where we want to consume it?

There are advantages and disadvantages to each and i hope to cover as much as i can but i do have a tendency to be absent minded and skip things.


Delegates
-----------------
-----------------

I mentioned that Protocols can be used to send messages -  Swift seems to be shying away from delegates because the optional functionality is missing in swift unless you declare the protocol @objc.

Delegates function by sending a reference of the class the conforms to the protocol and the methods can be called from that object's reference.  The one hold up is that the delegate should be stored as a weak variable to not increment the reference counter. aka A retain Cycle.

Lets do something besides passing data to another view controller.  We will create a working class that needs to do a ton of work -  and we will create delegates to
tell us when its finished
tell us where its at in progress

Thats where we have the updateNumber and the finished methods getting hit each time the delegate is called. This functionality was much more powerful in objective C because we could have optional functions and not declare them if we didnt want to use them.

The objective C delegate shows this functionality - you can comment out the updateBlock function in the view controller and then you will not be forced the have the delegate print out the number each time.  It does however require us to make sure we do not unwrap an optional so we have to check for nil on that delegate function.   Over all it is pretty straight forward.


It works the same as the delegate that passes a message to the view controller in that you create a protocol that the delegate will adhere to and it abstracts what is actually going on and just passes data the subscribing class wants to consume.


As you can see - Delegates are a beautiful way to decouple code. However they lack a nice way to provide access to multiple delegates besides adding delegate objects.


Notifications
-----------------
-----------------

Notifications are nice because you can send messages across the application simply.  You can break down a notification to being similar to a person yelling- whomever is listening can hear it -  they do have to be listening though.

For the notification we basically need to name the notification and what object is listening for it.  then whenever the notification is posted the notification will fire.

The upside to this is that it is global,  there is no passing around of references and worry about memory leaks. The downside is you need to manage the notification, because if you do not remove them you will have a nil pointer.  Besides that - they are not of any use outside of the application AKA Background mode.  -  Because if the notification is not being observed -  posting it will not perform the selector anyway.

Closures
---------------
---------------

In C we would call these function pointers.  They allow for passing of messages by setting up a callback functionality.  Like delegates these are a great way to pass messages.

Some of the cons however are that the compiler sometimes does not know what to expect for a type so you often have to typealias them.  and they can also sometimes lead to memory leaks if you have a reference to 'self'  when using self inside of a block or closure it is good to use unowned or weak -

This is one of those moments (a question that is not often asked in interviews but is super important to know) the difference between unowned and weak.

unowned
Unowned is faster and allows for immutability and non optionality. If youre variable has the same lifecycle as as your block/closure you want to use unowned which will provide better performance than weak.

Weak
weak provides a way for the variable to have an independent lifetime to the closure ,  having a weak reference means that the variable could be nil so you never want to force unwrap.

Lets take a quick look at the closure / Block
```Swift
{
[unowned self] (name:String) in
self.nameLabelOutlet.text = name;
}
```
So by now we know what unowned means -
beside that we can see the parameters the block accepts  (name:String)   A string -
and it takes that string and assigns it to the nameLabelOutlet -   pretty straight forward.


KVO
--------------
--------------

KVO is Key Value Observing -  What this means is we observe a value and when it changes or updates we then will react to that change.

The example i have in this project is not the best -  The problem is that UIKit doesnt support Key Value Observing ,  i get it to work by observing the value on the slider and not the slider itself, however this only allows me to observe the first change and i miss subsequent changes.   WHY?!?!  because the value on the slider is not KVC (key value compliant) I kind of 'Hack' a way for it to work and after it receives one change its like "oh here is a change" but there is no didChangeValueForKey.   KVC is how we can plug into KVO -  What KVC does is it allows properties to be accessed via a string literal of the property. NSObject sets this up automatically.

Long story short it would be best to use the trigger on the UISlider - But to illustrate KVO i did not want to get updated values then pass them to another class to update a local value -  the twitchy way is fine enough for this example -    Wait.. what am i saying?  no its not -  Lets do it right -

SO - Like i said - The UIKit is not Key Value Compliant unless it explicitly says .  So we will need to make a class that has the values stored where we can make sure they are.
What we did was build a class that imports from Foundation and inherits from NSObject.   If we happen to do any KVC and override didChangeValue we have to make sure we super.didChangeValue.

So after creating the class with the values we want to observe (i have Float and NSNumber to kind of show that it doesnt matter) we have to then observe the values.

so we have

```Swift

sliderValues.addObserver(self, forKeyPath: "redValue", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old], context: KVOViewController.PrivateKVOContext)
```

Lets break this down

```Swift
sliderValues
```
This is the class we are going to be observing

```Swift
addObserver(self ...
```
self is going to be the class that is the observer. It will be responsibile for handeling the notifications.

```Swift
forKeyPath: "redValue"
```
This is the most difficult part of KVO.  Looks simple enough right?  Well you could say yes and no.  The selectors are broken down into strings so this 'String' value is actually the value we want to be observing.   People often have problems with this because if you happen to type the keyPath wrong you will run into issues (even i make this mistake and its annoying)  There is a newer way of doing it in which you use #keyPath(Class.property) to format the string for you,  this is the preferred way because the compiler can read this and it will give you warnings if the code changes and this breaks.

Once again -  This is the Value we are observing -  and Yes, it is written as a string.


```Swift
options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old]
```
This is basically telling the observer 'Hey you!!  i want the old value and the new value'  I dont actually want the old value - but it wont hurt.

```Swift
context: KVOViewController.PrivateKVOContext
```
Now what in the HECK is that?  a context?  why do i see most examples online keep this nil?  and no one actually sets this ...    Well my friend - this is one of those instances where those people are wrong.  Yes you can get away with not setting it BUT you have no clue if there are other classes observing and if it is, it could cause a crash.


Last we have the observeValue function
```Swift
override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
if let keypath = keyPath, context == KVOViewController.PrivateKVOContext  {

} else {
super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
}

}
```
In here i double check the KVOContext is the one i was observing for this class -  and also that the Keypath is set.
from here if i want to see what the newValue is change?[.newKey] will work or change?[.oldKey] for the old data.

KVO is not utilized as often -  I was told that back in the day,  Key Value Coding was supposed to be the way of the future. That is actually why apple implements it quite a bit in everything from Core Data to NSObject.  Overall its a nice way to have event driven actions however the notifications all going to the same function often leads to a huge function that is difficult to follow.






















