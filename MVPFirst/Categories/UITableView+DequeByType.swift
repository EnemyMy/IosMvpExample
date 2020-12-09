//
//  UITableView+DequeByType.swift
//  MVPFirst
//
//  Created by Алексей on 08.12.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(cell: T.Type) {
        register(T.self, forCellReuseIdentifier: cell.description())
    }
    
    func dequeCell<T: UITableViewCell>(cell: T.Type) -> T? {
        dequeueReusableCell(withIdentifier: cell.description()) as? T
    }
    
    func dequeCell<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: cell.description(), for: indexPath) as! T
    }
}
