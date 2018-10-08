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
        adPageView.animateDuration = 2
        adPageView.block = { [weak self] currentIndex in
            log(message: currentIndex)
        }
        return adPageView
    }()

    ///search view
    fileprivate lazy var searchView:UIView = {
        let searchView = UIView(withBackgroundColor: UIColor.white)
        searchView.setCornerRadius()
        //手势
        searchView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(searchViewTapAction(_:))))
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
    
    ///Block
    var block:noneParamsBlock?
    
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
    
    //点击事件
    @objc fileprivate func searchViewTapAction(_ gesture:UITapGestureRecognizer) {
        if block != nil {
            block!()
        }
    }
}
