//
//  SelectFoodCell.swift
//  EatTogether
//
//  Created by 박진수 on 20/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

class SelectFoodCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodtitleLabel: UILabel!

    func update(item: SelectFood) {
        self.foodImageView.image = UIImage(named: item.imageName)
        self.foodtitleLabel.text = item.foodName
    }
}
