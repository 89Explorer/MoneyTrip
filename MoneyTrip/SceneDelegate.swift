//
//  SceneDelegate.swift
//  MoneyTrip
//
//  Created by 권정근 on 10/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    //    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    //        guard let windowScene = (scene as? UIWindowScene) else { return }
    //        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    //        window?.windowScene = windowScene
    //
    //        let mainTabBarController = MainTabBarController()
    //
    //        window?.rootViewController = mainTabBarController
    //        window?.makeKeyAndVisible()
    //    }
    
    
    // iOS 13 이후에는 여기에 구현
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NetworkManager.shared.initailizeTotalPages { result in
            switch result {
            case.success():
                print("Total Pages initialzied Successfully")
                DispatchQueue.main.async {
                    self.setupMainTabBarController()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
    }
    
    // 메인 탭바 관련 함수
    func setupMainTabBarController() {
        let mainTabBarController = MainTabBarController()
        
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
        
        mainTabBarController.tabBar.tintColor = .label
        mainTabBarController.tabBar.unselectedItemTintColor = .secondaryLabel
        mainTabBarController.tabBar.backgroundColor = .secondarySystemBackground
        
        mainTabBarController.setViewControllers([exploreVC, searchVC, mapVC, profileVC], animated: true)
        
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

