//
//  LookAtSearchDefaultView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: LookAtSearch DefaultView

class LookAtSearchDefaultView: UIView {

    fileprivate lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = SEARCHBAR_HEIGHT
        tableView.registerClassOf(UITableViewCell.self)
        tableView.registerClassOf(LookAtSearchDefaultHotCompanyTableViewCell.self)
        return tableView
    }()
    
    ///scrollViewDidScrollBlock
    var scrollViewDidScrollBlock:commonBlock<UIScrollView>?
    
    ///model
    var model:LookAtSearchModel? {
        didSet {
            tableView.reloadData()
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
    }
    
    //设置block
    fileprivate func createBlock(_ scrollView:UIScrollView) {
        if scrollViewDidScrollBlock != nil {
            scrollViewDidScrollBlock!(scrollView)
        }
    }
}

extension LookAtSearchDefaultView:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? (model?.hotCompanys?.count ?? 0) : 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:LookAtSearchDefaultHotCompanyTableViewCell = tableView.dequeueReusableCell()
            cell.model = self.model?.hotCompanys?[indexPath.row]
            cell.block = { [weak self] buttonTitle in
                log(message: buttonTitle)
            }
            cell.selectionStyle = .none
            return cell
        } else {
            return tableView.dequeueReusableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(withBackgroundColor: UIColor.lineColor)
        let label = UILabel(withText: section == 0 ? "HOT 热门公司" : "最近搜索", font: UIFont.smallFont, textColor: UIColor.black)
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: fontSizeScale(10), bottom: 0, right: 0))
        }
        return view
    }
    
    //UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight = SEARCHBAR_HEIGHT
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
        
        createBlock(scrollView)
    }
}


