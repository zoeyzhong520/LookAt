//
//  LookAtSearchViewController.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit
import RealmSwift

class LookAtSearchViewController: BaseViewController {
    
    ///lookAt search tool
    fileprivate lazy var lookAtSearchTool:LookAtSearchTool = {
        let tool = LookAtSearchTool(frame: self.view.bounds)
        tool.delegate = self
        return tool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setPage()
        
        getData()
    }
    
    //UI
    fileprivate func setPage() {
        view.addSubview(lookAtSearchTool)
    }

    ///get data
    fileprivate func getData() {
        
        lookAtSearchTool.defaultView.model = defaultViewModel()
        lookAtSearchTool.defaultView.keywords = defaultViewKeywords()
        lookAtSearchTool.resultView.resultModel = ["A","B","C","D","E"]
    }
    
    ///defaultViewModel
    fileprivate func defaultViewModel() -> LookAtSearchModel {
        
        let defaultViewModel = LookAtSearchModel()
        defaultViewModel.hotCompanys = [["途牛旅行网","苹果（Apple）","渣打"],["搜狐","德勤中国","美团网"]]
        return defaultViewModel
    }
    
    ///defaultViewKeywords
    fileprivate func defaultViewKeywords() -> Results<LookAtSearchKeyword>? {
        
        return LookAtRealmTool.realm().objects(LookAtSearchKeyword.self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension LookAtSearchViewController:LookAtSearchToolDelegete {
    
    func lookAtSearchTool_searchBarCancelButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func lookAtSearchTool_resultCellClickWithKeyword(keyword: String, andResul result: String) {
        
        log(message: "keyword===\(keyword), result===\(result)")
        
        //存储keyword
        LookAtRealmTool.saveKeyword(withKeyword: keyword)
        
        dismiss(animated: true, completion: nil)
    }
}
