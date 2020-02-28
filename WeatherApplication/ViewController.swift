//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Виталий on 28.02.2020.
//  Copyright © 2020 Aperantim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTempertatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10.0, apparentTemperature: 5.0, humidity: 30, pressure: 750, icon: icon)
        updateUIWithCurrentWeather(currentWeather: currentWeather)
    }
    
    func updateUIWithCurrentWeather(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTempertatureLabel.text = currentWeather.apparentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }
}

