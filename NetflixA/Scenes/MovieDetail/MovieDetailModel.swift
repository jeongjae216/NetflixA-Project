//
//  MovieDetailModel.swift
//  NetflixA
//
//  Created by 정재 on 2022/08/16.
//

import Foundation

class MovieDetailModel {
    
    private let worker: TMDBWorker = .init()
    
    func requestMovieDetailInfo(of movieID: Int, completion: @escaping (TMDBMovieDetailModel) -> Void) {
        self.worker.requestMovieDetailInfo(
            movieId: movieID,
            success: { model in
                var model = model
                model.posterPath = self.worker.img_base_url + "w500" + (model.posterPath ?? "")
                completion(model)
            },
            failure: { error in
                print(error)
            })
    }
    
    func requestRelatedMovies(of movieID: Int, completion: @escaping (TMDBSimilarMoviesModel) -> Void) {
        self.worker.requestSimilarMovies(
            movieID: movieID,
            success: { model in
                var model = model
                model.results = model.results?.map {
                    var movie = $0
                    movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                    return  movie
                }
                completion(model)
            },
            failure: { error in
                print(error)
            })
    }
}
