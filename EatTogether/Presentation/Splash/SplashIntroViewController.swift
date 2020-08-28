//
//  SplashIntroViewController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

class SplashIntroViewController: BasePageChildViewController {

    @IBOutlet weak var nicknameTextField: FormTextField!
    @IBOutlet weak var helloTextView: UITextView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pageIndex = .intro
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
