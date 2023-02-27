//
//  FifaBattleApp.swift
//  FifaBattle
//
//  Created by Sharma on 01/02/2023.
//

import SwiftUI
import Firebase

@main
struct FifaBattleApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                         [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            
            return true
        }
    }
}
