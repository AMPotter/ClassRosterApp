//
//  Person.swift
//  ClassRoster
//
//  Created by Andrew Potter on 11/5/14.
//  Copyright (c) 2014 Andrew Potter. All rights reserved.
//

import Foundation
import UIKit

class Person : NSObject, NSCoding {
    var firstName : String
    var lastName : String
    var studentStatus : String
    var image : UIImage?
    
    init (firstName : String, lastName : String, studentStatus : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.studentStatus = studentStatus
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        self.studentStatus = aDecoder.decodeObjectForKey("studentStatus") as String
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = decodedImage
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        aCoder.encodeObject(self.studentStatus, forKey: "studentStatus")
        if self.image != nil {
            aCoder.encodeObject(self.image!, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
    
    func returnName() -> String {
        return "\(firstName) \(lastName)"
    }
    func returnImage() -> UIImage {
        return image!
    }
}
