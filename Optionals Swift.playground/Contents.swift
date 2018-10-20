import UIKit



/*
 
 Rules:
 
 1. Every variable type must be defined(Implicit/Explicit)
 2. The type can be inferred based on the value
 3. Every normal type should have value associated
 
 */

let myName : String = "Sagar Sandy"     // Explicit
let yourName = "Welcome"                // Implicit

let myHeight : Double = 5.84            // Explicit
let yourHieght = 5.87                   // Implicit

/*
 In the above constants declaration, every constant have some value, but what if you want to
 declare a constant/variable with nil value
 
 You cannot simply declare a constant/variable just like this
 let myPhone
 let myPhone : String
 this will throw you an error
 
 So to avoind this kind of bugs, we are introduced to optionals.
 */

var myPhone : String? = nil    // Which means this variable may or maynot have a value, in current position this variable has no value

myPhone = "iPhone"   // Now this variable has some value.


/* :
 Optional rules:
 
 1. Optionals do not interact with each other
 2. You have to convert them to normal types, which is called unwrapping
 3. Converting optionals have two ways : 1. Implicit (Safe) unwrap  2. Explicit (Forced) unwrap
 */

let myImage : String? = nil

// Safe or Implicit unwrapping

if let currentImage = myImage {
    print(currentImage)
} else {
    print("image is nil")
}

let myImage2 : String? = "https://www.facebook.com/image.png"     // random url

// Safe or Implicit unwrapping

if let currentImage = myImage2 {
    print(currentImage)
} else {
    print("image is nil")
}

// Force or Explicit unwrapping
let myImage3 : String? = "yippee.png"
print(myImage3!)

/*
 Using ! symbol means we are doing force unwrapping of a optional value, if you are sure that a particular variable defenitly holds some value while you are using, then go for force unwrapping. otherwise safe unwrapping is best always. It will never returns error. But if the variable value is nil, and you are trying to force unwrap it, then you will run into errors.
 */


// Optional chinings

import UIKit

let labelColor = UILabel().highlightedTextColor?.cgColor

/*
 While working with lot of xcode predefined methods/properties we will run into this situation of ?.property. It's just because highlightedTextColor may or may not contain a value. Let's reproduce and solve this.
 */


class Phone {
    
    var model : String
    
    init(model : String) {
        self.model = model
    }
}

class IPhone {
    var myIphone : Phone? = nil
}

var phone1 = IPhone()
phone1.myIphone = Phone(model: "OPPO")

let phone1Model = phone1.myIphone?.model

/*
 See the ? comes here, becuase the iphone class has no value in the starting, and after some time we initialized it to some value.
 Again we need to unwrap this value, otherwise phone1Model will contain optional value
 */

if let myPhoneModel = phone1.myIphone?.model {
    print(myPhoneModel)
} else {
    print("No model available")
}

// Another approach would be force unwrapping
var phone2 = IPhone()
phone2.myIphone = Phone(model: "VIVO")

let phone2Model = phone2.myIphone!.model


// Unwrapping multiple optionals

let publicName : String? = "Sagar"
let publicPhoto : String? = "img.png"
let publicAge : Int? = 22

if let name = publicName, let age = publicAge, let photo = publicPhoto {
    print("my name is \(name) and my age is \(age) and my pic is \(photo)")
} else {
    print("Some param missing")
}

// Using guard:  Guard is opposite to if else, it will first execute the else block first and will return the execution.

func unwrapMultipleOprionals() {
    
    guard let name = publicName, let age = publicAge, let photo = publicPhoto else {
        print("Some param missing")
        
        return
    }
    
    print("my name is \(name) and my age is \(age) and my pic is \(photo)")
    
}

unwrapMultipleOprionals()

// Defer statement: Defer statement is used to execute a block of code after the current loop, scope is completed with in a function.

func checkingDefer() {
    
    defer {
        print("Print later")
    }
    
    print("Print first")
    
}

checkingDefer()

func checkingMultipleDefer() {
    
    defer {
        print("This will print last")
    }
    
    defer {
        print("This will print after for loop")
    }
    
    print("Print first")
    
    
    for i in 1...5 {
        print("i value is \(i)")
    }
    
    // The first defer statement will execute in the last.
}

checkingMultipleDefer()

// Using defer in for loop

for i in 1...5 {
    
    defer {
        print("i value with defer block is \(i)")
    }
    
    print("i value is \(i)")
}

