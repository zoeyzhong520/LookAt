//
//  UIColor+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/26.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIColor {
    
    ///RGBA
    static let RGBA:(CGFloat,CGFloat,CGFloat,CGFloat) -> UIColor = { r, g, b, a in
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    ///RGB
    static let RGB:(CGFloat,CGFloat,CGFloat) -> UIColor = { r, g, b in
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    ///字体黑色
    static var blackTextColor:UIColor {
        return self.RGB(53,53,53)
    }
    
    ///字体灰色
    static var grayTextColor:UIColor {
        return self.RGB(175,175,175)
    }
    
    ///蒙层颜色
    static var mongolianColor:UIColor {
        return self.RGBA(0,0,0,0.2)
    }
    
    ///分割线条颜色
    static var lineColor:UIColor {
        return self.RGB(246,247,250)
    }
}
