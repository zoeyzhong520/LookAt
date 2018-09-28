//
//  HomeView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/25.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class HomeView: BaseView {

    ///table view
    fileprivate lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClassOf(UITableViewCell.self)
        return tableView
    }()

    ///table header view
    fileprivate lazy var tableHeaderView:HomeHeaderView = {
        let tableHeaderView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: HOME_BANNER_HEIGHT))
        return tableHeaderView
    }()
    
    ///adImagesArray
    var adImagesArray:[String?]? {
        didSet {
            tableHeaderView.adImagesArray = adImagesArray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    func createView() {
        addSubview(tableView)
        tableView.tableHeaderView = tableHeaderView
    }
}

extension HomeView:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分组\(section)"
    }
}
