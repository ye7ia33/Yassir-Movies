//
//  UITableView+Extension.swift
//  Created by Yahia El-Dow.

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        register(UINib(nibName: type.nibName, bundle: nil), forCellReuseIdentifier: type.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
  
}
