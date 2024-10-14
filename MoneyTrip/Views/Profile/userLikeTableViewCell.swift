//
//  userLikeTableViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/14/24.
//

import UIKit

class userLikeTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "userLikeTableViewCell"
    
    // MARK: - UI Components
    
    
    
    // MARK: - Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
