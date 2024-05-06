//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 3.05.2024.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let _viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
