//
//  UIImageView+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(withImageName imageName:String) {
        self.init()
        self.image = UIImage(named: imageName)
    }
}
