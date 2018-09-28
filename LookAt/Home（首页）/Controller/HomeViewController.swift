//
//  HomeViewController.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    ///home view
    fileprivate lazy var homeView:HomeView = {
        let homeView = HomeView(frame: CGRect(x: 0, y: -STATUSBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setPage()
    }
    
    //UI
    func setPage() {
        self.navigationController?.delegate = self
        
        //home view
        view.addSubview(homeView)
        homeView.adImagesArray = [String.homeBannerImagePath1,String.homeBannerImagePath2,String.homeBannerImagePath3,String.homeBannerImagePath4]
    }

    //状态栏文字颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension HomeViewController:UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.navigationController?.setNavigationBarHidden(viewController.isKind(of: self.classForCoder), animated: true)
    }
}
