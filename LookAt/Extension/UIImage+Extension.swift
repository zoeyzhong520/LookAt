//
//  UIImage+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/26.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIImage {
    
    ///homeTabBarIcon
    static var homeTabBarIcon:UIImage? {
        return UIImage(named: "首页")?.withRenderingMode(.alwaysTemplate)
    }
    
    ///oldBirdTabBarIcon
    static var oldBirdTabBarIcon:UIImage? {
        return UIImage(named: "老鸟")?.withRenderingMode(.alwaysTemplate)
    }
    
    ///newsTabBarIcon
    static var newsTabBarIcon:UIImage? {
        return UIImage(named: "消息")?.withRenderingMode(.alwaysTemplate)
    }
    
    ///meTabBarIcon
    static var meTabBarIcon:UIImage? {
        return UIImage(named: "我的")?.withRenderingMode(.alwaysTemplate)
    }
}
