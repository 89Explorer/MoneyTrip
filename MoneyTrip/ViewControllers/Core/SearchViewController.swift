//
//  SearchViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // explore 뷰 내에 최상단 카테고리 함수
//    func getExploreCollectionView() {
//
//        exploreMainView.headerView.mainCategoryCollectionView.delegate = self
//        exploreMainView.headerView.mainCategoryCollectionView.dataSource = self
//        exploreMainView.headerView.mainCategoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//
//        exploreMainView.headerView.firstCategoryCollectionView.delegate = self
//        exploreMainView.headerView.firstCategoryCollectionView.dataSource = self
//        exploreMainView.headerView.firstCategoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//    }
}
//
//
//extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == exploreMainView.headerView.mainCategoryCollectionView {
//            return 5
//        }
//
//        if collectionView == exploreMainView.headerView.firstCategoryCollectionView {
//            return 6
//        }
//
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == exploreMainView.headerView.mainCategoryCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//
//            cell.backgroundColor = .brown
//
//            return cell
//        }
//
//        if collectionView == exploreMainView.headerView.firstCategoryCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//
//            cell.backgroundColor = .systemBlue
//            return cell
//        }
//
//        return UICollectionViewCell()
//    }
//}


