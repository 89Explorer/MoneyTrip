//
//  MainTabBarController.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Initializations
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureMainTabBar()
    }
    
    // MARK: - Functions
    func configureMainTabBar() {
        
        let exploreVC = UINavigationController(rootViewController: ExploreViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let mapVC = UINavigationController(rootViewController: MapViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        exploreVC.tabBarItem.image = UIImage(systemName: "house.circle")
        exploreVC.tabBarItem.selectedImage = UIImage(systemName: "house.circle.fill")
        exploreVC.tabBarItem.title = "Explore"
        
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        searchVC.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        searchVC.tabBarItem.title = "Search"
        
        mapVC.tabBarItem.image = UIImage(systemName: "map.circle")
        mapVC.tabBarItem.selectedImage = UIImage(systemName: "map.circle.fill")
        mapVC.tabBarItem.title = "Map"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        profileVC.tabBarItem.title = "Profile"
        
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .secondaryLabel
        tabBar.backgroundColor = .secondarySystemBackground
        
        setViewControllers([exploreVC, searchVC, mapVC, profileVC], animated: true)
    }
}

