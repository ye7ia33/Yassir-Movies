//
//  MoviesDetailsCoordinator.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import UIKit

class MoviesDetailsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private var viewModel: MoviesDetailsViewModel?
    
    init(navigationController: UINavigationController, movieDetails: MovieDetails) {
        self.navigationController = navigationController
        viewModel = MoviesDetailsViewModel(movieDetails: movieDetails)

    }
    
    func start() {
        guard let _viewModel = self.viewModel else { return }
        let vc = MovieDetailsViewController()
        vc.viewModel = _viewModel
        navigationController.pushViewController(vc, animated: false)
    }
}

