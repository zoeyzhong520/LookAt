//
//  HomeTableSectionHeaderView.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class HomeTableSectionHeaderView: BaseView {

    ///titleLabel
    fileprivate lazy var titleLabel:UILabel = {
        let titleLabel = UILabel(withText: "", font: UIFont.superBigBoldFont, textColor: UIColor.blackTextColor)
        return titleLabel
    }()
    
    ///换一批 按钮
    fileprivate lazy var changeBatchButton:UIButton = {
        let changeBatchButton = UIButton(withTitle: "换一批", titleColor: UIColor.grayTextColor, normalImage: UIImage.changeBatchImage, target: self, action: #selector(buttonClick(_:)))
        changeBatchButton.isHidden = true
        changeBatchButton.titleLabel?.font = UIFont.mediumFont
        return changeBatchButton
    }()
    
    ///lineView
    fileprivate lazy var lineView:UIView = {
        let lineView = UIView(withBackgroundColor: UIColor.lineColor)
        return lineView
    }()
    
    ///changeBatchButtonVisible，默认false
    var changeBatchButtonVisible:Bool? {
        didSet {
            if changeBatchButtonVisible == true {
                changeBatchButton.isHidden = false
            } else {
                changeBatchButton.isHidden = true
            }
        }
    }
    
    ///title text
    var titleText:String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
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
        addSubview(titleLabel)
        addSubview(changeBatchButton)
        addSubview(lineView)
        
        //约束
        lineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(10))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalTo(fontSizeScale(20))
            make.width.equalTo(SCREEN_WIDTH/2)
        }
        
        changeBatchButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.right.equalToSuperview()
            make.width.equalTo(fontSizeScale(100))
        }
        
        //默认值
        changeBatchButtonVisible = false
    }
    
    //点击事件
    @objc fileprivate func buttonClick(_ button:UIButton) {
        if block != nil {
            block!()
        }
    }
}
