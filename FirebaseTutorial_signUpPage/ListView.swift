//
//  ListView.swift
//  FirebaseTutorial_signUpPage
//
//  Created by Dev Patel on 18/06/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    var body: some View {
        NavigationView(){
            List(dataManager.dogs, id: \.id){ dog in
                Text(dog.breed)
            }
            .navigationTitle("Dogs")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
                }, label: {
                    Image(systemName: "plus")
                })).sheet(isPresented: $showPopup){
                NewDog()
            }
        }
    }
} 

#Preview {
    ListView()
        .environmentObject(DataManager())
}
