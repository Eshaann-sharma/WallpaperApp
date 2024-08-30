//
//  t2App.swift
//  t2
//
//

import SwiftUI
import Firebase

@main
struct t2App: App {
    @StateObject var vm = DataManager()
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView().preferredColorScheme(.dark)
        }
    }
}
