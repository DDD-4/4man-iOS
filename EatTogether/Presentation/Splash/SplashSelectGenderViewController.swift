//
//  SplashSelectGenderViewController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

class SplashSelectGenderViewController: BasePageChildViewController {

    @IBOutlet weak var manView: UIView!
    @IBOutlet weak var womanView: UIView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pageIndex = .selectGender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
