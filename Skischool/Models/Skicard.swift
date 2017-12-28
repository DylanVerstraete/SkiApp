import UIKit

class Skicard {
    var payed: Bool
    var numberOfTurns: Int
    
    init(){
        self.payed = false
        self.numberOfTurns = 10
    }
    
    init(payed: Bool, numberOfTurns: Int){
        self.payed = payed
        self.numberOfTurns = numberOfTurns
    }
}

