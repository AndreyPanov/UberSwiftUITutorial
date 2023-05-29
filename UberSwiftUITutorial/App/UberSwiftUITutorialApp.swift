//
//  UberSwiftUITutorialApp.swift
//  UberSwiftUITutorial
//
//  Created by Andrey Panov on 28/05/2023.
//

import SwiftUI

@main
struct UberSwiftUITutorialApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
