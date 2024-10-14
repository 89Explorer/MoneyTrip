//
//  ProfileViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var selectedColor: UIColor = .systemRed
    
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
        
        profileView.userInfoStackView()
        addGestureRecognizers()
        
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
        
        profileView.userCollectionView.delegate = self
        profileView.userCollectionView.dataSource = self
        profileView.userCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func addGestureRecognizers() {
        // 탭 제스처 추가
        let lampTapGesture = UITapGestureRecognizer(target: self, action: #selector(lampStackTapped))
        profileView.lampStackView.addGestureRecognizer(lampTapGesture)
        
        let scrapTapGesture = UITapGestureRecognizer(target: self, action: #selector(scrapStackTapped))
        profileView.scrapStackView.addGestureRecognizer(scrapTapGesture)

        let estimateTapGesture = UITapGestureRecognizer(target: self, action: #selector(estimateStackTapped))
        profileView.estimateStackView.addGestureRecognizer(estimateTapGesture)
    }
    
    @objc func lampStackTapped() {
        self.selectedColor = .systemRed
        print("램프 탭")
        DispatchQueue.main.async {
            self.profileView.userCollectionView.reloadData()
        }
    }

    @objc func scrapStackTapped() {
        self.selectedColor = .systemCyan
        print("스크랩 탭")
        DispatchQueue.main.async {
            self.profileView.userCollectionView.reloadData()
        }
    }

    @objc func estimateStackTapped() {
        self.selectedColor = .systemMint
        print("리뷰 탭")
        DispatchQueue.main.async {
            self.profileView.userCollectionView.reloadData()
        }
    }
    
    
    func addTapGesture(to stackView: UIStackView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        stackView.addGestureRecognizer(tapGesture)
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == profileView.userLikesCollectionView {
            return 5
        }
        
        if collectionView == profileView.userCollectionView {
            return 20
        }
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == profileView.userLikesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userLikeCollectionViewCell.identifier, for: indexPath) as? userLikeCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
        
        if collectionView == profileView.userCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = self.selectedColor
            return cell
        }
        
        return UICollectionViewCell()
    }
}
