//
//  College.swift
//  College Prifile Builder (Part A)
//
//  Created by Ananya Sehgal on 6/19/17.
//  Copyright © 2017 The Dawg. All rights reserved.
//

import UIKit

class College: NSObject {

    var name = ""
    var location = ""
    var enrollment = ""
    var image = UIImage(named: "default")
    
    init(Name: String, Location: String, Enrollment: String, Image: UIImage) {
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
        
    }
    
    init(Name: String, Location: String, Enrollment : String) {
        name = Name
        location = Location
        enrollment = Enrollment
        
        
    }
}
