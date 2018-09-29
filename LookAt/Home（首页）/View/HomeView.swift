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
        tableView.registerClassOf(HomeHotTableViewCell.self)
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
    fileprivate func createView() {
        addSubview(tableView)
        tableView.tableHeaderView = tableHeaderView
    }
}

extension HomeView:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? HOME_BANNER_HEIGHT : fontSizeScale(40)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:HomeHotTableViewCell = tableView.dequeueReusableCell()
            cell.selectionStyle = .none
            return cell
        } else {
            return tableView.dequeueReusableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.1 : HOMEVC_TABLE_SECTION_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let header = HomeTableSectionHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 0))
            header.changeBatchButtonVisible = section == 1
            header.titleText = "啦啦"
            header.block = { [weak self] in
                log(message: 1)
            }
            return header
        } else {
            return nil
        }
    }
    
    //UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= HOMEVC_TABLE_SECTION_HEIGHT && scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= HOMEVC_TABLE_SECTION_HEIGHT {
            scrollView.contentInset = UIEdgeInsets(top: -HOMEVC_TABLE_SECTION_HEIGHT, left: 0, bottom: 0, right: 0)
        }
    }
}
