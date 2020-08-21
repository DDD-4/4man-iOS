//
//  SplashRootViewController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit


class SplashRootViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

    private lazy var viewControllers: [UIViewController] = [
        SplashSelectFoodViewController.pageChildViewController(dataController: dataController)!,
        SplashSelectGenderViewController.pageChildViewController(dataController: dataController)!,
        SplashIntroViewController.pageChildViewController(dataController: dataController)!
    ]
    private var pageViewController: UIPageViewController?
    private var currenViewController: UIViewController?
    private var currentPageIndex: PageIndex = .selectFood
    private let dataController = SplashDataController()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.currenViewController = viewControllers[0]
        self.pageViewController?.setViewControllers([viewControllers[currentPageIndex.rawValue]], direction: .forward, animated: false, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? UIPageViewController {
            self.pageViewController = pageViewController

        }
    }


    @IBAction func transitionPage(_ sender: UIButton) {
        var transitionPageIndex: PageIndex = .selectFood
        var pageDirection: UIPageViewController.NavigationDirection = .forward

        switch sender {
        case nextButton:
            if transitionPageIndex == .intro {
                // TODO: - 다음 페이지
                return
            }
            transitionPageIndex = currentPageIndex.next
            pageDirection = .forward

        case backButton:
            transitionPageIndex = currentPageIndex.previous
            pageDirection = .reverse
        default: break
        }
        self.nextButton.setTitle(transitionPageIndex.buttonTitle, for: .normal)
        self.titleLabel.text = transitionPageIndex.title
        self.backButton.isHidden = transitionPageIndex.isBackButtonHidden
        self.currentPageIndex = transitionPageIndex

        self.pageViewController?.setViewControllers([viewControllers[transitionPageIndex.rawValue]], direction: pageDirection, animated: true, completion: nil)
    }
}


