//
//  Brewery.swift
//  NetWorking2
//
//  Created by Consultant on 3/1/22.
//

import Foundation

class Brewery {
    var name: String
    var type: String
    var city: String
    var state: String
    var street: String
    ///var web: String?
    
//web:String?
    init(name:String, type: String, city:String, state:String, street:String) {
        self.name = name
        self.type = type
        self.city = city
        self.state = state
        self.street = street
        //self.web = web
        
    }
}
