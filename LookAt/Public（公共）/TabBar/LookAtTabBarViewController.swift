//
//  LookAtTabBarViewController.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class LookAtTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createControllers()
    }
    
    //设置controllers
    func createControllers() {
        //首页
        let homeVC = HomeViewController()
        let homeNav = BaseNavigationViewController.init(rootViewController: homeVC)
        let homeItem = UITabBarItem(title: "首页", image: UIImage.homeTabBarIcon, tag: 0)
        homeNav.tabBarItem = homeItem
        
        //老鸟
        let oldBirdVC = OldBirdViewController()
        let oldBirdNav = BaseNavigationViewController.init(rootViewController: oldBirdVC)
        let oldBirdItem = UITabBarItem(title: "老鸟", image: UIImage.oldBirdTabBarIcon, tag: 1)
        oldBirdNav.tabBarItem = oldBirdItem
        
        //消息
        let newsVC = NewsViewController()
        newsVC.title = "消息"
        let newsNav = BaseNavigationViewController.init(rootViewController: newsVC)
        let newsItem = UITabBarItem(title: "消息", image: UIImage.newsTabBarIcon, tag: 2)
        newsNav.tabBarItem = newsItem
        
        //我的
        let meVC = MeViewController()
        let meNav = BaseNavigationViewController.init(rootViewController: meVC)
        let meItem = UITabBarItem(title: "我的", image: UIImage.meTabBarIcon, tag: 3)
        meNav.tabBarItem = meItem
        
        //设置controllers
        self.tabBar.tintColor = UIColor.blackTextColor
        self.viewControllers = [homeNav,oldBirdNav,newsNav,meNav]
    }

}
