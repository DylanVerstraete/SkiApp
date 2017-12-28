//
//  Member.swift
//  SkischoolApp
//
//  Created by Nele Van Melckebeke on 26/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import UIKit

class Member {
    var pending: Bool
    var isMember: Bool
    
    init(){
        self.pending = false
        self.isMember = false
    }
    
    init(pending: Bool, isMember: Bool){
        self.pending = pending
        self.isMember = isMember
    }
}

