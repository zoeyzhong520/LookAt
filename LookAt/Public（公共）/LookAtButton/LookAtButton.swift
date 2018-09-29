//
//  LookAtButton.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

class LookAtButton: UIView {

    ///imgViewW
    fileprivate let imgViewW:CGFloat = fontSizeScale(40)
    
    ///buttonImage
    fileprivate lazy var imgView:UIImageView = {
        let imgView = UIImageView(image: UIImage.placeholderImage)
        imgView.setCornerRadius(withCornerRadius: imgViewW/2)
        imgView.backgroundColor = UIColor.mongolianColor
        return imgView
    }()
    
    ///titleLabel
    fileprivate lazy var titleLabel:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.blackTextColor)
        label.textAlignment = .center
        return label
    }()

    ///imageName
    var imageName:String? {
        didSet {
            imgView.image = UIImage(named: imageName ?? "")
        }
    }
    
    ///titleText
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
        addSubview(imgView)
        addSubview(titleLabel)
        
        //约束
        imgView.snp.makeConstraints { (make) in
            make.centerX.top.equalToSuperview()
            make.size.equalTo(CGSize(width: imgViewW, height: imgViewW))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom).offset(fontSizeScale(10))
            make.height.equalTo(fontSizeScale(12))
        }
        
        //手势
        addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
    }
    
    //点击事件
    @objc fileprivate func tapAction() {
        if block != nil {
            block!()
        }
    }
}
