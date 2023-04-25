//
//  MoviesListCoordinator.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import UIKit

class MoviesListCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MoviesListViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
