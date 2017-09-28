#Protocols
---------------
---------------

A while ago I was told that I was going to develop the front end of an application and that someone else was going to do all the backend work because they were just getting into iOS programming and they really wanted to try it out.
So ,  here I was -  I had to create an app or the look of one and stay away from the backend.  The huge problem is that i have a view that requires data from some kind of object -  and i have no clue what that object looks like.  This is when i decided to use protocols,  To say "Hey -  I require at least this data here".  (I also used the MVVM design pattern to keep the view totally separate)


So - The idea is then to use protocols throughout the view controller and let the other developer define what they want their object to look like and all they have to do is make sure they follow the protocol.

Besides using a protocol as a blueprint you can also use it as a messenger between classes via Delegation.

Objective-C

There are a few minor points -  properties in the protocol do not need to be defined in the class (but they can be) that conforms to it however you will need to @synthisize them.
You can declare the same property in both the class that is adhering to the interface or you can simply synthesize them.

The nice thing about objective C is you can declare properties or functions within a protocol 'required' or 'optional' Sometimes you will want to be sure that values / functions are not nil.

```Objective-C
if ([data respondsToSelector:@selector(functionTest)]){
[data functionTest];
}
```
This example shows how to make sure i dont make a request to a nil selector and cause a crash.


Lets skip to Swift -  Because protocols are awesome but way different

Swift
-----------
-----------

WHERE TO START?!?!?

Well -  Let's skip delegates and get into the crazy stuff -

So,  Once again - a protocol is basically a blueprint .   With this information we can architect things to function how we want.   I think this time around I am going to use a Playground.

SOOO  let's start with extensions -    They do kind of rock -  i have to admit when i first saw them i thought to myself how it opens up issues say by extending functionality you only want temporarily or only for specific types,  but more often than not i am wrong.

Apple:
---------
---------
Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.)




Lets sum up an array of Ints

we can do this a ton of ways

```Swift
var stringArray : [String] = ["a","b","c","d"]
var intArray : [Int] = [1,3,8,4,10,6,7,2,9,5]
intArray.reduce(0, +)  //55
intArray.reduce(0, { x, y in
x + y
}) // 55
stringArray.reduce("", +) //"abcd"
```

ookkkaaayyyyy -  Well 1 line of code to sum up the array ... ..

how else could we do it?

```Swift
protocol Addable {
init()
func + (lhs:Self, rhs:Self) -> Self
}

extension Int : Addable {}
extension String : Addable {}

extension Array where Iterator.Element: Addable {
var sum: Iterator.Element {
return reduce(Iterator.Element(), +)
}
}

intArray.sum
stringArray.sum
```

By creating a protocol i can specify "Hey this conforms to that" and it allows us to add functionality to a generic type.


AWESOME!!!  but as you see we can simply reduce so this is kindof pointless...

So we have this object 'CatNaps' because we all enjoy Mid Day naps.

```Swift

struct CatNaps {
var time : Int

init(time:Int) {
self.time = time
}
}

var catNapList = createCatNaps()

catNapList.sort { (x, y) -> Bool in
return y.time > x.time
}
```

This will sort our array for us.



OR

```Swift
extension CatNaps: Equatable {
static func ==(lhs: CatNaps, rhs: CatNaps) -> Bool {
return lhs.time == rhs.time
}
}

extension CatNaps: Comparable {
static func <(lhs: CatNaps, rhs: CatNaps) -> Bool {
return lhs.time < rhs.time
}

static func <=(lhs: CatNaps, rhs: CatNaps) -> Bool {
return lhs.time <= rhs.time
}

static func >=(lhs: CatNaps, rhs: CatNaps) -> Bool {
return lhs.time >= rhs.time
}

static func >(lhs: CatNaps, rhs: CatNaps) -> Bool {
return lhs.time > rhs.time
}
}

catNapList.sort()
```

(Self will not work because Self is for class's not structs)

I like to keep the protocols extended separate -  its similar to having a pragma mark.


So adding some functionality to the class / struct / object is nice.  And a lot of times the functionality will take extra lines of code it actually abstracts things in other classes making code more readable -



This is some simple example work that hardly even brushes the surface -
As you can see we can quickly and easily add functionality to objects.





















