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
        let homeNav = UINavigationController.init(rootViewController: homeVC)
        
        //老鸟
        let oldBirdVC = OldBirdViewController()
        let oldBirdNav = UINavigationController.init(rootViewController: oldBirdVC)
        
        //消息
        let newsVC = NewsViewController()
        let newsNav = UINavigationController.init(rootViewController: newsVC)
        
        //我的
        let meVC = MeViewController()
        let meNav = UINavigationController.init(rootViewController: meVC)
        
        //设置controllers
        self.viewControllers = [homeNav,oldBirdNav,newsNav,meNav]
    }

}
