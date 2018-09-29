//
//  UIButton+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(withTitle title:String?, titleColor:UIColor?, normalImage:UIImage?, target:Any?, action:Selector) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setImage(normalImage, for: .normal)
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}
