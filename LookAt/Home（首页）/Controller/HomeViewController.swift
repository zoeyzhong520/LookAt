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
        homeView.delegate = self
        return homeView
    }()
    
    ///show light statusBar
    fileprivate var showLightStatusBar = true
    
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
        return showLightStatusBar ? .lightContent : .default
    }
}

extension HomeViewController:UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        self.navigationController?.setNavigationBarHidden(viewController.isKind(of: self.classForCoder), animated: true)
    }
}

extension HomeViewController:HomeViewDelegate {
    
    func homeView_scrollViewDidScroll(withScrollView scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        showLightStatusBar = offSetY <= STATUSBAR_HEIGHT
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
}
