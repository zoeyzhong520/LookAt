//
//  HomeRecommendTableViewCell.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: recommend cell

class HomeRecommendTableViewCell: UITableViewCell {

    ///companyName
    fileprivate lazy var companyName:UILabel = {
        let label = UILabel(withText: "", font: UIFont.bigBoldFont, textColor: UIColor.blackTextColor)
        return label
    }()
    
    ///companyLocation
    fileprivate lazy var companyLocation:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.grayTextColor)
        return label
    }()
    
    ///companyInfo
    fileprivate lazy var companyInfo:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.grayTextColor)
        return label
    }()
    
    ///companyHonor
    fileprivate lazy var companyHonor:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.green)
        label.setCornerRadius(withCornerRadius: CORNERRADIUS/2)
        label.setBorder(borderColor: UIColor.green)
        return label
    }()
    
    ///companyLogo
    fileprivate lazy var companyLogo:UIImageView = {
        let logo = UIImageView()
        logo.setCornerRadius(withCornerRadius: CORNERRADIUS)
        return logo
    }()
    
    ///数据模型
    var model:HomeModel? {
        didSet {
            companyName.text = model?.companyName
            companyLocation.text = model?.companyLocation
            companyInfo.text = model?.companyInfo
            companyHonor.text = model?.companyHonor
            companyLogo.kf.setImage(with: URL(string: model?.companyLogo ?? ""), placeholder: UIImage.placeholderImage)
            
            //constraints
            companyName.snp.updateConstraints { (make) in
                make.size.equalTo(CGSize(width: companyName.textWidth(), height: fontSizeScale(16)))
            }
            
            companyLocation.snp.updateConstraints { (make) in
                make.size.equalTo(CGSize(width: companyLocation.textWidth(), height: fontSizeScale(12)))
            }
            
            companyInfo.snp.updateConstraints { (make) in
                make.size.equalTo(CGSize(width: companyInfo.textWidth(), height: fontSizeScale(12)))
            }
            
            companyHonor.snp.updateConstraints { (make) in
                make.size.equalTo(CGSize(width: companyHonor.textWidth(), height: fontSizeScale(16)))
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //UI
    func createView() {
        contentView.addSubview(companyName)
        contentView.addSubview(companyLocation)
        contentView.addSubview(companyInfo)
        contentView.addSubview(companyHonor)
        contentView.addSubview(companyLogo)
        
        //constraints
        companyName.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(20))
            make.size.equalTo(CGSize(width: companyName.textWidth(), height: fontSizeScale(16)))
        }
        
        companyLocation.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(companyName)
            make.top.equalTo(companyName.snp.bottom).offset(fontSizeScale(10))
            make.size.equalTo(CGSize(width: companyLocation.textWidth(), height: fontSizeScale(14)))
        }
        
        companyInfo.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(companyName)
            make.top.equalTo(companyLocation.snp.bottom).offset(fontSizeScale(10))
            make.size.equalTo(CGSize(width: companyInfo.textWidth(), height: fontSizeScale(14)))
        }
        
        companyHonor.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(companyName)
            make.top.equalTo(companyInfo.snp.bottom).offset(fontSizeScale(10))
            make.size.equalTo(CGSize(width: companyHonor.textWidth(), height: fontSizeScale(16)))
        }
        
        companyLogo.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(50), height: fontSizeScale(50)))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
