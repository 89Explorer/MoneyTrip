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
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "bookmark.circle.fill", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let spotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이와 함께 가보면 좋을 공원"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 16)
        label.textColor = .label
        return label
    }()
    
    let spotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        imageView.tintColor = .white
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
        
        let spotLabelConstraints = [
            spotLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 5),
            spotLabel.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 5),
            spotLabel.widthAnchor.constraint(equalToConstant: 260)
        ]
        
        let spotImageConstraints = [
            spotImage.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            spotImage.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            //spotImage.topAnchor.constraint(equalTo: spotLabel.bottomAnchor, constant: 5),
            spotImage.heightAnchor.constraint(equalToConstant: 265),
            spotImage.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -5)
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
