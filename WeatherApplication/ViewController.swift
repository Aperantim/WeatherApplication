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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        toogleActivityIndicator(on: true)
        getCurrentWeatherData()
    }
    
    func toogleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    lazy var weatherManager = APIWeatherManager(apiKey: "6b264b0362fc7e62029c39e8d782437b")
    let coordinates = Coordinates(latitude: 59.933027, longitude: 30.335890)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeatherData()
        
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            self.toogleActivityIndicator(on: false)
            
            switch result {
            case .Success(let currentWeather):
                self.updateUIWithCurrentWeather(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                self.alertError(title: "Unable to get data", message: "\(error.localizedDescription)", error: error)
            }
        }
    }
    
    func updateUIWithCurrentWeather(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTempertatureLabel.text = currentWeather.apparentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }
    
    func alertError(title: String, message: String, error: NSError) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        
        present(alertController, animated: true)
    }
}

