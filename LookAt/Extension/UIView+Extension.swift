//
//  UIView+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIView {
    
    convenience init (withBackgroundColor backgroundColor:UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }
    
    ///设置圆角，m弧度默认为5
    func setCornerRadius(withCornerRadius cornerRadius:CGFloat = CORNERRADIUS) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
