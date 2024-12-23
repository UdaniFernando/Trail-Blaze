//
//  Trail_BlazeApp.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 18/09/2024.
//

import SwiftUI

@main
struct Trail_BlazeApp: App {
    @StateObject private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onAppear {
                    if locationManager.authorizationStatus == .notDetermined {
                        locationManager.requestPermission()
                    }
                }
        }
    }
}
