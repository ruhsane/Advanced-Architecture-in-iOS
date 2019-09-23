func doubleIt(inputArray: Array<Int>) {
    
    var results = [Int]()
    
    for num in inputArray {
        results.append(num * 2)
    }
    print(results)
}

doubleIt(inputArray: [1,2,3]) // [2,4,6]

//TODO:

//Code the declarative (FP) version of doubleItso that it achieves the same result as the code above by using the map function instead of the for loop

func doubleItFP(inputArray: Array<Int>) {
    var results = [Int]()
    results = inputArray.map { $0 * 2 }
    print(results)
}
doubleItFP(inputArray: [1,2,3]) // [2,4,6]


//    Given an array of Users which have properties name:String and age:Int:
// write a map function that returns an array of strings consisting of the user’s names

class User {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func names(userArray: Array<User>) {
    var results = [String]()
    results = userArray.map {
        $0.name
    }
    print(results)
}

let userArray = [User(name: "Ruhsane", age: 20), User(name: "Ryan", age: 23)]
names(userArray: userArray)


// Take the initial array of Users from the exercise above and, using map, convert it to a Dictionary
let userDictArray = userArray.map { (item) in
    return [item.name: item.age]
}
print(userDictArray)


// Given an array of dictionaries containing keys for “name” and “age”:
// write a map function that returns an array of users created from it

let userArrayAgain = userDictArray.map { (dict) in
    return dict.map({ (key, value) -> User in
        return User(name: key, age: value)
    })[0]
}
print(userArrayAgain)

