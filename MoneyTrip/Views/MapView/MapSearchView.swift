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
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "장소 또는 지역을 검색해주세요"
        searchBar.searchBarStyle = .minimal   // 이거 설정 안하면 서치바 위, 아래로 줄이 있다.
        return searchBar
    }()
    
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mapSearchViewHeightConstraint = heightAnchor.constraint(equalToConstant: 250)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        addSubview(mapSearchView)
        addSubview(searchBar)
        
        let mapSearchViewConstraints = [
            mapSearchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapSearchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapSearchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapSearchView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapSearchViewHeightConstraint!
        ]
        
        let searchBarConstraints = [
            searchBar.leadingAnchor.constraint(equalTo: mapSearchView.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: mapSearchView.trailingAnchor, constant: -30),
            searchBar.topAnchor.constraint(equalTo: mapSearchView.topAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 44)
        ]

        NSLayoutConstraint.activate(mapSearchViewConstraints)
        NSLayoutConstraint.activate(searchBarConstraints)
    }
}
