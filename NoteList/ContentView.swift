//
//  ContentView.swift
//  NoteList
//
//  Created by Ahmad on 07/10/1440 AH.
//  Copyright © 1440 Ahmad. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    

    
    @State var firstName = ""
    @State var users = [String]()
    @State var showingAlert = false

    
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{

                    VStack{
                        
                        Group{
                            TextField($firstName, placeholder:Text("FirstName"))
                            }.padding(10).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 5))
                        HStack{

                        // add user in list
                        Button(action: {
                        
//                            self.firstName != "" ? self.users.append("User: \(self.firstName)")  : self.showingAlert = true

                            if (self.firstName != "" ){
                                self.users.append("User: \(self.firstName)")
                            }

                            else{ self.showingAlert = true }
                            self.firstName = ""
                            
                        }) {
                            Group{
                                Text("Add User")
                                    .color(.white)
                                
                                }.padding(10).background((self.firstName != "" ) ? Color.green : Color.gray).clipShape(RoundedRectangle(cornerRadius: 5))
                                .presentation($showingAlert) {
                                    Alert(title: Text("Please Add User"), dismissButton: .default(Text("Try Again")))
                            }
                        }
                            Spacer()
                   

                    // remove all users from list
                    Button(action: {
                        self.users.removeAll()
                    }) {
                        Group{
                            Image(systemName: "delete.left.fill")
                                .imageScale(.large)
                                 .foregroundColor(.red)
                            
                            }
                            }
                            
                             }
                       }
                    }.padding(10).background(Color.black)
            
                
                List(users.identified(by: \.self)){
                    
                    Text($0)
                }
            }.navigationBarTitle(Text("List User"))
                .navigationBarItems(leading:HStack {
                    Text("First Name: ")
                    Text("\(self.firstName)")
                })
            }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
