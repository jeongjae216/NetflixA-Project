//
//  TMDBMovieDetailModel.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/10.
//

import Foundation



// MARK: - TMDBMovieDetailModel
struct TMDBMovieDetailModel: Codable {
    var adult: Bool?
    var backdropPath: String?
    var belongsToCollection: BelongsToCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdbID: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var releaseDate: String?
    var revenue: Int?
    var runtime: Int?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    
    
    // MARK: - BelongsToCollection
    struct BelongsToCollection: Codable {
        var id: Int?
        var name: String?
        var posterPath: String?
        var backdropPath: String?

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case posterPath = "poster_path"
            case backdropPath = "backdrop_path"
        }
    }
    
    
    // MARK: - Genre
    struct Genre: Codable {
        var id: Int?
        var name: String?

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
    }

}
