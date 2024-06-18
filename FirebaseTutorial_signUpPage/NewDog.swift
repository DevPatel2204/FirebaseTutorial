//
//  NewDog.swift
//  FirebaseTutorial_signUpPage
//
//  Created by Dev Patel on 18/06/24.
//

import SwiftUI

struct NewDog: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newdog = ""
    var body: some View {
        TextField("Add New Dog Name" , text: $newdog)
            .padding()
            .font(.title3)
            .fontWidth(.standard)
            .bold()
        Button(action: {
            dataManager.addDog(dogbreed: newdog)
        }, label: {
            Text("Save")
                .foregroundStyle(.white)
                .frame(width: 80,height: 40)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        })
        .padding()
    }
}

#Preview {
    NewDog()
}
