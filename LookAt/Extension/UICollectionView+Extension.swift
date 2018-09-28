//
//  UICollectionView+Extension.swift
//  LookAt
//
//  Created by zhifu360 on 2018/9/28.
//  Copyright © 2018 LookAt. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerClassOf<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.lookAt_reuseIdentifier)
    }
    
    func registerHeaderClassOf<T: UICollectionReusableView>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.lookAt_reuseIdentifier)
    }
    
    func registerFooterClassOf<T: UICollectionReusableView>(_: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.lookAt_reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(withIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.lookAt_reuseIdentifier, for: indexPath) as? T else {
            fatalError("dequeue reusable cell with identifier failed \(T.lookAt_reuseIdentifier)")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(withKind kind: String, indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.lookAt_reuseIdentifier, for: indexPath) as? T else {
            fatalError("dequeue reusable supplementary view with identifier failed \(T.lookAt_reuseIdentifier)")
        }
        return view
    }
}
