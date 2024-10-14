//
//  ProfileView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/11/24.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - UI Components
    var basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Profile HeaderView
    
    var profileHeaderview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.systemMint.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "fancy9"
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 20)
        label.textColor = .label
        return label
    }()
    
    let profileEditButton: UIButton = {
        
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .secondarySystemBackground
        config.baseForegroundColor = .label
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .medium
        
        var titleArr = AttributedString.init("프로필 편집")
        titleArr.font = UIFont(name: "HakgyoansimBunpilR", size: 12)
        config.attributedTitle = titleArr
        
        button.configuration = config
        return button
    }()
    
    let profileIntroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "방방곡곡 어디든 발 닿는 데까지"
        label.font =  UIFont(name: "HakgyoansimBunpilR", size: 16)
        label.textColor = .label
        return label
    }()
    
    let userLikesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 66, height: 22)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //        collectionView.backgroundColor = .secondarySystemBackground
        //        collectionView.layer.cornerRadius = 5
        //        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    // MARK: - Profile Body View
    let userActivityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.systemMint.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    // 각 스택뷰를 클래스 속성으로 선언
    var lampStackView: UIStackView!
    var scrapStackView: UIStackView!
    var estimateStackView: UIStackView!
    
    
    let userCollectionView: UICollectionView = {
        let spacing: CGFloat = 3
        let totalSapcing = spacing * 2
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - totalSapcing) / 3, height: 150)
        
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        //        collectionView.layer.cornerRadius = 5
        //        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        // 사용자의 피드, 스크랩 등 내역 스택뷰
        // userInfoStackView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        addSubview(basicView)
        basicView.addSubview(profileHeaderview)
        
        profileHeaderview.addSubview(profileImage)
        profileHeaderview.addSubview(profileNameLabel)
        profileHeaderview.addSubview(profileEditButton)
        profileHeaderview.addSubview(profileIntroLabel)
        profileHeaderview.addSubview(userLikesCollectionView)
        
        basicView.addSubview(userActivityView)
        basicView.addSubview(userCollectionView)
        
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let profileHeaderviewConstraints = [
            profileHeaderview.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            profileHeaderview.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            profileHeaderview.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 5),
            profileHeaderview.heightAnchor.constraint(equalToConstant: 140)
        ]
        
        let profileImageConstraints = [
            profileImage.leadingAnchor.constraint(equalTo: profileHeaderview.leadingAnchor, constant: 10),
            profileImage.topAnchor.constraint(equalTo: profileHeaderview.topAnchor, constant: 10),
            profileImage.bottomAnchor.constraint(equalTo: profileHeaderview.bottomAnchor, constant: -10),
            profileImage.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let profileNameLabelConstraints = [
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            profileNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 5)
        ]
        
        let profileEditButtonConstraints = [
            profileEditButton.trailingAnchor.constraint(equalTo: profileHeaderview.trailingAnchor, constant: -10),
            profileEditButton.topAnchor.constraint(equalTo: profileNameLabel.topAnchor)
        ]
        
        let profileIntroLabelConstraints = [
            profileIntroLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor),
            profileIntroLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 5),
            profileIntroLabel.trailingAnchor.constraint(equalTo: profileHeaderview.trailingAnchor, constant: -10)
        ]
        
        let userLikesCollectionViewConstraints = [
            userLikesCollectionView.leadingAnchor.constraint(equalTo: profileIntroLabel.leadingAnchor),
            userLikesCollectionView.topAnchor.constraint(equalTo: profileIntroLabel.bottomAnchor, constant: 15),
            userLikesCollectionView.trailingAnchor.constraint(equalTo: profileHeaderview.trailingAnchor, constant: -10),
            userLikesCollectionView.heightAnchor.constraint(equalToConstant: 55)
        ]
        
        let userActivityViewConstraints = [
            userActivityView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            userActivityView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            userActivityView.topAnchor.constraint(equalTo: profileHeaderview.bottomAnchor, constant: 20),
            userActivityView.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        let userCollectionViewConstraints = [
            userCollectionView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            userCollectionView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            userCollectionView.widthAnchor.constraint(equalTo: basicView.widthAnchor),
            userCollectionView.topAnchor.constraint(equalTo: userActivityView.bottomAnchor, constant: 25),
            userCollectionView.bottomAnchor.constraint(equalTo: basicView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(profileHeaderviewConstraints)
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(profileNameLabelConstraints)
        NSLayoutConstraint.activate(profileEditButtonConstraints)
        NSLayoutConstraint.activate(profileIntroLabelConstraints)
        NSLayoutConstraint.activate(userLikesCollectionViewConstraints)
        NSLayoutConstraint.activate(userActivityViewConstraints)
        NSLayoutConstraint.activate(userCollectionViewConstraints)
    }
    
    
    // MARK: - Functions
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 18)
        label.textColor = .label
        return label
    }
    
    func createValueLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 18)
        label.textColor = .label
        return label
    }
    
    func createVerticalStackView(arrangedSubviews: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }
    
    func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = .lightGray
        divider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalToConstant: 30)
        ])
        return divider
    }
    
    func createSpace() -> UIView {
        let space = UIView()
        space.backgroundColor = .clear
        space.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            space.widthAnchor.constraint(equalToConstant: 1),
            space.heightAnchor.constraint(equalToConstant: 30)
        ])
        return space
    }
    
    func userInfoStackView() {
        // 세로 스택 (나의 램프)
        let lampLabel = createLabel(text: "램프")
        let lampValueLabel = createValueLabel(text: "0")
        lampStackView = createVerticalStackView(arrangedSubviews: [lampLabel, lampValueLabel])
        
        // 세로 스택 (스크랩)
        let scrapLabel = createLabel(text: "스크랩")
        let scrapValueLabel = createValueLabel(text: "0")
        scrapStackView = createVerticalStackView(arrangedSubviews: [scrapLabel, scrapValueLabel])
        
        // 세로 스택 (평가 내역)
        let estimateLabel = createLabel(text: "리뷰")
        let estimateValueLabel = createValueLabel(text: "0")
        estimateStackView = createVerticalStackView(arrangedSubviews: [estimateLabel, estimateValueLabel])
        
        // 구분선 생성
        let divideLine1 = createDivider()
        let divideLine2 = createDivider()
        
        // leading, traililng space 생성
        let space1 = createSpace()
        let space2 = createSpace()
        
        // 전체 가로 스택
        let userInfoHorizontalStackView = UIStackView(arrangedSubviews: [space1, lampStackView, divideLine1, scrapStackView, divideLine2, estimateStackView, space2])
        userInfoHorizontalStackView.axis = .horizontal
        userInfoHorizontalStackView.alignment = .center
        userInfoHorizontalStackView.distribution = .equalSpacing
        userInfoHorizontalStackView.spacing = 16
        
        userActivityView.addSubview(userInfoHorizontalStackView)
        
        
        // 제약 조건 설정
        userInfoHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoHorizontalStackView.leadingAnchor.constraint(equalTo: userActivityView.leadingAnchor),
            userInfoHorizontalStackView.trailingAnchor.constraint(equalTo: userActivityView.trailingAnchor),
            userInfoHorizontalStackView.centerYAnchor.constraint(equalTo: userActivityView.centerYAnchor)
        ])
    }
}
