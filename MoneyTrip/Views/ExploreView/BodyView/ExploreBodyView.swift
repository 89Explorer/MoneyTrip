//
//  ExploreBodyView.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/8/24.
//

import UIKit

class ExploreBodyView: UIView {
    
    // MARK: - UI Components
    let basicView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sectionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.layer.cornerRadius = 5
        tableView.clipsToBounds = true
        tableView.tintColor = .label
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(basicView)
        basicView.addSubview(sectionTableView)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let basicViewConstraints = [
            basicView.leadingAnchor.constraint(equalTo: leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: trailingAnchor),
            basicView.topAnchor.constraint(equalTo: topAnchor),
            basicView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let sectionTableViewConstraints = [
            sectionTableView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor),
            sectionTableView.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            sectionTableView.topAnchor.constraint(equalTo: basicView.topAnchor),
            sectionTableView.bottomAnchor.constraint(equalTo: basicView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(basicViewConstraints)
        NSLayoutConstraint.activate(sectionTableViewConstraints)
    }
    
}
