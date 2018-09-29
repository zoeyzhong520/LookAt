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
        return self.lookAtFont(14)
    }
    
    ///超大号字体
    static var superBigFont:UIFont {
        return self.lookAtFont(22)
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
    
    ///超大号加粗字体
    static var superBigBoldFont:UIFont {
        return self.lookAtBoldFont(22)
    }
    
    ///大号加粗字体
    static var bigBoldFont:UIFont {
        return self.lookAtBoldFont(16)
    }
    
    ///中号加粗字体
    static var mediumBoldFont:UIFont {
        return self.lookAtBoldFont(14)
    }
}
