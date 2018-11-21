//
//  HomeViewController.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    ///home navigationbar
    fileprivate lazy var homeNavigationBar:HomeNavigationBar = {
        let bar = HomeNavigationBar(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT))
        bar.isHidden = true
        bar.block = { [weak self] in
            log(message: "点击首页自定义导航栏的搜索框")
            self?.presentLookAtSearchTool()
        }
        return bar
    }()
    
    ///home view
    fileprivate lazy var homeView:HomeView = {
        let homeView = HomeView(frame: CGRect(x: 0, y: -STATUSBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        homeView.delegate = self
        homeView.searchBarBlock = { [weak self] in
            self?.presentLookAtSearchTool()
        }
        return homeView
    }()
    
    ///show light statusBar，默认true
    fileprivate var showLightStatusBar = true
    
    ///originOffSetY
    fileprivate var originOffSetY:CGFloat = 0
    
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
        homeView.adImagesArray = [String.homeBannerImagePath1,String.homeBannerImagePath2,String.homeBannerImagePath4]
        
        //home navigationbar
        view.addSubview(homeNavigationBar)
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
        originOffSetY = offSetY
        showLightStatusBar = offSetY <= STATUSBAR_HEIGHT
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        
        homeNavigationBar.isHidden = offSetY <= HOME_BANNER_HEIGHT-STATUSBAR_HEIGHT
    }
    
    
}
