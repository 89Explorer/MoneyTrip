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
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 66, height: 22)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.layer.cornerRadius = 5
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
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
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let profileHeaderviewConstraints = [
            profileHeaderview.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            profileHeaderview.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            profileHeaderview.topAnchor.constraint(equalTo: basicView.topAnchor),
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
            userLikesCollectionView.topAnchor.constraint(equalTo: profileIntroLabel.bottomAnchor, constant: 10),
            userLikesCollectionView.trailingAnchor.constraint(equalTo: profileHeaderview.trailingAnchor, constant: -10),
            userLikesCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(profileHeaderviewConstraints)
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(profileNameLabelConstraints)
        NSLayoutConstraint.activate(profileEditButtonConstraints)
        NSLayoutConstraint.activate(profileIntroLabelConstraints)
        NSLayoutConstraint.activate(userLikesCollectionViewConstraints)
    }
}
