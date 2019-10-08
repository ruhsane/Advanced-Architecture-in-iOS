// Exercise 1: The output for the following code snippet is [Optional(1), Optional(2), nil, nil, Optional(5)], which is not the desired output.
//
// TODO: Rework this code so that it only prints the string equivalents of the the integers as [1, 2, 5]
import Foundation

let possibleNumbers = ["1", "2", "three", "///4///", "5"]
//let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
let mapped = possibleNumbers.compactMap {
    Int($0)
}

print(mapped)


// Exercise 2: Using the reduce function, complete the code below so that the output is 6.667
//
// Remember: The function reduce takes two arguments, an initial value and a closure.
//
// For initial value, use: 0.0
// Closure expression: { $0 + ($1 / Double(values.count)) }

let values = [7.0, 3.0, 10.0]
let avg:Double = values.reduce(0) { (x, y) in
    x + (y / Double(values.count))
}// TODO: reduce values array to the average of all its elements
print(avg)

let avg2: Double = values.reduce(0, +) / Double(values.count)
print(avg2)

// Exercise 3: For the values array below, return only the even numbers in a new array. The output of that new even array should be [14, 22]
//
 let values = [11, 13, 14, 17, 21, 33, 22]
// TODO: return only even numbers here

print(even)
// Output: [14, 22]




//Exercise 4: You’re working with 4 groups of giraffes, and want to create one single group of giraffes that are taller than a certain height.
//
//TODO: Complete by findining all the integers in the giraffes (nested) array that are greater than 10 and return them in one single, flat (non-nested) array:

let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]
let tallest = giraffes.flatMap({ // TODO: Insert closure syntax here })
    
    print(tallest) // [11, 13, 20, 13]
