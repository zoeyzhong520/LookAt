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
        tableView.registerClassOf(HomeRecommendTableViewCell.self)
        return tableView
    }()

    ///table header view
    fileprivate lazy var tableHeaderView:HomeHeaderView = {
        let tableHeaderView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: HOME_BANNER_HEIGHT))
        return tableHeaderView
    }()
    
    ///分组标题数组
    fileprivate var sectionTitlesArray = ["推荐","排行榜","企业专题"]
    
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
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return HOME_BANNER_HEIGHT
        case 1:
            return fontSizeScale(125)
        default:
            return fontSizeScale(40)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:HomeHotTableViewCell = tableView.dequeueReusableCell()
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {//recommend cell
            let cell:HomeRecommendTableViewCell = tableView.dequeueReusableCell()
            let model = HomeModel()
            model.setValuesForKeys(
                                   ["companyName":"支付宝（中国）网络技术有限公司",
                                    "companyLocation":"杭州·互联网金融·1000-9999人",
                                    "companyInfo":"点评229 面经565 问答80 职位589",
                                    "companyHonor":"入选“2017年度最佳公司榜TOP100”",
                                    "companyLogo":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538309240329&di=a0354f70f43aabb92ee3fdafec58e76e&imgtype=0&src=http%3A%2F%2Fimages.669pic.com%2Felement_pic%2F95%2F6%2F81%2F53%2F978f45e99fae88bde65934d7afaf92e1.jpg"]
            )
            cell.model = model
            return cell
        }
        else {
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
            header.titleText = sectionTitlesArray[section-1]
            header.block = { [weak self] in
                log(message: "换一批")
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
