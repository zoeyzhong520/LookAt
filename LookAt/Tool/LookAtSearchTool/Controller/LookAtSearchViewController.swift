//
//  LookAtSearchViewController.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

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
    }
    
    //UI
    fileprivate func setPage() {
        view.addSubview(lookAtSearchTool)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension LookAtSearchViewController:LookAtSearchToolDelegete {
    
    func lookAtSearchTool_searchBarCancelButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func lookAtSearchTool_resultCellClickWithKeyword(keyword: String) {
        log(message: "keyword===\(keyword)")
        dismiss(animated: true, completion: nil)
    }
}
