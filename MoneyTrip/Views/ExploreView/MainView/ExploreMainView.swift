//
//  ExploreMainView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class ExploreMainView: UIView {
    
    // MARK: - UI Components
    let basicView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never // Safe Area 인셋 무시
        return view
    }()
    
    let headerView: ExploreHeaderView = {
        let view = ExploreHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bodyView: ExploreBodyView = {
        let view = ExploreBodyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(basicView)
        
        basicView.addSubview(headerView)
        basicView.addSubview(bodyView)
        
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
            headerView.widthAnchor.constraint(equalTo: basicView.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 600)
        ]
        
        let bodyViewConstraints = [
            bodyView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 10),
            bodyView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor, constant: -10),
            bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 35),
            bodyView.heightAnchor.constraint(equalToConstant: 1280),
            bodyView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor, constant: -70)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(headerViewConstraints)
        NSLayoutConstraint.activate(bodyViewConstraints)
    }
}
