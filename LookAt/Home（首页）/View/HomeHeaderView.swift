//
//  HomeHeaderView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: home header view

class HomeHeaderView: BaseView {

    ///ad view
    fileprivate lazy var adPageView:HomeAdvertisingPageView = {
        let adPageView = HomeAdvertisingPageView(frame: self.bounds)
        return adPageView
    }()

    ///search view
    fileprivate lazy var searchView:UIView = {
        let searchView = UIView(withBackgroundColor: UIColor.white)
        searchView.setCornerRadius()
        return searchView
    }()
    
    ///searchImgView
    fileprivate lazy var searchImgView:UIImageView = {
        let searchImgView = UIImageView(image: UIImage.searchImage)
        return searchImgView
    }()
    
    ///search placeholder
    fileprivate lazy var searchPlaceholder:UILabel = {
        let searchPlaceholder = UILabel(withText: "搜索感兴趣的内容", font: UIFont.mediumFont, textColor: UIColor.blackTextColor)
        return searchPlaceholder
    }()
    
    ///adImagesArray
    var adImagesArray:[String?]? {
        didSet {
            adPageView.imagesPathArray = adImagesArray
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
        addSubview(adPageView)
        
        addSubview(searchView)
        searchView.addSubview(searchImgView)
        searchView.addSubview(searchPlaceholder)
        
        //添加约束
        searchView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(20))
            make.right.equalTo(-fontSizeScale(20))
            make.height.equalTo(SEARCHBAR_HEIGHT)
            make.bottom.equalTo(-SEARCHBAR_HEIGHT)
        }
        
        searchImgView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
        }
        
        searchPlaceholder.snp.makeConstraints { (make) in
            make.left.equalTo(searchImgView.snp.right).offset(fontSizeScale(10))
            make.top.bottom.right.equalTo(0)
        }
    }
}
