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
    var selectedIndex: Int = 0 // 선택된 버튼의 인덱스
    var sectionsItems: [AttractionItem] = []
    
    
    // MARK: - UI Components
    let sectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 150, height: 200)
        // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.cornerRadius = 5
        collectionView.clipsToBounds = true
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
        sectionCollectionView.register(SectionTableViewCollectionViewCell.self, forCellWithReuseIdentifier: SectionTableViewCollectionViewCell.identifier)
        
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
    
    
    // MARK: - Functions
    func getSectionData(contentTypeId: String) {
        NetworkManager.shared.getAreaBasedList(contentTypeId: contentTypeId) { results in
            switch results {
            case .success(let item):
                self.sectionsItems = item.response.body.items.item
                DispatchQueue.main.async {
                    self.sectionCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionTableViewCollectionViewCell.identifier, for: indexPath) as? SectionTableViewCollectionViewCell else { return UICollectionViewCell() }

        let selectedItem = sectionsItems[indexPath.row]
        cell.getRandomSpot(with: selectedItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


