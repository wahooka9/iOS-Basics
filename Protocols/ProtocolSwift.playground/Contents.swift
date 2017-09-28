//: Playground - noun: a place where people can play

import UIKit

var stringArray : [String] = ["a","b","c","d"]
var intArray : [Int] = [1,3,8,4,10,6,7,2,9,5]
intArray.reduce(0, +)
intArray.reduce(0, { x, y in
    x + y
})
stringArray.reduce("", +)
intArray.filter { 5 > $0 }.reduce(0, +)


protocol Addable {
    init()
    static func + (lhs:Self, rhs:Self) -> Self
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


struct CatNaps {
    var time : Int
    
    init(time:Int) {
        self.time = time
    }
}

func createCatNaps() -> [CatNaps] {
    var results = [CatNaps]()
    for _ in 0..<10 {
        results.append(CatNaps(time:Int(arc4random() % 3600)))
    }
    return results
}

var catNapList = createCatNaps()

catNapList.sort { (x, y) -> Bool in
    return y.time > x.time
}

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












