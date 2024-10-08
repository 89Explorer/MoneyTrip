//
//  ExploreMainView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ExploreMainView: UIView {
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let headerView: ExploreHeaderView = {
        let view = ExploreHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(basicView)
        
        basicView.addSubview(headerView)
        
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layouts
    private func configureContraints() {
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let headerViewConstraints = [
            headerView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: basicView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 550)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(headerViewConstraints)
    }
}
