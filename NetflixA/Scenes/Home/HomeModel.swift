//
//  HomeModel.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/26.
//

import Foundation
import RxSwift

final class HomeModel {
    private let disposeBag = DisposeBag()
    private let worker = TMDBWorker()
    
    var recommendMovieModel: TMDBNowPlayingModel.Movie?
    var nowPlayingModel: TMDBNowPlayingModel?
    
    func requestRecommendMovie(completion: @escaping (TMDBNowPlayingModel.Movie) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 1)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    guard var movie = model.results.first else {
                        return
                    }
                    movie.posterPath = self.worker.img_base_url + "w500" + (movie.posterPath ?? "")
                    self.recommendMovieModel = movie
                    completion(movie)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    
    func requestNowPlayingList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 1)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    self.nowPlayingModel = model
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    func requestAnimationList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 2)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    func requestPopularMovieList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 3)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    func requestNewMovieList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 4)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    func relatedContentsList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 4)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
    func requestMostSearchMovieList(completion: @escaping (TMDBNowPlayingModel) -> Void) {
        self.worker.requestNowPlayingModel(pageNum: 3)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] (model) in
                    guard let `self` = self else { return }
                    var model = model
                    model.results = model.results.map {
                        var movie = $0
                        movie.posterPath = self.worker.img_base_url + "w200" + (movie.posterPath ?? "")
                        return movie
                    }
                    completion(model)
                },
                onFailure: { (error) in
                    print(error)
                })
            .disposed(by: self.disposeBag)
    }
    
}

