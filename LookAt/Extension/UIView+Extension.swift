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
    
    ///设置边框，宽度默认1
    func setBorder(withBorderWidth borderWidth:CGFloat = 1, borderColor:UIColor?) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
}
