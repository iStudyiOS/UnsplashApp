//
//  TabBarController.swift
//  UnsplashApp
//
//  Created by KEEN on 2021/06/26.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tabBar.barTintColor = UIColor.black
    self.tabBar.tintColor = UIColor.white
    self.tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.4)
    
    let firstVC = FeedViewController()
    let firstViewTabBarItem = UITabBarItem(title: "Feed", image:UIImage(systemName: "flame") , tag: 0)
    
    firstVC.tabBarItem = firstViewTabBarItem
    
    let secondVC = FavoritesViewController()
    let secondViewTabBarItem = UITabBarItem(title: "Favoties", image: UIImage(systemName: "star"), tag: 1)
    
    secondVC.tabBarItem = secondViewTabBarItem
    
    let tabBarList = [firstVC, secondVC]
    
    viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    
  }
  
}
