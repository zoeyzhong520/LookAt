//
//  HomeLeaderboardCollectionViewCell.swift
//  LookAt
//
//  Created by 陈琳 on 2018/10/3.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: HomeLeaderboard CollectionViewCell

class HomeLeaderboardCollectionViewCell: UICollectionViewCell {
    
    ///imageView
    fileprivate lazy var imgView:UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    ///detailView
    fileprivate lazy var detailView:UIView = {
        let view = UIView()
        return view
    }()
    
    ///titleLabel
    fileprivate lazy var titleLabel:UILabel = {
        let titleLabel = UILabel(withText: "", font: UIFont.bigBoldFont, textColor: UIColor.blackTextColor)
        return titleLabel
    }()
    
    ///infoLabel
    fileprivate lazy var infoLabel:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.grayTextColor)
        return label
    }()
    
    ///companysView
    fileprivate lazy var companysView:UIView = {
        return UIView()
    }()
    
    ///model
    var model:HomeModel? {
        didSet {
            imgView.kf.setImage(with: URL(string: model?.homeLeaderboardImg ?? ""), placeholder: UIImage.placeholderImage)
            titleLabel.text = model?.homeLeaderboardTitle
            infoLabel.text = model?.homeLeaderboardInfo
            
            configCompanys()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createView() {
        contentView.setBorder(borderColor: UIColor.grayTextColor)
        contentView.setCornerRadius()
        
        contentView.addSubview(imgView)
        
        contentView.addSubview(detailView)
        detailView.addSubview(titleLabel)
        detailView.addSubview(infoLabel)
        
        contentView.addSubview(companysView)
        
        //constraints
        imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: bounds.size.height/2, right: 0))
        }
        
        detailView.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(10))
            make.right.equalTo(-fontSizeScale(10))
            make.height.equalTo(fontSizeScale(16))
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(fontSizeScale(5))
            make.right.equalTo(-fontSizeScale(10))
            make.height.equalTo(fontSizeScale(12))
        }
        
        companysView.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(fontSizeScale(5))
            make.left.right.equalToSuperview()
            make.height.equalTo(bounds.size.height/5)
        }
    }
    
    //config companys
    fileprivate func configCompanys() {
        guard let tmpCompanys = model?.homeLeaderboardCompanys else {
            fatalError("homeLeaderboardCompanys is nil")
        }
        
        let margin:CGFloat = fontSizeScale(10)
        let imgWidth:CGFloat = (fontSizeScale(165)-margin*6)/5
        let imgHeight:CGFloat = imgWidth
        let originY:CGFloat = (bounds.size.height/5 - imgHeight)/2
        
        for i in 0..<tmpCompanys.count {
            let imgView = UIImageView()
            imgView.kf.setImage(with: URL(string: tmpCompanys[i] ?? ""), placeholder: UIImage.placeholderImage)
            imgView.frame = CGRect(x: (imgWidth+margin)*CGFloat(i)+margin, y: originY, width: imgWidth, height: imgHeight)
            imgView.setCornerRadius(withCornerRadius: imgHeight/2)
            companysView.addSubview(imgView)
        }
    }
}
