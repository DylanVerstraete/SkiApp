//
//  Image.swift
//  Skischool
//
//  Created by Nele Van Melckebeke on 28/12/17.
//  Copyright © 2017 Hogent. All rights reserved.
//

import Foundation

class Image{
    var value: String?
    var postedBy: User?
    var fileName: String?
    
    init(value: String, fileName: String){
        self.value = value
        self.fileName = fileName
        //self.postedBy = nil
    }
    
    init(){
        
    }
}
