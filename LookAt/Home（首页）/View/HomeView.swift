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
        tableView.registerClassOf(HomeLeaderboardTableViewCell.self)
        tableView.registerClassOf(HomeBusinessTopicTableViewCell.self)
        return tableView
    }()

    ///table header view
    fileprivate lazy var tableHeaderView:HomeHeaderView = {
        let tableHeaderView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: HOME_BANNER_HEIGHT))
        tableHeaderView.block = { [weak self] in
            log(message: "点击首页banner搜索框")
            
        }
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
    
    ///delegate
    var delegate:HomeViewDelegate?
    
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
    
    //设置delegate
    fileprivate func createDelegate(scrollView:UIScrollView) {
        if delegate != nil {
            delegate?.homeView_scrollViewDidScroll!(withScrollView: scrollView)
        }
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
        case 2:
            return 2
        default:
            return 11
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return HOME_BANNER_HEIGHT
        case 1:
            return fontSizeScale(125)
        case 2:
            return indexPath.row == 0 ? fontSizeScale(400) : fontSizeScale(40)
        case 3:
            return indexPath.row < 10 ? fontSizeScale(100) : fontSizeScale(40)
        default:
            return fontSizeScale(40)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell:HomeHotTableViewCell = tableView.dequeueReusableCell()
            cell.selectionStyle = .none
            return cell
        case 1:
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
        case 2:
            if indexPath.row > 0 {
                let cell:UITableViewCell = tableView.dequeueReusableCell()
                cell.textLabel?.text = "查看全部排行榜"
                cell.accessoryType = .disclosureIndicator
                return cell
            }
            
            let cell:HomeLeaderboardTableViewCell = tableView.dequeueReusableCell()
            let model = HomeModel()
            model.setValuesForKeys([
                "homeLeaderboardImg":"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3516256507,689746132&fm=26&gp=0.jpg",
                "homeLeaderboardTitle":"Q1最受欢迎的公司",
                "homeLeaderboardInfo":"113469查看 100家公司"
                ])
            model.homeLeaderboardCompanys = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538566912428&di=81a4f6716321277d50420f382102098f&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fwallpaper%2F1207%2F05%2Fc0%2F12232738_1341469414792.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538566912426&di=8ffdfd1c098b3eb51aa6844ba76efccc&imgtype=0&src=http%3A%2F%2Fps3.tgbus.com%2FUploadFiles%2F201106%2F20110629193829522.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538566912426&di=76d1647545470881df1d984861a91a45&imgtype=0&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F1-5000%2F2009528155512100327908.jpg","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538566912425&di=a2313cfc1a79b502c5e80c90f9187520&imgtype=0&src=http%3A%2F%2Fimg.shu163.com%2Fuploadfiles%2Fwallpaper%2F2010%2F6%2F2010082606112889.jpg"]
            cell.model = model
            cell.block = { [weak self] model in
                log(message: model)
            }
            cell.selectionStyle = .none
            return cell
        case 3:
            if indexPath.row > 9 {
                let cell:UITableViewCell = tableView.dequeueReusableCell()
                cell.textLabel?.text = "查看全部专题"
                cell.accessoryType = .disclosureIndicator
                return cell
            }
            
            let cell:HomeBusinessTopicTableViewCell = tableView.dequeueReusableCell()
            let model = HomeModel()
            model.setValuesForKeys([
                "homeBusinessTopicTitle":"【特色】可以在家躺着上班的公司",
                "homeBusinessTopicSubTitle":"200159查看 14家公司",
                "homeBusinessTopicImg":"http://fc01.deviantart.com/fs45/f/2009/117/8/0/blue_reflections_2_by_Keischa_Assili.jpg"
                ])
            cell.model = model
            return cell
        default:
            return UITableViewCell()
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
        
        createDelegate(scrollView: scrollView)
    }
}
