//
//  Coordinator.swift
//  CoordinatorLearn
//
//  Created by Yahia El-Dow on 29/11/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) {
        self.childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}

