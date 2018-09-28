//
//  UITableView+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerClassOf<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.lookAt_reuseIdentifier)
    }
    
    func registerHeaderFooterClassOf<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.lookAt_reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.lookAt_reuseIdentifier) as? T else {
            fatalError("dequeue reusable cell with identifier failed \(T.lookAt_reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueResuableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.lookAt_reuseIdentifier) as? T else {
            fatalError("dequeue reusble header footer with identifier failed \(T.lookAt_reuseIdentifier)")
        }
        return view
    }
    
}
