//
//  LookAtSearchBar.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class LookAtSearchBar: UISearchBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.searchBarStyle = .minimal
        
        guard let searchTextField = self.subviews.first?.subviews.last as? UITextField else {
            fatalError("cannot find textField view in UISearchBar")
        }
        
        //searchTextField 高度
        let searchTextFieldH:CGFloat = 30
        
        searchTextField.frame = CGRect(x: 10, y: (bounds.size.height-searchTextFieldH)/2, width: SCREEN_WIDTH-60, height: searchTextFieldH)
        searchTextField.setCornerRadius(withCornerRadius: searchTextFieldH/2)
        
        //设置placeholder字体
        searchTextField.setValue(UIFont.mediumFont, forKeyPath: "_placeholderLabel.font")
        
        //设置光标颜色
        searchTextField.tintColor = UIColor.green
        
        //设置取消按钮
        guard let cancelBtn = self.value(forKey: "cancelButton") as? UIButton else {
            fatalError("cannot fine cancelButton view in UISearchBar")
        }
        
        cancelBtn.setAttributedTitle(NSAttributedString.init(string: "取消", attributes: [NSAttributedString.Key.foregroundColor:UIColor.green, NSAttributedString.Key.font:UIFont.mediumFont]), for: .normal)
        
    }

}
