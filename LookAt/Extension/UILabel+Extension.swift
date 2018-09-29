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
        self.setTextNilBackgroundColor()
    }
    
    ///设置文本为nil时的背景色
    func setTextNilBackgroundColor() {
        self.backgroundColor = self.text == nil ? UIColor.grayTextColor : UIColor.clear
    }
    
    ///计算单行文本宽度
    func textWidth() -> CGFloat {
        if text == nil {
            fatalError("text is nil")
        }
        
        return (self.text! as NSString).size(withAttributes: [NSAttributedString.Key.font:self.font]).width+2
    }
}
