//
//  NetworkManager.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import Foundation
import SwiftUI

class NetworkManager{
    let url = "https://www.hackingwithswift.com/samples/friendface.json"
    static let shared = NetworkManager()
    func NetworkCall() async throws -> [User]{
//        check validity of url
        guard let url = URL(string: url) else{
//            return [User(name: "WrongURL", id: UUID(), age: 1, company: "", email: "", abount: "", registered: Date.now, tags: [] )]
            return []
        }
        
        let (data , _) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)
            print(users[0].registered)
            return users
        }catch{
//            return [User(name: "InCatchblock", id: UUID(), age: 1, company: "", email: "", abount: "", registered: Date.now, tags: [])]
            return []
        }
    }
}
