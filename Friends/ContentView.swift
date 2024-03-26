//
//  ContentView.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var UserData = [User]()
    var body: some View {
        NavigationStack{
            List{
                ForEach(UserData){user in
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
//                        print(UserData)
                    }catch{}
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
