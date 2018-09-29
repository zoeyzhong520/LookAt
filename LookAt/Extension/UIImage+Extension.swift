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
    
    ///placeholderImage
    static var placeholderImage:UIImage? {
        return UIImage(named: "网络图片加载占位图")
    }
    
    ///searchImage
    static var searchImage:UIImage? {
        return UIImage(named: "搜索")
    }
    
    ///pageControlNormalImage
    static var pageControlNormalImage:UIImage? {
        return UIImage(named: "pageControl_normal")
    }
    
    ///pageControlSelectImage
    static var pageControlSelectImage:UIImage? {
        return UIImage(named: "pageControl_select")
    }
    
    ///changeBatchImage
    static var changeBatchImage:UIImage? {
        return UIImage(named: "换一批")
    }
}
