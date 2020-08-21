//
//  BasePageViewController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

enum PageIndex: Int {
    case selectFood
    case selectGender
    case intro
    
    var next: PageIndex {
        return PageIndex(rawValue: self.rawValue + 1) ?? .selectFood
    }
    
    var previous: PageIndex {
        return PageIndex(rawValue: self.rawValue - 1) ?? .selectFood
    }
    
    var actualValue: Int {
        return self.rawValue + 1
    }
    
    var buttonTitle: String {
        switch self {
        case .selectGender, .selectFood:
            return "다음 (\(self.rawValue + 1)/3)"
        case .intro:
            return "시작하기"
        }
    }
    
    var title: String {
        switch self {
        case .selectFood:
            return "먹고싶은 음식을\n선택해주세요!"
        case .selectGender:
            return "성별을\n선택하세요"
        case .intro:
            return "닉네임과\n인사말을 작성해주세요"
        }
    }
    
    var isBackButtonHidden: Bool {
        if self == .selectFood { return true }
        else { return false }
    }
}

class BasePageChildViewController: UIViewController {
    var dataController: SplashDataController?
    var pageIndex: PageIndex = .selectFood
}
