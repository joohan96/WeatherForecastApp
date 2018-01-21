//
//  HomeViewController.swift
//  DocuSignChallenge
//
//  Created by Joohan Oh on 2018-01-20.
//  Copyright © 2018 Joohan Oh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class HomeViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    var weatherForecastModels: [WeatherForecastModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateField.delegate = self
        searchField.delegate = self
        stateField.becomeFirstResponder()
    }
    
    @IBAction func searchButtomPressed(_ sender: Any) {
        guard !searchField.text!.isEmpty || !stateField.text!.isEmpty else {
            let alertController = UIAlertController (title: nil, message: "All fields must be filled", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        downloadWeatherForecast(state: stateField.text!, city: searchField.text!.replacingOccurrences(of: " ", with: "_")) { responseJSON in
            if let forecastJSON = responseJSON["forecast"] as? [String: Any] {
                if let txt_forecastJSON = forecastJSON["txt_forecast"] as? [String: Any] {
                    if let forecastdayJSON = txt_forecastJSON["forecastday"] as? [[String: AnyObject]] {
                        self.weatherForecastModels = Mapper<WeatherForecastModel>().mapArray(JSONArray: forecastdayJSON)
                        let weatherForecastTableNavVC = UIStoryboard(name: "WeatherForecastTableViewController", bundle: nil).instantiateInitialViewController() as! UINavigationController
                        let weatherForecastTableVC = weatherForecastTableNavVC.viewControllers.first as! WeatherForecastTableViewController
                        weatherForecastTableVC.weatherForecastModels = self.weatherForecastModels
                        self.present(weatherForecastTableNavVC, animated: true, completion: nil)
                    }
                }
            } else {
                self.showErrorAlert()
            }
        }
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController (title: nil, message: "No cities match your search query", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
        return
    }
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    // Called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === stateField  {
            stateField.resignFirstResponder()
            searchField.becomeFirstResponder()
        } else if textField === searchField {
            searchField.resignFirstResponder()
        }
        return true
    }
    
    // Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: - Alamafire HTTP Request
extension HomeViewController {
    func downloadWeatherForecast(state: String, city: String, completion: @escaping ([String: Any]) -> Void) {
        let requestURL = "http://api.wunderground.com/api/24f0b7e4ed53f605/forecast/q/" + state + "/" + city + ".json";
        print(requestURL)
        Alamofire.request(
            requestURL
            ).responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(response.error!)")
                    completion([String: Any]())
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: Any] else {
                    print("Invalid tag information received from the service")
                    completion([String: Any]())
                    return
                }
                
                completion(responseJSON)
        }
    }
}

