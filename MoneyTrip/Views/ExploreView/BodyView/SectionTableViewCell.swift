//
//  SectionTableViewCell.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/8/24.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "SectionTableViewCell"
    
    
    // MARK: - UI Components
    let sectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 150, height: 200)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(sectionCollectionView)
        
        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        
        let sectionCollectionViewConstraints = [
            sectionCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sectionCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sectionCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sectionCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(sectionCollectionViewConstraints)
    }
}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .systemOrange
        return cell
    }
}
