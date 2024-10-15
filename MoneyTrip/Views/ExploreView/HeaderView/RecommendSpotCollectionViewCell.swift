//
//  RecommendSpotCollectionViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/15/24.
//

import UIKit

class RecommendSpotCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "RecommendSpotCollectionViewCell"
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    let spotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이와 함께 가보면 좋을 공원"
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 24)
        label.textColor = .label
        return label
    }()
    
    let spotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        return imageView
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
        basicView.addSubview(spotLabel)
        basicView.addSubview(bookMarkButton)
        
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
            spotImage.bottomAnchor.constraint(equalTo: basicView.bottomAnchor)
        ]
        
        let spotLabelConstraints = [
            spotLabel.leadingAnchor.constraint(equalTo: spotImage.leadingAnchor, constant: 10),
            spotLabel.trailingAnchor.constraint(equalTo: spotImage.trailingAnchor, constant: -10),
            spotLabel.bottomAnchor.constraint(equalTo: spotImage.bottomAnchor, constant: -5)
        ]
        
        let bookMarkButtonConstraints = [
            bookMarkButton.topAnchor.constraint(equalTo: spotImage.topAnchor, constant: 5),
            bookMarkButton.trailingAnchor.constraint(equalTo: spotImage.trailingAnchor, constant: -5)
        ]
    
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(spotImageConstraints)
        NSLayoutConstraint.activate(spotLabelConstraints)
        NSLayoutConstraint.activate(bookMarkButtonConstraints)
    }
}
