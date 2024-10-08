//
//  ExploreViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: - Variables
    var categories: [String] = ["자연 여행", "문화 여행", "음식 여행", "코스 여행", "쇼핑 여행"]

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
        configureTableView()
    }
    
    // 네비게이션바를 투명하게 만드는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
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
    
    /// 홈화면 테이블뷰 관련 델리게이트 및 데이터소스를 지정하는 함수
    func configureTableView() {
        exploreMainView.bodyView.sectionTableView.delegate = self
        exploreMainView.bodyView.sectionTableView.dataSource = self
        exploreMainView.bodyView.sectionTableView.register(SectionTableViewCell.self, forCellReuseIdentifier: SectionTableViewCell.identifier)
    }
    
    /// 테이블 섹션 타이틀 "더보기" 버튼 함수
    @objc func moreButtonTapped(_ sender: UIButton) {
        print("더 보기 버튼 클릭 ")
    }
}


// MARK: - Extensions
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


extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.identifier, for: indexPath) as? SectionTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .systemOrange
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView,viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(categories[section])"
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 16)
        label.textColor = .label
        label.backgroundColor = .clear
        label.textAlignment = .left
        
        headerView.addSubview(label)
        
        let moreButton = UIButton(type: .system)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.setTitle("더 보기", for: .normal)
        moreButton.titleLabel?.font = UIFont(name: "HakgyoansimBunpilR", size: 16)
        moreButton.setTitleColor(.label, for: .normal)
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
        
        headerView.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: headerView.topAnchor),
            
            // 더보기 버튼의 제약조건
            moreButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            moreButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -5),
        ])
        
        return headerView
    }
}
