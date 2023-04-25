//
//  MoviesListViewController.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 24/04/2023.
//

import UIKit

class MoviesListViewController: UIViewController, Storyboarded {
    @IBOutlet weak var moviesTableView: UITableView!
    private var viewModel: MoviesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending Movies"
        self.setupTableView()
        self.setViewModel()

    }

    private func setViewModel() {
        self.viewModel = MoviesListViewModel()
        viewModel?.showLoader = {  [weak self] in
            self?.showLoader()
        }
        
        viewModel?.hideLoader = {  [weak self] in
            self?.hideLoader()
        }
        
        viewModel?.completionHandlerWithErrorMessage = { [weak self] (errMsg) in
            self?.showToast(message: errMsg)
        }
        
        viewModel?.completionHandler = { [weak self] in
            self?.moviesTableView.reloadData()
        }
        
        viewModel?.openMoviesDetails = { [weak self] movieDetails in
            self?.openDetailsScreen(movie: movieDetails)
        }
    }
    
    private func setupTableView() {
        self.moviesTableView.registerCell(MovieTableViewCell.self)
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
    }
  
    private func openDetailsScreen(movie: MovieDetails) {
        let coordinator = MoviesDetailsCoordinator(navigationController: self.navigationController ?? UINavigationController(), movieDetails: movie)
        coordinator.start()
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.getMovieCell(indexPath: indexPath) else { return UITableViewCell() }
        return cell
    }
    
    private func getMovieCell(indexPath: IndexPath) -> MovieTableViewCell? {
        let cell: MovieTableViewCell? = self.moviesTableView.dequeueCell(indexPath: indexPath)
        if let movie = viewModel?.getMovieByIndex(index: indexPath.section) {
            cell?.config(movie: movie)
        }
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Return the height of the section header
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create a custom view for the section header
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = viewModel?.getMovieByIndex(index: indexPath.section) else { return }
        self.viewModel?.showMovieDetails(movie: movie)
    }
}
