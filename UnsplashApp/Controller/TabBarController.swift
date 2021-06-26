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
    self.tabBar.barTintColor = UIColor(named: "mainColor")
    self.tabBar.tintColor = UIColor(named: "subColor")
    self.tabBar.unselectedItemTintColor = UIColor.orange.withAlphaComponent(0.4)
    
    self.tabBar.layer.borderWidth = 0.50
    self.tabBar.layer.borderColor = UIColor.clear.cgColor
    self.tabBar.clipsToBounds = true
    
    let firstVC = FeedViewController()
    let firstViewTabBarItem = UITabBarItem(title: "Feed", image:UIImage(systemName: "flame") , tag: 0)
    
    firstVC.tabBarItem = firstViewTabBarItem
    
    let secondVC = FavoritesViewController()
    let secondViewTabBarItem = UITabBarItem(title: "Favoties", image: UIImage(systemName: "star"), tag: 1)
    
    secondVC.tabBarItem = secondViewTabBarItem
    
    let controllers = [firstVC, secondVC]
    
    viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
  }

}
