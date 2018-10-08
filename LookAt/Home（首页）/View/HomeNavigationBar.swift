//
//  HomeNavigationBar.swift
//  LookAt
//
//  Created by zhifu360 on 2018/10/8.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: Home NavigationBar

class HomeNavigationBar: BaseView {

    ///contentView
    fileprivate lazy var contentView:UIView = {
        let view = UIView(withBackgroundColor: UIColor.lineColor)
        view.setCornerRadius()
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapClick(_:))))
        return view
    }()
    
    ///searchImg
    fileprivate var searchImgView:UIImageView = {
        let imgView = UIImageView(image: UIImage.searchImage)
        return imgView
    }()

    ///placeholder
    fileprivate lazy var searchPlaceholder:UILabel = {
        let label = UILabel(withText: "搜索感兴趣的内容", font: UIFont.mediumFont, textColor: UIColor.grayTextColor)
        return label
    }()
    
    ///block
    var block:noneParamsBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    fileprivate func createView() {
        addSubview(contentView)
        contentView.addSubview(searchImgView)
        contentView.addSubview(searchPlaceholder)
        
        //constraints
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(STATUSBAR_HEIGHT)
            make.left.equalTo(fontSizeScale(20))
            make.right.equalTo(-fontSizeScale(20))
            make.height.equalTo(SEARCHBAR_HEIGHT)
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
    @objc fileprivate func tapClick(_ gesture:UITapGestureRecognizer) {
        if block != nil {
            block!()
        }
    }
}
