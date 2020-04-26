//
//  AppSettings.swift
//  Jobify
//
//  Created by Giovanni  Raininger  on 25/04/2020.
//  Copyright © 2020 Giovanni  Raininger . All rights reserved.
//

import Foundation

class AppSettings {
    
    static var name = ""
    static var firstName = ""
    
    static func setName(nameToSave: String) {
        name = nameToSave
    }
    static func setFirstName(firstNameToSave: String) {
        firstName = firstNameToSave
    }
    
    
    static func getName() -> String {
        return name
    }
    static func getFirstName() -> String {
        return firstName
    }
    
    
    
}
