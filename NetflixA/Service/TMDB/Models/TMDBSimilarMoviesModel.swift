//
//  TMDBSimilarMoviesModel.swift
//  NetflixA
//
//  Created by 정재 on 2022/08/16.
//

import Foundation

struct TMDBSimilarMoviesModel: Codable {
    
    // MARK: - TMDBSimilarMoviesModel
    
    var page: Int?
    var results: [Movie]?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    // MARK: - Result
    struct Movie: Codable {
        var adult: Bool?
        var backdropPath: String?
        var genreIDS: [Int]?
        var id: Int?
        var originalTitle: String?
        var overview: String?
        var popularity: Double?
        var posterPath: String?
        var releaseDate: String?
        var title: String?
        var video: Bool?
        var voteAverage: Double?
        var voteCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case adult = "adult"
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id = "id"
            case originalTitle = "original_title"
            case overview = "overview"
            case popularity = "popularity"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title = "title"
            case video = "video"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
    
    
}
