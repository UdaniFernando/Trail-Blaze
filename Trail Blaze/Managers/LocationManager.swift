//
//  LocationManager.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 09/12/2024.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation? // To store the user's current location
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined // To track authorization status
    
    @Published var countries: [Country] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        fetchCountries()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
        locationManager.stopUpdatingLocation() // Stop updates to save battery
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            startUpdatingLocation()
        }
    }
    
    
    // Fetch the list of countries
    private func fetchCountries() {
        // Use approximate world data for demo
        let geoCoder = CLGeocoder()
        DispatchQueue.global().async {
            let countryNames = Locale.isoRegionCodes.compactMap { code in
                Locale.current.localizedString(forRegionCode: code)
            }
            
            var countries = [Country]()
            let group = DispatchGroup()
            
            for name in countryNames {
                group.enter()
                geoCoder.geocodeAddressString(name) { placemarks, error in
                    defer { group.leave() }
                    
                    if let placemark = placemarks?.first, let location = placemark.location {
                        let latitude = location.coordinate.latitude
                        let longitude = location.coordinate.longitude
                        let country = Country(name: name, latitude: latitude, longitude: longitude)
                        countries.append(country)
                    }
                }
            }
            
            group.notify(queue: .main) {
                self.countries = countries.sorted { $0.name < $1.name } // Sort alphabetically for consistency
            }
        }
    }
}
