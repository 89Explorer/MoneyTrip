//
//  userLikeCollectionViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/13/24.
//

import UIKit

class userLikeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let identifier = "userLikeCollectionViewCell"
    
    // MARK: - UI Components
    let likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "박물관러버"
        label.textColor = .black
        label.font =  UIFont(name: "HakgyoansimBunpilR", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Initilizations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.opacity = 0.2
        
        configureConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        
        addSubview(likeLabel)
        
        let likeLabelConstraints = [
            likeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            likeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            likeLabel.topAnchor.constraint(equalTo: topAnchor),
            likeLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(likeLabelConstraints)
    }
}
