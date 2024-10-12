//
//  ProfileViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Components
    let profileView: ProfileView = {
        let view = ProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureSearchTitle()
        collectionViewDelegate()
        configureConstraints()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        view.addSubview(profileView)
        
        let profileViewConstraints = [
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            profileView.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        NSLayoutConstraint.activate(profileViewConstraints)
    }
    
    // MARK: - Functions
    func configureSearchTitle() {
        
        let titleLabel = UILabel()
        titleLabel.text = "마이 페이지"
        titleLabel.textColor = .label
        titleLabel.font = UIFont(name: "HakgyoansimBunpilR", size: 24)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        let settingButton = UIButton(type: .system)
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "gearshape.circle", withConfiguration: configure)
        settingButton.setImage(image, for: .normal)
        settingButton.tintColor = .label
        settingButton.addTarget(self, action: #selector(didTappedSettingButton), for: .touchUpInside)
        
        // 프로필 이후에 확인해볼 것 
        // navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingButton)
    }
    
    @objc func didTappedSettingButton() {
        print("didTappedSettingButton() - called")
    }
    
    func collectionViewDelegate() {
        profileView.userLikesCollectionView.delegate = self
        profileView.userLikesCollectionView.dataSource = self
        profileView.userLikesCollectionView.register(userLikeCollectionViewCell.self, forCellWithReuseIdentifier: userLikeCollectionViewCell.identifier)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userLikeCollectionViewCell.identifier, for: indexPath) as? userLikeCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}
