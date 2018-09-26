//
//  UIFont+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/26.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIFont {
    
    ///常用字体大小
    static let lookAtFont:(CGFloat) -> UIFont = { scale in
        return UIFont.systemFont(ofSize: fontSizeScale(scale))
    }
    
    ///常用粗体大小
    static let lookAtBoldFont:(CGFloat) -> UIFont = { scale in
        return UIFont.boldSystemFont(ofSize: fontSizeScale(scale))
    }
    
    ///导航栏标题字体
    static var navigationTitleFont:UIFont {
        return self.lookAtFont(17)
    }
    
    ///超大号字体
    static var superBigFont:UIFont {
        return self.lookAtFont(18)
    }
    
    ///大号字体
    static var bigFont:UIFont {
        return self.lookAtFont(16)
    }
    
    ///中号字体
    static var mediumFont:UIFont {
        return self.lookAtFont(14)
    }
    
    ///小号字体
    static var smallFont:UIFont {
        return self.lookAtFont(12)
    }
}
