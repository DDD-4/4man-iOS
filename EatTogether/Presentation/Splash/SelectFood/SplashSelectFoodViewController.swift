//
//  SplashSelectFoodViewController.swift
//  EatTogether
//
//  Created by 박진수 on 19/08/2020.
//  Copyright © 2020 FourMan. All rights reserved.
//

import UIKit

class SplashSelectFoodViewController: BasePageChildViewController {
    @IBOutlet weak var foodCollectionView: UICollectionView!

    private var foodList: [SelectFood] = [] {
        didSet {
            self.foodCollectionView.reloadData()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pageIndex = .selectFood
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        updateData()
    }

    private func updateData() {
        foodList = dataController?.getFoodList() ?? []
    }

}

extension SplashSelectFoodViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectFoodCell", for: indexPath)
        if let foodCell = cell as? SelectFoodCell {
            foodCell.update(item: foodList[indexPath.item])
        }
        return cell

    }


}
