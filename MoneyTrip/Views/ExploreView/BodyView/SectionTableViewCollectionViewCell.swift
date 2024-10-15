//
//  SectionTableViewCollectionViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/15/24.
//

import UIKit

class SectionTableViewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "SectionTableViewCollectionViewCell"
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let spotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sampleImage2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let spotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이와 함께 가보면 좋을 공원"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "HakgyoansimBunpilR", size: 12)
        label.textColor = .white
        return label
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let configure = UIImage.SymbolConfiguration(pointSize: 10)
        let image = UIImage(systemName: "bookmark.circle.fill", withConfiguration: configure)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
            spotLabel.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(spotImageConstraints)
        NSLayoutConstraint.activate(spotLabelConstraints)
    }
}
