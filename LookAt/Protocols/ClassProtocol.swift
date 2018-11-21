//
//  ClassProtocol.swift
//  LookAt
//
//  Created by 陈琳 on 2018/10/5.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: class protocol
@objc protocol HomeViewDelegate:NSObjectProtocol {
    @objc optional func homeView_scrollViewDidScroll(withScrollView scrollView:UIScrollView)
}

@objc protocol LookAtSearchToolDelegete:NSObjectProtocol {
    @objc optional func lookAtSearchTool_searchBarCancelButtonClicked()
    @objc optional func lookAtSearchTool_resultCellClickWithKeyword(keyword:String, andResul result:String)
}
