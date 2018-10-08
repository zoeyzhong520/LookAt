//
//  UIViewController+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIViewController {
    
    ///present vc，默认不包含navigationBar
    func presentWithClassName(withClassName className:String, hasNavigationBar:Bool = false) {
        guard let vc = NSClassFromString("LookAt.\(className)") as? UIViewController.Type else {
            fatalError("NSClassFromString is nil")
        }
        
        let navVC = UINavigationController(rootViewController: vc.init())
        self.present(hasNavigationBar ? navVC : vc.init(), animated: true, completion: nil)
    }
    
    ///show 搜索视图
    func presentLookAtSearchTool() {
        self.presentWithClassName(withClassName: "LookAtSearchViewController")
    }
}
