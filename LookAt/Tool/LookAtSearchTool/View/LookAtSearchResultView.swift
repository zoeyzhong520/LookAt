//
//  LookAtSearchResultView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/11/20.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class LookAtSearchResultView: UIView {

    ///block
    var cellClickBlock:commonBlock<String>?
    
    var resultModel:Array<String>? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    fileprivate lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClassOf(UITableViewCell.self)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///UI
    fileprivate func createView() {
        
        addSubview(self.tableView)
    }
}

extension LookAtSearchResultView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell()
        cell.textLabel?.text = resultModel?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if cellClickBlock != nil {
            cellClickBlock!(resultModel?[indexPath.row] ?? "")
        }
    }
}
