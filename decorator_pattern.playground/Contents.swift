import UIKit

// Abstract Core Component
protocol PizzaBase {
    func getPrice() -> Double
}

// Concrete Core Component
class PlainPizza: PizzaBase {
    
    var myPrice: Double = 1.0
    
    func getPrice() -> Double {
        return self.myPrice
    }
}

// Concrete Core Component
class Margherita: PizzaBase {
    
    var price: Double = 6.99
    
    func getPrice() -> Double {
        return self.price
    }
}

// Concrete Core Component
class Gourmet: PizzaBase {
    
    //TODO: Implement the Gourmet pizza; price is 7.49
    var price: Double = 7.49
    
    func getPrice() -> Double {
        return self.price
    }
}

// Decorator (base) class
class ToppingsDecorator: PizzaBase {
    
    private let pizza: PizzaBase
    
    required init(pizzaToDecorate: PizzaBase) {
        self.pizza = pizzaToDecorate
    }
    
    func getPrice() -> Double {
        return pizza.getPrice()
    }
}

// Decorator class (extended)
class ExtraCheeseTopping: ToppingsDecorator {
    
    //TODO: Implement Extra Cheese -- add 1.0 to current price
    required init(pizzaToDecorate: PizzaBase) {
        super.init(pizzaToDecorate: pizzaToDecorate)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 1.0
    }
}

// Decorator class (extended)
class MushroomTopping: ToppingsDecorator {
    
    //TODO: Implement adding mushrooms -- add 1.49 to current price
    required init(pizzaToDecorate: PizzaBase) {
        super.init(pizzaToDecorate: pizzaToDecorate)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 1.49
    }
}

// Decorator class (extended)
class JalapenoTopping: ToppingsDecorator {
    
    //TODO: Implement JalapenoToppingk, add an extra 1.19 for peppers
    required init(pizzaToDecorate: PizzaBase) {
        super.init(pizzaToDecorate: pizzaToDecorate)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 1.19
    }
}

/// Client-code for Margherita
//let pizza: PizzaBase = Margherita()
//print("Plain Margherita: ", pizza.getPrice())

/// Client-code for Gourmet
let pizza: PizzaBase = Gourmet()
print("Plain Gourmet: ", pizza.getPrice())

let moreCheese: ExtraCheeseTopping = ExtraCheeseTopping(pizzaToDecorate: pizza)
print("moreCheese: ", moreCheese.getPrice())

let evenMoreCheese: ExtraCheeseTopping = ExtraCheeseTopping(pizzaToDecorate: moreCheese)
print("evenMoreCheese: ", evenMoreCheese.getPrice())

let mushrooms: MushroomTopping = MushroomTopping(pizzaToDecorate: evenMoreCheese)
print("mushrooms: ", mushrooms.getPrice())

let withPeppers: JalapenoTopping = JalapenoTopping(pizzaToDecorate: mushrooms)
print("withPeppers: ", withPeppers.getPrice())


//OUTPUT:
//
// 1) For Client-code for Margherita, should print:
//
// Plain Margherita:  6.99
// moreCheese:  7.99
// evenMoreCheese:  8.99
// mushrooms:  10.48
// withPeppers:  11.67
//
// 1) For Client-code for Gourmet, should print:
//
// Plain Gourmet:  7.49
// moreCheese:  8.49
// evenMoreCheese:  9.49
// mushrooms:  10.98
// withPeppers:  12.17
// 
