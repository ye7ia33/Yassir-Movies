//
//  MoviesDetailsViewModel.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import Foundation

class MoviesDetailsViewModel: ViewModel {
    private var moviesObject: MovieDetails
    
    init(movieDetails: MovieDetails) {
        self.moviesObject = movieDetails
        super.init()
    }
    
    func getMoviesDetails() {
        guard let movieId = self.moviesObject.id else {
            super.completionHandlerWithErrorMessage("Movie ID not found.")
            return
        }
        super.showLoader()
        MoviesDetailsService().getMovieDetails(movieId: movieId) { [weak self] (movieObject,error) in 
            if let _result = movieObject {
                self?.moviesObject = _result
                self?.completionHandler()
            } else {
                self?.completionHandlerWithErrorMessage(error ?? "somthing went wrong.")
            }
            self?.hideLoader()
        }
    }
    
   
    func getPosterURL() -> String? {
        if let posterURL = moviesObject.posterPath {
            return "\(Environment.imagePath)\(posterURL)"
        }
        return nil
    }
    
    func getTitle() -> String {
        return self.moviesObject.originalTitle ?? ""
    }
    
    func getSubtitle() -> String {
        return self.moviesObject.releaseDate ?? ""
    }
    
    func getOverview() -> String {
        return self.moviesObject.overview ?? ""
    }
    
    
}
