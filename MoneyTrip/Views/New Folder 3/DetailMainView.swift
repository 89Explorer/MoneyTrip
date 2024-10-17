//
//  DetailMainView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/16/24.
//

import UIKit

class DetailMainView: UIView {
    
    // MARK: - UI Components
    let basicView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.contentInsetAdjustmentBehavior = .never// Safe Area 인셋 무시
        return view
    }()
    
    let detailHeaderView: DetailHeaderView = {
        let view = DetailHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
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
    func configureConstraints() {
        addSubview(basicView)
        basicView.addSubview(detailHeaderView)
        basicView.addSubview(view)
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let detailHeaderViewConstraints = [
            detailHeaderView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            detailHeaderView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            detailHeaderView.topAnchor.constraint(equalTo: basicView.topAnchor),
            detailHeaderView.heightAnchor.constraint(equalToConstant: 360),
            //detailHeaderView.widthAnchor.constraint(equalTo: basicView.widthAnchor)
        ]
        
        let viewConstraints = [
            view.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            view.topAnchor.constraint(equalTo: detailHeaderView.bottomAnchor, constant: 25),
            view.heightAnchor.constraint(equalToConstant: 1000),
            view.widthAnchor.constraint(equalTo: basicView.widthAnchor),
            view.bottomAnchor.constraint(equalTo: basicView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(detailHeaderViewConstraints)
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    
}
