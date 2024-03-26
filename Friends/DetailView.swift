//
//  DetailView.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import SwiftUI

struct DetailView: View {
    var user : User
    var body: some View {
        VStack{
            Text("\(user.registered)")
        }.navigationTitle(user.name)
    }
}

#Preview {
    DetailView(user: mockUser)
}
