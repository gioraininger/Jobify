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
    static var uid = ""
    
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
    
    static func saveUid(userId: String) {
        uid = userId
    }
    
    static func getUid() -> String {
        return uid
    }
    
    
    
    static func getMessages(userId: String) -> [Message] {
        var messages = [Message]()
    
        
        switch userId {
        case "kKex48cNMCTj5xxAA6GENO6NkWz1":
            messages.append(Message(senderId: "John Smith", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Lara White", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Daniel Williams", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Anna Dallas", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Sam Dickinson", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "John Smith", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Josefine Brown", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Benjamin Stolls", recipientId: "Franco Manca", messageBody: "Hi guys, how are you doing? I am messaging you regarding your position at Franco Manca as waiter. I was thinking to apply and cover your shift. Would I need to wear anyWe think you would be a good candidate to cover out position, please let us know if that would interest you. Thanks"))


        case "uV71jpXNi8feor1Efrm99s5yJ1y1":
            messages.append(Message(senderId: "Franco Manca", recipientId: "John", messageBody: "Hi John, how are you doing? I am messaging you regarding our position at Franco Manca as waiter. We think you would be a good candidate to cover our position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Al Forno", recipientId: "Giovanni", messageBody: "Hi John, how are you doing? I am messaging you regarding our position at Franco Manca as waiter. We think you would be a good candidate to cover our position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Côte Brasserie", recipientId: "Giovanni", messageBody: "Hi John, how are you doing? I am messaging you regarding our position at Franco Manca as waiter. We think you would be a good candidate to cover our position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "The French Table", recipientId: "Giovanni", messageBody: "Hi John, how are you doing? I am messaging you regarding our position at Franco Manca as waiter. We think you would be a good candidate to cover our position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Costa Coffee", recipientId: "Giovanni", messageBody: "Hi John, how are you doing? I am messaging you regarding our position at Franco Manca as waiter. We think you would be a good candidate to cover our position, please let us know if that would interest you. Thanks"))
            messages.append(Message(senderId: "Pink Garlic", recipientId: "Giovanni", messageBody: "Hi John! We would love to have you working with us for our shift available as kitchen staff. Please let us know if that would interest you. Have a good day, hope to work together soon"))
             messages.append(Message(senderId: "Naturally Chinese", recipientId: "Giovanni", messageBody: "Hi John! We would love to have you working with us for our shift available as kitchen staff. Please let us know if that would interest you. Have a good day, hope to work together soon"))
             messages.append(Message(senderId: "Riverside Vegetaria", recipientId: "Giovanni", messageBody: "Hi John! We would love to have you working with us for our shift available as kitchen staff. Please let us know if that would interest you. Have a good day, hope to work together soon"))
            
            
        case "ANotherrID":
            messages.append(Message(senderId: "", recipientId: "", messageBody: ""))
            messages.append(Message(senderId: "", recipientId: "", messageBody: ""))
        default:
            print("No messages")
        }
        
        return messages
    }
    
}
