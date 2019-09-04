//Singleton design pattern

class DataSource {
    
    var creationalPatternsArray = ["Abstract Factory", "Factory Method",
                                   "Builder", "Dependency Injection", "Lazy Initialization",
                                   "Object Pool", "Prototype", "Singleton"]

    static let sharedInstance = DataSource()
    private init() {
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
    }

}

//instantiate the singelton object
//let singleton = DataSource.sharedInstance

func looper(){
    
    for num in 1...5 {
        _ = DataSource.sharedInstance
        print("num is:", num)
    }
}
looper()
