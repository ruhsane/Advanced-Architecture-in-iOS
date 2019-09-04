//facory protocol

protocol CarFactory {
    func create() -> Car
}

class Car {
    func drive() {
        print("driving a car")
    }
}

class Truck: Car {
    override func drive() {
        print("driving a truck")
    }
}

class SportsCar: Car {
    //missing function
    override func drive() {
        print("skrtttt")
    }
}

class SUV: Car {
    override func drive() {
        print("I'd rather be driving!")
    }
}


// concrete factory
class TruckFactory: CarFactory {
    func create() -> Car {
        return Truck()
    }
}

class SportsCarFactory: CarFactory {
    func create() -> Car {
        return SportsCar()
    }
}

class SUVFactory: CarFactory {
    func create() -> Car {
        return SUV()
    }
}


let truckFactory = TruckFactory()
let truck = truckFactory.create()
truck.drive() // prints "diving a truck"

let sportsCarFactory = SportsCarFactory()


let suvFactory = SUVFactory()

