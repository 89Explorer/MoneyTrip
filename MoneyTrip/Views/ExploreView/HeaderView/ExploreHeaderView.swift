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
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner,
                                    .layerMaxXMaxYCorner]  // 좌, 우 하단 적용
        view.layer.shadowColor = UIColor.systemMint.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 20
        
        // view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        // 선택적으로 그림자 경로를 설정하여 성능 최적화
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다, user"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 28)
        label.textColor = .label
        return label
    }()
    
    let recommenSpotCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 280)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.layer.cornerRadius = 5
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let areaTitle: UILabel = {
        let label = UILabel()
        label.text = "지역을 선택해주세요😀"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 18)
        label.textColor = .label
        return label
    }()
    
    let areaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 50)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.layer.cornerRadius = 5
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    let alarmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        titleLabel.text = "환영합니다, \(self.username)"
        
        addSubview(basicView)
        basicView.addSubview(titleLabel)
        basicView.addSubview(alarmButton)
        basicView.addSubview(recommenSpotCollectionView)
        basicView.addSubview(areaTitle)
        basicView.addSubview(areaCollectionView)
        
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
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -30),
            titleLabel.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 75)
        ]
        
        let alarmButtonConstraints = [
            alarmButton.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -30),
            alarmButton.topAnchor.constraint(equalTo: titleLabel.topAnchor)
        ]
        
        let recommenSpotCollectionViewConstraints = [
            recommenSpotCollectionView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 20),
            recommenSpotCollectionView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -20),
            recommenSpotCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            recommenSpotCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let areaTitleConstraints = [
            areaTitle.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 30),
            areaTitle.topAnchor.constraint(equalTo: recommenSpotCollectionView.bottomAnchor, constant: 10)
        ]
        
        let areaCollectionViewConstraints = [
            areaCollectionView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 20),
            areaCollectionView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -20),
            areaCollectionView.topAnchor.constraint(equalTo: areaTitle.bottomAnchor, constant: 10),
            areaCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(alarmButtonConstraints)
        NSLayoutConstraint.activate(recommenSpotCollectionViewConstraints)
        NSLayoutConstraint.activate(areaTitleConstraints)
        NSLayoutConstraint.activate(areaCollectionViewConstraints)
    }
}

    
//    // MARK: - UI Components
//    let basicView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemRed
//        return view
//    }()
//    
//    let headerTitleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Hello, Sarah"
//        label.font = .systemFont(ofSize: 24, weight: .bold)
//        label.textColor = .label
//        return label
//    }()
//    
//    let mainCategoryStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.distribution = .fill
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    let mainCategoryLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "관광 타입"
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 14, weight: .bold)
//        label.textColor = .label
//        return label
//    }()
//    
//    let mainCategoryCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 44)
//        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemMint
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
//    
//    
//    let firstCategoryStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.distribution = .fill
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    let firstCategoryLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "대분류"
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 14, weight: .bold)
//        label.textColor = .label
//        return label
//    }()
//    
//    let firstCategoryCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 44)
//        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemMint
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
//    
//    
//    let secondCategoryStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.distribution = .fill
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    let secondCategoryLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "중분류"
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 14, weight: .bold)
//        label.textColor = .label
//        return label
//    }()
//    
//    let secondCategoryCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 5
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 44)
//        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemMint
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
//    
//    
//    // MARK: - Initializations
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        addSubview(basicView)
//        
//        basicView.addSubview(headerTitleLabel)
//        
//        basicView.addSubview(mainCategoryStackView)
//        mainCategoryStackView.addArrangedSubview(mainCategoryLabel)
//        mainCategoryStackView.addArrangedSubview(mainCategoryCollectionView)
//        
//        basicView.addSubview(firstCategoryStackView)
//        firstCategoryStackView.addArrangedSubview(firstCategoryLabel)
//        firstCategoryStackView.addArrangedSubview(firstCategoryCollectionView)
//        
//        basicView.addSubview(secondCategoryStackView)
//        secondCategoryStackView.addArrangedSubview(secondCategoryLabel)
//        secondCategoryStackView.addArrangedSubview(secondCategoryCollectionView)
//        
//        configureConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Layouts
//    private func configureConstraints() {
//        
//        let basicViewConstraints = [
//            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            basicView.topAnchor.constraint(equalTo: topAnchor),
//            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ]
//        
//        let headerTitleLabelConstraints = [
//            headerTitleLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
//            headerTitleLabel.topAnchor.constraint(equalTo: basicView.safeAreaLayoutGuide.topAnchor, constant: 10)
//        ]
//        
//        // 메인 카테고리 오토레이아웃 시작
//        let mainCategoryStackViewConstraint = [
//            mainCategoryStackView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
//            mainCategoryStackView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
//            mainCategoryStackView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 5),
//            mainCategoryStackView.heightAnchor.constraint(equalToConstant: 50)
//        ]
//        
//        let mainCategoryLabelConstraints = [
//            mainCategoryLabel.widthAnchor.constraint(equalToConstant: 60)
//        ]
//        
//        let mainCategoryCollectionViewConstraints = [
//            mainCategoryCollectionView.heightAnchor.constraint(equalToConstant: 44)
//        ]
//        // 메인 카테고리 오토레이아웃 끝
//        
//        
//        // 대분류 카테고리 오토레이아웃 시작
//        let firstCategoryStackViewConstraints = [
//            firstCategoryStackView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor ,constant: 10),
//            firstCategoryStackView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
//            firstCategoryStackView.topAnchor.constraint(equalTo: mainCategoryStackView.bottomAnchor, constant: 5)
//        ]
//        
//        let firstCategoryLabelConstraints = [
//            firstCategoryLabel.widthAnchor.constraint(equalToConstant: 60)
//        ]
//        
//        let firstCategoryCollectionViewConstraints = [
//            firstCategoryCollectionView.heightAnchor.constraint(equalToConstant: 44)
//        ]
//        // 대분류 카테고리 오토레이아웃 끝
//        
//        // 중분류 카테고리 오토레이아웃 시작
//
//        
//        NSLayoutConstraint.activate(basicViewConstraints)
//        NSLayoutConstraint.activate(headerTitleLabelConstraints)
//        NSLayoutConstraint.activate(mainCategoryStackViewConstraint)
//        NSLayoutConstraint.activate(mainCategoryLabelConstraints)
//        NSLayoutConstraint.activate(mainCategoryCollectionViewConstraints)
//        
//        NSLayoutConstraint.activate(firstCategoryStackViewConstraints)
//        NSLayoutConstraint.activate(firstCategoryLabelConstraints)
//        NSLayoutConstraint.activate(firstCategoryCollectionViewConstraints)
//    }

