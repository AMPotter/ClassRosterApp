//
//  Person.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/5/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var firstName = ""
    var lastName = ""
    var isStudent = false
    var image : UIImage?
    
    init (firstName : String, lastName : String, isStudent : Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    func returnName() -> String {
        return "\(firstName) \(lastName)"
    }
}
