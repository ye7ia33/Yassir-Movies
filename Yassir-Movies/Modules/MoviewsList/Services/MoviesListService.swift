//
//  MoviesListService.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 24/04/2023.
//

import Foundation

final class MoviesListService {
    
    func getMovies( completion: @escaping (_ request: MovieRequestModel?, _ error: String?) -> ()?) {
        let url = "\(Environment.baseURL)/discover/movie"
        let request = AFNRequest(url: url, paramters: Environment.paramters)
        NetworkManager.shared.request(request: request, type: MovieRequestModel.self) { result in
            switch result.result {
            case .success(let data):
                let movieObj = data as? MovieRequestModel
                completion(movieObj, nil)
                break
            case .failure(let err):
                completion(nil, err.localizedDescription)
                break
            }
        }
    }
    
}
