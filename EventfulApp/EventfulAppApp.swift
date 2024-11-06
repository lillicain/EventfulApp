//
//  EventfulAppApp.swift
//  EventfulApp
//
//  Created by Lilli Cain on 10/21/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct EventfulAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
//    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authenticationViewModel.userSession == nil {
                    PangeaView()
                    
                } else {
                    TabScreen()
                        .modifier(DarkModeViewModifier())
                }
            }
            .environmentObject(authenticationViewModel)
//            .environmentObject(locationManager)
        }
    }
}

