//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、filter函数的基本使用 */

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = nums.filter{ $0 % 2 == 0 }  // { num in num % 2 == 0 } 这里的num使用前面的$0取代了
result



/** 2、map函数和filter函数的结合使用 */

let mixedResult = (1..<10).map { $0 * $0 }.filter { $0 % 2 == 0 }
mixedResult



/** 3、filter */

extension Array {
    
    func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where isIncluded(x) {
            result.append(x)
        }
        return result
    }
}


/** 4、contains函数的应用 */

extension Sequence {
    
    public func all(matching predicate: (Element) -> Bool) -> Bool {
        
        // 对于⼀个条件，如果没有元素不满⾜它的话，那意味着所有元素都满⾜它
        return !contains { !predicate($0) }
    }
}

let evenNums = nums.filter { $0 % 2 == 0 }
evenNums  // [2, 4, 6, 8, 10]
let evenResult = evenNums.all { $0 % 2 == 0 }
evenResult  // true
