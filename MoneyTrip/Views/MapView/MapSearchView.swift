//
//  MapSearchView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/10/24.
//

import UIKit

class MapSearchView: UIView {
    
    // MARK: - Variables
    var mapSearchViewHeightConstraint: NSLayoutConstraint! // 높이 조절을 위한 Constraint
    
    // MARK: - UI Components
    let mapSearchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        return view
        
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mapSearchViewHeightConstraint = heightAnchor.constraint(equalToConstant: 350)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        addSubview(mapSearchView)
        
        let mapSearchViewConstraints = [
            mapSearchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapSearchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapSearchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapSearchView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapSearchViewHeightConstraint!
        ]
        
        NSLayoutConstraint.activate(mapSearchViewConstraints)
    }
}
