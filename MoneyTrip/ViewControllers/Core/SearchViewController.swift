//
//  SearchViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - UI Components
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchResultslViewController())
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.placeholder = "장소 또는 지역을 검색해주세요"
        searchController.hidesNavigationBarDuringPresentation = false  // 서치바를 누르면 숨겨지는 네비게이션바 기능을 해제함
        return searchController
    }()
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
  
        configureSearchTitle()
        
        // 서치바에 검색 중일 때 네비게이션바 부분 숨기기 기능
        searchController.hidesNavigationBarDuringPresentation = true
    }
    
    // MARK: - Functions
    /// SearchViewController 내에 네비게이션 타이틀 설정 함수
    func configureSearchTitle() {
        
        let titleLabel = UILabel()
        titleLabel.text = "어딜 가고 싶은신가요?"
        titleLabel.textColor = .label
        titleLabel.font = UIFont(name: "HakgyoansimBunpilR", size: 24)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
    }
    
}

// MARK: - Extensions
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}
