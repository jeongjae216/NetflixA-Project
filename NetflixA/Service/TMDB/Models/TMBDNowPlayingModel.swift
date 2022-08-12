//
//  TMBDNowPlayingModel.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/26.
//

import Foundation

struct TMDBNowPlayingModel: Codable {
    var page: Int
    var results: [Movie]
    var totalPages: Int
    var totalResults: Int
    var title: String?
    var overview: String?

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Movie: Codable {
        var posterPath: String?
        var adult: Bool?
        var overview: String?
        var releaseDate: String?
        var genreIDS: [Int]?
        var id: Int?
        var originalTitle: String?
        var originalLanguage: String?
        var title: String?
        var backdropPath: String?
        var popularity: Double?
        var voteCount: Int?
        var video: Bool?
        var voteAverage: Double?

        enum CodingKeys: String, CodingKey {
            case posterPath = "poster_path"
            case adult = "adult"
            case overview = "overview"
            case releaseDate = "release_date"
            case genreIDS = "genre_ids"
            case id = "id"
            case originalTitle = "original_title"
            case originalLanguage = "original_language"
            case title = "title"
            case backdropPath = "backdrop_path"
            case popularity = "popularity"
            case voteCount = "vote_count"
            case video = "video"
            case voteAverage = "vote_average"
        }
    }

}

