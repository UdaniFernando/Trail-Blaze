//
//  WeatherViewModel.swift
//  Trail Blaze
//
//  Created by Udani Fernando on 09/12/2024.
//

import Foundation
import SwiftUI
import WeatherKit
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = "--°C"
    @Published var description: String = "Loading..."
    @Published var cityName: String = ""

    private let weatherService = WeatherService.shared

    func fetchWeather(for location: CLLocation) {
        Task {
            do {
                let weather = try await weatherService.weather(for: location)
                DispatchQueue.main.async {
                    print("Weather ---- \(weather.currentWeather)")
                    self.temperature = "\(Int(weather.currentWeather.temperature.value))°C"
                    self.description = weather.currentWeather.condition.description
                }
            } catch {
                DispatchQueue.main.async {
                    self.description = "Failed to fetch weather: \(error.localizedDescription)"
                }
            }
        }
    }
}


extension WeatherViewModel {
    func fetchWeather(for city: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first, let location = placemark.location else {
                DispatchQueue.main.async {
                    self?.description = "Unable to find location"
                }
                return
            }
            self.cityName = placemark.locality ?? city
            self.fetchWeather(for: location)
        }
    }
}
