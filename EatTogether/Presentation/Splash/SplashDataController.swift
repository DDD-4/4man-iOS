//
//  SplashDataController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import Foundation

class SplashDataController {
    private let apiService = ApiService()
    
    func getFoodList() -> [SelectFood] {
         [
            SelectFood(imageName: "KoreanFood", foodName: "한식"),
            SelectFood(imageName: "JapaneseFood", foodName: "돈까스·회·일식"),
            SelectFood(imageName: "WesternFood", foodName: "양식"),
            SelectFood(imageName: "FastFood", foodName: "패스트푸드"),
            SelectFood(imageName: "ChineseFood", foodName: "중국집"),
            SelectFood(imageName: "FlourFood", foodName: "분식"),
            SelectFood(imageName: "Cafe", foodName: "카페·디저트"),
            SelectFood(imageName: "AsianFood", foodName: "아시안·양식"),
            SelectFood(imageName: "Seafood", foodName: "해산물")
        ]
    }
}
