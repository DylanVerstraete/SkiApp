//
//  User.swift
//  SkischoolApp
//
//  Created by Nele Van Melckebeke on 26/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import UIKit

class User {
    var email: String = ""
    var firstname: String?
    var lastname: String?
    var address: String?
    var addressnumber: String?
    var addresspostalcode: String?
    var addresscity: String?
    var telephonenumber: String?
    var skicards = [Skicard]()
    var totalskicards: Int = 0
    var totalskiturns: Int = 0
    var member = Member()
    
    init(email: String){
        self.email = email
    }
    
    init(firstname: String, lastname:String, address:String, addresspostalcode: String, addresscity: String, addressnumber: String, telephonenumber: String){
        self.firstname = firstname
        self.lastname = lastname
        self.address = address
        self.addresspostalcode = addresspostalcode
        self.addresscity = addresscity
        self.telephonenumber = telephonenumber
        self.addressnumber = addressnumber
    }
    
    init(email: String, firstname: String, lastname:String, address:String, addresspostalcode: String, addresscity: String, addressnumber: String, telephonenumber: String){
        self.firstname = firstname
        self.lastname = lastname
        self.address = address
        self.addresspostalcode = addresspostalcode
        self.addresscity = addresscity
        self.telephonenumber = telephonenumber
        self.addressnumber = addressnumber
    }
}

