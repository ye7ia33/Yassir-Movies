//
//  MoviesListViewModel.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import Foundation

class MoviesListViewModel: ViewModel {
    private var moviesList = [MovieDetails]()
    var openMoviesDetails:(_ movieDetails: MovieDetails)->Void = { movieDetails in }

    override init() {
        super.init()
        self.getTrendingMovies()
    }
    
    func getTrendingMovies() {
        super.showLoader()
        MoviesListService().getMovies(completion: { (result, err)  in
            if let _result = result?.results {
                self.moviesList = _result
                super.completionHandler()
            } else {
                super.completionHandlerWithErrorMessage(err ?? "somthing went wrong.")
            }
            super.hideLoader()
        })
    }
    
    func getCount() -> Int {
        return self.moviesList.count
    }
    
    func getMovieByIndex(index: Int) -> MovieDetails? {
        return self.moviesList[safe: index]
    }
    
    func showMovieDetails(movie: MovieDetails) {
        self.openMoviesDetails(movie)
    }
}
