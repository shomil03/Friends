//
//  User.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import Foundation
import SwiftUI

struct UserResponse : Codable{
    let response : [User]
}

struct User : Codable , Identifiable{
    let name : String
    let id : UUID
    let age : Int
    let company : String
    let email : String
    let about : String
    var registered : Date
    let tags : [String]
    let friends : [Friend]
    let isActive : Bool
}

struct Friend : Codable{
    let id : UUID
    let name : String
}

let mockUser = User(name: "Mock", id: UUID(), age: 32, company: "", email: "", about: "", registered: Date.now, tags: [], friends: [], isActive: true)
