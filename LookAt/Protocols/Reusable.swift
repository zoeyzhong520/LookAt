//
//  Reusable.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var lookAt_reuseIdentifier: String { get }
}

extension UITableViewCell: Reusable {
    static var lookAt_reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: Reusable {
    static var lookAt_reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: Reusable {
    static var lookAt_reuseIdentifier: String {
        return String(describing: self)
    }
}
