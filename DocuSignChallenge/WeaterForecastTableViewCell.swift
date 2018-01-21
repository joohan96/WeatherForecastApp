//
//  WeaterForecastTableViewCell.swift
//  DocuSignChallenge
//
//  Created by Joohan Oh on 2018-01-20.
//  Copyright © 2018 Joohan Oh. All rights reserved.
//

import UIKit
import SDWebImage

class WeaterForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(imageURL: String, day: String, description: String) {
        weatherIconImageView.sd_setImage(with: URL(string:imageURL))
        dayOfTheWeek.text = day
        weatherDescription.text = description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
