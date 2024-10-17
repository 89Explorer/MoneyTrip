//
//  DetailHeaderView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/16/24.
//

import UIKit
import SDWebImage

class DetailHeaderView: UIView {
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner,
                                    .layerMaxXMaxYCorner]  // 좌, 우 하단 적용
        view.layer.shadowColor = UIColor.label.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        return view
    }()
    
    var spotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sampleImage2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var spotTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이와 함께 가보면 좋을 공원"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 20)
        // label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    var spotAddress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "경기도 고양시 덕양구 화정동 1234동 123호"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 14)
        // label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        return stackView
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "bookmark.circle.fill", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "sailboat.circle", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    let howmuchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 20)
        let image = UIImage(systemName: "wonsign.circle", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        return button
    }()
    
    let howmuchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1234"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 10)
        // label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
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
        basicView.addSubview(spotImage)
        basicView.addSubview(spotTitle)
        basicView.addSubview(spotAddress)
        basicView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(howmuchButton)
        buttonStackView.addArrangedSubview(howmuchLabel)
        buttonStackView.addArrangedSubview(shareButton)
        buttonStackView.addArrangedSubview(bookMarkButton)
        
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let spotImageConstraints = [
            spotImage.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            spotImage.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            spotImage.topAnchor.constraint(equalTo: basicView.topAnchor),
            spotImage.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let spotTitleConstraints = [
            spotTitle.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            spotTitle.topAnchor.constraint(equalTo: spotImage.bottomAnchor, constant: 10),
            spotTitle.widthAnchor.constraint(equalToConstant: 280)
        ]
        
        let spotAddressConstraint = [
            spotAddress.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            spotAddress.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -10)
        ]
        
        
        let buttonStackViewConstraints = [
            buttonStackView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            buttonStackView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -15)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(spotImageConstraints)
        NSLayoutConstraint.activate(spotTitleConstraints)
        NSLayoutConstraint.activate(spotAddressConstraint)
        NSLayoutConstraint.activate(buttonStackViewConstraints)
    }
    
    // MARK: - Functions
    func getDetailSpot(with item: AttractionItem) {
        guard let imagePath = item.firstimage, let title = item.title, let address = item.addr1 else { return }
        
        let securePosterURL = imagePath.replacingOccurrences(of: "http://", with: "https://")
        
        let url = URL(string: securePosterURL)
        
        spotImage.sd_setImage(with: url)
        spotTitle.text = title
        spotAddress.text = address
    }
}
