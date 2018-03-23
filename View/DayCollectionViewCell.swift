//
//  DayCollectionViewCell.swift
//  Weather
//
//  Created by Maxim  on 3/21/18.
//  Copyright © 2018 Maxim. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var skyLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var maxTemplabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var currentCityTopSpacing: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            currentCityTopSpacing.constant = 112
        }
    }

}
