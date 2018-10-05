//
//  HomeBusinessTopicTableViewCell.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/29.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

//MARK: 企业专题 cell

class HomeBusinessTopicTableViewCell: UITableViewCell {

    ///titleLabel
    fileprivate lazy var titleLabel:UILabel = {
        let label = UILabel(withText: "", font: UIFont.bigBoldFont, textColor: UIColor.blackTextColor)
        return label
    }()
    
    ///subTitleLabel
    fileprivate lazy var subTitleLabel:UILabel = {
        let label = UILabel(withText: "", font: UIFont.smallFont, textColor: UIColor.grayTextColor)
        return label
    }()
    
    ///imgView
    fileprivate lazy var imgView:UIImageView = {
        let imgView = UIImageView()
        imgView.setCornerRadius()
        return imgView
    }()
    
    ///model
    var model:HomeModel? {
        didSet {
            titleLabel.text = model?.homeBusinessTopicTitle
            subTitleLabel.text = model?.homeBusinessTopicSubTitle
            imgView.kf.setImage(with: URL(string: model?.homeBusinessTopicImg ?? ""), placeholder: UIImage.placeholderImage)
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
    fileprivate func createView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(imgView)
        
        //constraints
        imgView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(90), height: fontSizeScale(60)))
            make.right.equalTo(-fontSizeScale(10))
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fontSizeScale(20))
            make.left.equalTo(fontSizeScale(15))
            make.right.equalTo(imgView.snp.left)
            make.height.equalTo(fontSizeScale(16))
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(20))
            make.bottom.equalTo(-fontSizeScale(10))
            make.right.equalTo(imgView.snp.left)
            make.height.equalTo(fontSizeScale(20))
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
