//
//  MapSearchViewController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/10/24.
//

import UIKit

class MapSearchViewController: UIViewController {
    
    // MARK: - UI Components
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: MapSearchResultsViewController())
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.placeholder = "장소 또는 지역을 검색해주세요"
        searchController.hidesNavigationBarDuringPresentation = false  // 서치바를 누르면 숨겨지는 네비게이션바 기능을 해제함
        searchController.obscuresBackgroundDuringPresentation = false // 검색 중 서치바가 작아지거나 사라지지 않게 설정
        return searchController
    }()
    
    
    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.delegate = self
    }
}


extension MapSearchViewController: UISearchBarDelegate, UISearchControllerDelegate {
    // 1. 검색 시작 시 Detent를 .large()로 변경
     func didPresentSearchController(_ searchController: UISearchController) {
         if let sheet = sheetPresentationController {
             sheet.animateChanges {
                 sheet.selectedDetentIdentifier = .large
             }
         }
     }
     
     // 2. 검색 종료 시 Detent를 .medium()으로 변경
     func didDismissSearchController(_ searchController: UISearchController) {
         if let sheet = sheetPresentationController {
             sheet.animateChanges {
                 sheet.selectedDetentIdentifier = .medium
             }
         }
     }
}
