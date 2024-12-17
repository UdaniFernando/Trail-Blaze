//
//  DestinationsSelectionView.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 11/12/2024.
//

import SwiftUI

struct DestinationsSelectionView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let _ = locationManager.userLocation {
                Globe3DView(userLocation: $locationManager.userLocation)
            }
            
        }
        .onAppear {
            locationManager.startUpdatingLocation()
        }
    }
}

#Preview {
    DestinationsSelectionView()
}
