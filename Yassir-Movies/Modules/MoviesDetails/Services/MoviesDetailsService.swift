//
//  MoviesDetailsService.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import Foundation

struct MoviesDetailsService {
   
    func getMovieDetails(movieId: Int,  completion: @escaping (_ movieObject: MovieDetails?, _ error: String?) -> ()?) {
        let url = "\(Environment.baseURL)/movie/\(movieId)"
        let request = AFNRequest(url: url, paramters: Environment.paramters)
        NetworkManager.shared.request(request: request, type: MovieDetails.self) { result in
            switch result.result {
            case .success(let data):
                let movieDetails = data as? MovieDetails
                 completion(movieDetails, nil)
                break
            case .failure(let err):
                 completion(nil, err.localizedDescription)
                break
            }
        }
    }
}
