//
//  WeatherForecastTableViewController.swift
//  DocuSignChallenge
//
//  Created by Joohan Oh on 2018-01-20.
//  Copyright © 2018 Joohan Oh. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherForecastTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weatherForecastModels: [WeatherForecastModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.register(UINib(nibName: "WeaterForecastTableViewCell", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "WeaterForecastTableViewCell")
        setUpNavigationBar()
    }
    
    func setUpNavigationBar() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "exit")?.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        button.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        button.imageEdgeInsets = UIEdgeInsets(top: 16.85, left: 0.0, bottom: 16.85, right: 34.0)
        button.addTarget(self, action:#selector(backToHome), for: UIControlEvents.touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func backToHome() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension WeatherForecastTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecastModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeaterForecastTableViewCell", for: indexPath) as! WeaterForecastTableViewCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        let weatherForecast = weatherForecastModels[indexPath.row]
        cell.setUpView(imageURL: weatherForecast.imageURL, day: weatherForecast.day, description: weatherForecast.description)
        return cell
    }
}
