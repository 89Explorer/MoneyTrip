//
//  RecommendSpotCollectionViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/15/24.
//

import UIKit
import SDWebImage

class RecommendSpotCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "RecommendSpotCollectionViewCell"
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 25)
        let image = UIImage(systemName: "bookmark.circle.fill", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let spotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이와 함께 가보면 좋을 공원"
        label.numberOfLines = 0
        label.textAlignment = .left
        // label.font = UIFont(name: "HakgyoansimBunpilR", size: 16)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let spotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
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
        
        let spotImageConstraints = [
            spotImage.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            spotImage.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            spotImage.topAnchor.constraint(equalTo: basicView.topAnchor),
            spotImage.bottomAnchor.constraint(equalTo: basicView.bottomAnchor)
        ]
        
        let spotLabelConstraints = [
            spotLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 5),
            spotLabel.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -5),
            spotLabel.widthAnchor.constraint(equalToConstant: 260)
        ]
        
        let bookMarkButtonConstraints = [
            bookMarkButton.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -5),
            bookMarkButton.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -5)
        ]
    
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(spotImageConstraints)
        NSLayoutConstraint.activate(spotLabelConstraints)
        NSLayoutConstraint.activate(bookMarkButtonConstraints)
    }
    
    // MARK: - Functions
    func getRandomSpot(with item: AttractionItem) {
        guard let imagePath = item.firstimage, let title = item.title else { return }
        
        let securePosterURL = imagePath.replacingOccurrences(of: "http://", with: "https://")
        
        let url = URL(string: securePosterURL)
        
        spotImage.sd_setImage(with: url)
        spotLabel.text = title

    }
}
