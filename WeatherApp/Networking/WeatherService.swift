//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 3.05.2024.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject {
    private let locationManager = CLLocationManager()
    private let API_KEY = "09479b83cf0132ec207ec56a1b34f82e"
    private var completionHandler: ((Weather) -> Void)?

    public override init() {
        super.init()
        locationManager.delegate = self
    }

    public func loadWeatherData(_ completionHandler: @escaping((Weather) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    private func makeDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Unable to fetch weather data: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Unable to fetch weather data: No data")
                return
            }
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.completionHandler?(Weather(response: response))
            } else {
                print("Unable to decode weather data")
            }
        }.resume()
    }
}

extension WeatherService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            print("Unable to fetch weather data: No location")
            return
        }
        makeDataRequest(forCoordinates: location.coordinate)
        locationManager.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to fetch weather data: \(error.localizedDescription)")
    }
}


struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
    
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
