//
//  ContentView.swift
//  FirebaseTutorial_signUpPage
//
//  Created by Dev Patel on 17/06/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            Color(.black)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000,height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            VStack(spacing:30) {
                
                Text("Welcome")
                    .foregroundStyle(.white)
                    .font(.system(size:45, weight: .bold, design: .rounded))
                    .padding()
                    .frame(width: 400,height: 100,alignment: .leading)
                    .offset(y:-100)
                
                TextField("Email",text:$email)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundStyle(.white)
                
                SecureField("Password",text: $password)
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350,height: 1)
                    .foregroundStyle(.white)
                    
                Button(action: {
                    register()
                }, label: {
                    Text("Sign Up")
                        .foregroundStyle(.white)
                        .frame(width: 150,height: 50)
                        .background(.linearGradient(colors: [.pink,.red], startPoint: .top, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle( cornerRadius: 50))
                })
                .padding(.top)
                .offset(y:80)
                
                Button(action: {
                    login()
                }, label: {
                    Text("Already have an Account? Login")
                        .foregroundStyle(.white)
                        .bold()
                })
                .padding(.top)
                .offset(y:80)
            }
            
            .frame(width:350)
        }
        .ignoresSafeArea()
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result,error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
