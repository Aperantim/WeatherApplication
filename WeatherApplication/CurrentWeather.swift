//
//  CurrentWeather.swift
//  WeatherApplication
//
//  Created by Виталий on 28.02.2020.
//  Copyright © 2020 Aperantim. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure))mm"
    }
    var temperatureString: String {
        return "\(temperature)˚C"
    }
    var apparentTemperatureString: String {
        return "Feels like \(apparentTemperature)˚C"
    }
    var humidityString: String {
        return "\(Int(humidity))%"
    }
}

