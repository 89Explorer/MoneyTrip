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
    var lastContentOffset: CGFloat = 0.0
    // 랜덤으로 받아온 관광지 정보를 담은 배열
    var randomSpotArray: [AttractionItem] = []
    var sectionsItems: [AttractionItem] = []
    
    // 앱이 닫혔다가 다시 열릴 때 갱신 조건을 위한 변수
    private let lastClosedKey = "lastClosedKey"
    
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
        configureSearchTitle()
        
        // 화면을 아래로 스크롤하면 네비게이션바 부분이 숨겨지고, 반대로 하면 나타나는 기능
        navigationController?.hidesBarsOnSwipe = true
        getRandomSpot()
        
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // getRandomSpot()
        //        exploreMainView.bodyView.sectionTableView.reloadData()
    }
    
    // 네비게이션바를 투명하게 만드는 함수
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //
    //        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    //        navigationController?.navigationBar.shadowImage = UIImage()
    //        navigationController?.navigationBar.isTranslucent = true
    //    }
    
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
    
    /// exploreViewController 내에 네비게이션 바 부분에 제목과 버튼 기능 추가하는 함수
    func configureSearchTitle() {
        
        let titleLabel = UILabel()
        titleLabel.text = "환영합니다. Harry Potter"
        titleLabel.textColor = .label
        titleLabel.font = UIFont(name: "HakgyoansimBunpilR", size: 24)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let alarmButton = UIButton(type: .system)
        alarmButton.setImage(UIImage(systemName: "bell"), for: .normal)
        alarmButton.tintColor = .label
        alarmButton.addTarget(self, action: #selector(didTappedAlarmbutton), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: alarmButton)
    }
    
    /// 홈화면 컬렉션뷰 관련 델리게이트 밑 데이터소스를 지정하는 함수
    func configureCollectionView() {
        exploreMainView.headerView.recommenSpotCollectionView.delegate = self
        exploreMainView.headerView.recommenSpotCollectionView.dataSource = self
        exploreMainView.headerView.recommenSpotCollectionView.register(RecommendSpotCollectionViewCell.self, forCellWithReuseIdentifier: RecommendSpotCollectionViewCell.identifier)
        
        //        exploreMainView.headerView.areaCollectionView.delegate = self
        //        exploreMainView.headerView.areaCollectionView.dataSource = self
        //        exploreMainView.headerView.areaCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
    
    
    @objc func didTappedAlarmbutton() {
        print("didTappedAlarmbutton() - called")
    }
    
    @objc func appWillResignActive() {
        // 앱이 백그라운드로 가기 전에 현재 시간을 저장
        UserDefaults.standard.set(Date(), forKey: lastClosedKey)
    }

    @objc func appDidBecomeActive() {
        // 앱이 포그라운드로 돌아왔을 때
        if let lastClosedDate = UserDefaults.standard.object(forKey: lastClosedKey) as? Date {
            let timeInterval = Date().timeIntervalSince(lastClosedDate)
            // 마지막 닫힌 시간으로부터 일정 시간이 지났는지 확인
            if timeInterval > 60 * 5 { // 예: 5분 이상 경과
                getRandomSpot() // 데이터 갱신
            }
        }
    }
    
    
    func getRandomSpot() {
        NetworkManager.shared.fetchRandomAttractions { result in
            switch result {
            case .success(let item):
                self.randomSpotArray = item.response.body.items.item
                DispatchQueue.main.async {
                    self.exploreMainView.headerView.recommenSpotCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


// MARK: - Extensions
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == exploreMainView.headerView.recommenSpotCollectionView {
            return randomSpotArray.count
        }
        
        //        if collectionView == exploreMainView.headerView.areaCollectionView {
        //            return 17
        //        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreMainView.headerView.recommenSpotCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendSpotCollectionViewCell.identifier, for: indexPath) as? RecommendSpotCollectionViewCell else { return UICollectionViewCell() }
            
            let selectedItem = randomSpotArray[indexPath.item]
            cell.getRandomSpot(with: selectedItem)
            return cell
        }
        
        //        if collectionView == exploreMainView.headerView.areaCollectionView {
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //            cell.backgroundColor = .systemYellow
        //            return cell
        //        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = randomSpotArray[indexPath.item]
        
        let detailVC = DetailViewController()
        detailVC.selectedSpotItem = selectedItem
        navigationController?.pushViewController(detailVC, animated: true)
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
        
        var selectedCategory: ContentCategory?
        
        switch indexPath.section {
        case 0:
            selectedCategory = .attractions
        case 1:
            selectedCategory = .facilities
        case 2:
            selectedCategory = .foods
        case 3:
            selectedCategory = .course
            
        case 4:
            selectedCategory = .shopping
        default:
            return UITableViewCell()
        }
        
        if let category = selectedCategory {
            cell.getSectionData(contentTypeId: category.contentTypeId)
        }
        
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



// MARK: - Enum
enum ContentCategory: String {
    case attractions = "12"
    case facilities = "14"
    case foods = "39"
    case course = "25"
    case shopping = "38"
    
    var contentTypeId: String {
        return self.rawValue
    }
}
