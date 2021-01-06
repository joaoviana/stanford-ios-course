//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Viana on 28/12/2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Finished Launching!")
    return true
    }
}
