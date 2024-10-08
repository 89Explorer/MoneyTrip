//
//  ExploreViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ExploreViewController: UIViewController {

    // MARK: - UI Components
    let exploreMainView: ExploreMainView = {
        let view = ExploreMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(exploreMainView)
        configureConstraints()
        
        configureCollectionView()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {

        let exploreMainViewConstraint = [
            exploreMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exploreMainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exploreMainView.topAnchor.constraint(equalTo: view.topAnchor),
            exploreMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(exploreMainViewConstraint)
    }
    
    // MARK: - Functions

    /// 홈화면 컬렉션뷰 관련 델리게이트 밑 데이터소스를 지정하는 함수
    func configureCollectionView() {
        exploreMainView.headerView.recommenSpotCollectionView.delegate = self
        exploreMainView.headerView.recommenSpotCollectionView.dataSource = self
        exploreMainView.headerView.recommenSpotCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        exploreMainView.headerView.areaCollectionView.delegate = self
        exploreMainView.headerView.areaCollectionView.dataSource = self
        exploreMainView.headerView.areaCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}


extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == exploreMainView.headerView.recommenSpotCollectionView {
            return 5
        }
        
        if collectionView == exploreMainView.headerView.areaCollectionView {
            return 17
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreMainView.headerView.recommenSpotCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .systemRed
            return cell
        }
        
        if collectionView == exploreMainView.headerView.areaCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .systemYellow
            return cell 
        }
        
        return UICollectionViewCell()
    }
}
