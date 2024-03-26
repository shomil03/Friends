//
//  ContentView.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var UserData = [User]()
    @Environment(\.modelContext) var modelContext
    @Query var users : [User]
    var body: some View {
        NavigationStack{
            List{
                ForEach(users){user in
                    NavigationLink{
                        DetailView(user: user)
                    }label:{
                        HStack{
                            Text(user.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            ActivityView(isactive: user.isActive)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .listStyle(.inset)
                .navigationTitle("Peoples")
        }
        .onAppear{
            if(UserData.isEmpty){
                Task{
                    do{
                        UserData =  try await NetworkManager.shared.NetworkCall()
                        save(users: UserData)
                    }catch{}
                }
            }
        }
        .padding()
    }
    func save(users : [User]){
        for user in users{
            modelContext.insert(user)
        }
    }
}

#Preview {
    ContentView()
}
