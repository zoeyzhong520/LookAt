//
//  UILabel+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(withText text:String?, font:UIFont, textColor:UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
