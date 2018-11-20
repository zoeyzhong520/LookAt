//
//  LookAtSearchTool.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: LookAt SearchTool

class LookAtSearchTool: UIView {
    
    fileprivate var keywords:Results<LookAtSearchKeyword>?
    
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
    fileprivate lazy var defaultView:LookAtSearchDefaultView = {
        let view = LookAtSearchDefaultView(frame: CGRect(x: 0, y: tabBar.frame.maxY, width: SCREEN_WIDTH, height: self.bounds.size.height-SEARCHBAR_HEIGHT*2-STATUSBAR_HEIGHT))
        view.scrollViewDidScrollBlock = { [weak self] scrollView in
            if scrollView.contentOffset.y != 0 {
                self?.searchBar.resignFirstResponder()
            }
        }
        return view
    }()
    
    ///searchResultView
    fileprivate lazy var resultView:LookAtSearchResultView = {
        let view = LookAtSearchResultView(frame: CGRect(x: 0, y: tabBar.frame.maxY, width: SCREEN_WIDTH, height: self.bounds.size.height-SEARCHBAR_HEIGHT*2-STATUSBAR_HEIGHT))
        view.isHidden = true
        view.cellClickBlock = { [weak self] keyword in
            self?.saveKeyword()
            self?.createResultCellClickDelegate(withKeyword: keyword)
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
        
        //数据
        let defaultViewModel = LookAtSearchModel()
        defaultViewModel.hotCompanys = [
            [   "途牛旅行网",
                "苹果（Apple）",
                "渣打"
            ],
            [
                "搜狐",
                "德勤中国",
                "美团网"
            ]
        ]
        defaultView.model = defaultViewModel
        
        //获取搜索的关键字
        getKeywords()
        
        resultView.resultModel = ["0","1","2","3","4"]
    }
    
    fileprivate func getKeywords() {
        
        keywords = try! Realm().objects(LookAtSearchKeyword.self)
        defaultView.keywords = keywords
        log(message: keywords)
    }
    
    //设置delegate
    fileprivate func createDelegete() {
        if delegate != nil {
            delegate?.lookAtSearchTool_searchBarCancelButtonClicked!()
        }
    }
    
    fileprivate func createResultCellClickDelegate(withKeyword keyword:String) {
        if delegate != nil {
            delegate?.lookAtSearchTool_resultCellClickWithKeyword!(keyword:keyword)
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
        if isShow {
            getKeywords()
        }
    }
    
    //存储搜索keyword
    fileprivate func saveKeyword() {
        
        let keyword = searchBar.text ?? ""
        
        if keyword.count <= 0 || keyword == "" || (keyword as NSString).range(of: " ").length > 0 {
            return
        }
        
        let realm = try! Realm()
        let keywordObject = LookAtSearchKeyword()
        keywordObject.keyword = keyword
        try! realm.write {
            realm.add(keywordObject)
        }
    }
}


