//
//  ExploreHeaderView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ExploreHeaderView: UIView {
    
    var username: String = "Harry Potter"
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner,
                                    .layerMaxXMaxYCorner]  // 좌, 우 하단 적용
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 20)
        view.layer.shadowRadius = 5
        
        // view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        // 선택적으로 그림자 경로를 설정하여 성능 최적화
        return view
    }()
    
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "환영합니다, user"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "HakgyoansimBunpilR", size: 28)
//        label.textColor = .label
//        return label
//    }()
    
    let recommendSpotTitle: UILabel = {
        let label = UILabel()
        label.text = "랜덤 리스트, 이 곳은 어떤가요? 😀"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 18)
        label.textColor = .label
        return label
    }()
    
    let recommenSpotCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 300)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .secondarySystemBackground
//        collectionView.layer.cornerRadius = 5
//        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
//    let areaTitle: UILabel = {
//        let label = UILabel()
//        label.text = "지역을 선택해주세요😀"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "HakgyoansimBunpilR", size: 18)
//        label.textColor = .label
//        return label
//    }()
    
//    let areaCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 50)
//        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .secondarySystemBackground
//        collectionView.layer.cornerRadius = 5
//        collectionView.clipsToBounds = true
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()

//    let alarmButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(systemName: "bell"), for: .normal)
//        button.tintColor = .label
//        return button
//    }()
    
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        // titleLabel.text = "환영합니다, \(self.username)"
        
        addSubview(basicView)
        //basicView.addSubview(titleLabel)
        //basicView.addSubview(alarmButton)
        basicView.addSubview(recommendSpotTitle)
        basicView.addSubview(recommenSpotCollectionView)
//        basicView.addSubview(areaTitle)
//        basicView.addSubview(areaCollectionView)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureConstraints() {
       
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
//        let titleLabelConstraints = [
//            titleLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 30),
//            titleLabel.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -30),
//            titleLabel.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 75)
//        ]
//        
//        let alarmButtonConstraints = [
//            alarmButton.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -30),
//            alarmButton.topAnchor.constraint(equalTo: titleLabel.topAnchor)
//        ]
        
        let recommendSpotTitleConstraints = [
            recommendSpotTitle.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            recommendSpotTitle.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 10)
        ]
        
        let recommenSpotCollectionViewConstraints = [
            recommenSpotCollectionView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            recommenSpotCollectionView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            recommenSpotCollectionView.topAnchor.constraint(equalTo: recommendSpotTitle.bottomAnchor, constant: 10),
            recommenSpotCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
//        let areaTitleConstraints = [
//            areaTitle.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 30),
//            areaTitle.topAnchor.constraint(equalTo: recommenSpotCollectionView.bottomAnchor, constant: 10)
//        ]
        
//        let areaCollectionViewConstraints = [
//            areaCollectionView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 20),
//            areaCollectionView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -20),
//            areaCollectionView.topAnchor.constraint(equalTo: areaTitle.bottomAnchor, constant: 10),
//            areaCollectionView.heightAnchor.constraint(equalToConstant: 120)
//        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(recommendSpotTitleConstraints)
//        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(alarmButtonConstraints)
        NSLayoutConstraint.activate(recommenSpotCollectionViewConstraints)
//        NSLayoutConstraint.activate(areaTitleConstraints)
 //       NSLayoutConstraint.activate(areaCollectionViewConstraints)
    }
}
