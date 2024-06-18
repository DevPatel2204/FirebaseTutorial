//
//  FirebaseTutorial_signUpPageApp.swift
//  FirebaseTutorial_signUpPage
//
//  Created by Dev Patel on 17/06/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseTutorial_signUpPageApp: App {
    
    @StateObject var dataManager = DataManager()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(DataManager())
        }
    }
}
