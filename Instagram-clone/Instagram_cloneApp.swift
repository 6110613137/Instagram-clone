//
//  Instagram_cloneApp.swift
//  Instagram-clone
//
//  Created by Kunatip Satsomnuk on 7/11/2564 BE.
//

import SwiftUI
import Firebase

@main
struct Instagram_cloneApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
