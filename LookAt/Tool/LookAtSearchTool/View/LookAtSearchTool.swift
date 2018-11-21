//
//  LookAtSearchTool.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: LookAt SearchTool

class LookAtSearchTool: UIView {
    
    ///searchBar
    fileprivate lazy var searchBar:LookAtSearchBar = {
        let searchBar = LookAtSearchBar()
        searchBar.frame = CGRect(x: 0, y: STATUSBAR_HEIGHT, width: SCREEN_WIDTH, height: LOOKATSEARCHTOOL_SEARCHBAR_HEIGHT)
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        searchBar.placeholder = "搜索感兴趣的内容"
        return searchBar
    }()
    
    ///tabBar 标签栏
    fileprivate lazy var tabBar:LookAtTabBar = {
        let tabBar = LookAtTabBar(frame: CGRect(x: 0, y: searchBar.frame.maxY, width: SCREEN_WIDTH, height: SEARCHBAR_HEIGHT), titlesArray: ["公司","面试","工资"])
        return tabBar
    }()
    
    ///searchDefaultView
    lazy var defaultView:LookAtSearchDefaultView = {
        let view = LookAtSearchDefaultView(frame: CGRect(x: 0, y: tabBar.frame.maxY, width: SCREEN_WIDTH, height: self.bounds.size.height-SEARCHBAR_HEIGHT*2-STATUSBAR_HEIGHT))
        view.scrollViewDidScrollBlock = { [weak self] scrollView in
            if scrollView.contentOffset.y != 0 {
                self?.searchBar.resignFirstResponder()
            }
        }
        return view
    }()
    
    ///searchResultView
    lazy var resultView:LookAtSearchResultView = {
        let view = LookAtSearchResultView(frame: CGRect(x: 0, y: tabBar.frame.maxY, width: SCREEN_WIDTH, height: self.bounds.size.height-SEARCHBAR_HEIGHT*2-STATUSBAR_HEIGHT))
        view.isHidden = true
        view.cellClickBlock = { [weak self] result in
            self?.searchBar.resignFirstResponder()
            self?.createResultCellClickDelegate(withKeyword: self?.searchBar.text ?? "", andResult: result)
        }
        return view
    }()
    
    ///delegate
    var delegate:LookAtSearchToolDelegete?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        addSubview(searchBar)
        addSubview(tabBar)
        addSubview(defaultView)
        addSubview(resultView)
    }
    
    //设置delegate
    fileprivate func createDelegete() {
        if delegate != nil {
            delegate?.lookAtSearchTool_searchBarCancelButtonClicked!()
        }
    }
    
    fileprivate func createResultCellClickDelegate(withKeyword keyword:String, andResult result:String) {
        if delegate != nil {
            delegate?.lookAtSearchTool_resultCellClickWithKeyword!(keyword:keyword, andResul: result)
        }
    }
}

extension LookAtSearchTool:UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        createDelegete()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let isShow = searchText == "" || (searchText as NSString).range(of: " ").length > 0
        resultView.isHidden = isShow
        defaultView.isHidden = !isShow
    }
    
}


