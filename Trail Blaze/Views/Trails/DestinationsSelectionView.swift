//
//  DestinationsSelectionView.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 11/12/2024.
//

import SwiftUI

struct DestinationsSelectionView: View {
    @StateObject private var locationManager = LocationManager()
    
    @State private var searchText = ""
    @State private var selectedCountry: Country?
    
    var body: some View {
        VStack {
            // Search Bar
            TextField("I'm going...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: searchText) { _ in
                    filterCountries()
                }

            // Country Suggestions List
            if !searchText.isEmpty {
                List {
                    ForEach(filteredCountries, id: \.name) { country in
                        Button(action: {
                            selectCountry(country)
                        }) {
                            Text(country.name)
                        }
                    }
                }
                .frame(height: 200) // Limit height for suggestions
            }

            // Globe View
            if let _ = locationManager.userLocation {
                Globe3DView(userLocation: $locationManager.userLocation, selectedCountry: $selectedCountry)
            }
        }
        .onAppear {
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // Filtered list of countries based on search
        @State private var filteredCountries: [Country] = []

        private func filterCountries() {
            if searchText.isEmpty {
                filteredCountries = []
            } else {
                filteredCountries = locationManager.countries.filter {
                    $0.name.lowercased().contains(searchText.lowercased())
                }
            }
        }

        private func selectCountry(_ country: Country) {
            searchText = "" // Clear the search bar
            filteredCountries = [] // Hide suggestions
            DispatchQueue.main.async {
                selectedCountry = country // Set the selected country
            }
        }
}

#Preview {
    DestinationsSelectionView()
}
