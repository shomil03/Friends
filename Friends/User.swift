//
//  User.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class User : Codable{
    
    enum CodingKeys : String , CodingKey{
        case name,id,age,company,email,about,registered,tags,friends,isActive
    }
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
    init(name: String, id: UUID, age: Int, company: String, email: String, about: String, registered: Date, tags: [String], friends: [Friend], isActive: Bool) {
        self.name = name
        self.id = id
        self.age = age
        self.company = company
        self.email = email
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
        self.isActive = isActive
    }
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
}

//struct UserResponse : Codable{
//    let response : [User]
//}

//struct User : Codable , Identifiable{
//    let name : String
//    let id : UUID
//    let age : Int
//    let company : String
//    let email : String
//    let about : String
//    var registered : Date
//    let tags : [String]
//    let friends : [Friend]
//    let isActive : Bool
//}

struct Friend : Codable{
    let id : UUID
    let name : String
}

let mockUser = User(name: "Mock", id: UUID(), age: 32, company: "", email: "", about: "", registered: Date.now, tags: [], friends: [], isActive: true)
