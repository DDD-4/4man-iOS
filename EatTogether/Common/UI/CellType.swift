//
//  CellType.swift
//  EatTogether
//
//  Created by 박진수 on 2020/08/21.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

enum CellType: String {
    case selectFood
    
    var identifier: String {
        return self.rawValue + "Cell"
    }
    
    var size: CGSize {
        switch self {
        case .selectFood:
            return CGSize(width: (UIScreen.main.bounds.width - 60) / 3 + 2, height: 90)
        }
    }
}
