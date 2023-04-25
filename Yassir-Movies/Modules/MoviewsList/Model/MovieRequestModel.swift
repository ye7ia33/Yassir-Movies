//
//  MovieRequestModel.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 24/04/2023.
//

import Foundation

struct MovieRequestModel: Decodable {
    let page: Int?
    let results: [MovieDetails]?
    let total_pages: Int?
    let total_results: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([MovieDetails].self, forKey: .results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
    }
    
}

struct MovieDetails: Decodable {
    let id: Int?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case original_title = "original_title"
        case overview = "overview"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .original_title)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try values.decodeIfPresent(String.self, forKey: .poster_path)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .release_date)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .vote_count)
    }
    
}
