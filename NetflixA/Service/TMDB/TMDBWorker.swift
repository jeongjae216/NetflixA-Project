//
//  TMDBWorker.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/26.
//

import Foundation
import Alamofire
import RxSwift

final class TMDBWorker {
    
    let img_base_url: String = "https://image.tmdb.org/t/p/"
    
    private let api_base_url: String = "https://api.themoviedb.org/3"
    private let api_key: String = "fcd0a1156e70f8d3966d0af6d2ceddd6"
    private let language: String = "ko-KO"
    
    private var session: Session { Alamofire.Session.default }
    
    
    func requestNowPlayingModel(pageNum: Int) -> Single<TMDBNowPlayingModel> {
        return .create { (observer) in
            
            let path = "/movie/now_playing"
            let parameters = "?api_key=\(self.api_key)&language=\(self.language)&page=\(pageNum)"
             
            let url = URL(string: self.api_base_url + path + parameters)!
            
            let request = self.session.request(
                url,
                method: .get,
                parameters: nil,
                encoding: JSONEncoding.prettyPrinted,
                headers: nil)
            request.responseData { (response) in
                switch response.result {
                case .success(let data):
                    guard let model = try? JSONDecoder().decode(TMDBNowPlayingModel.self, from: data) else {
                        observer(.failure(RxError.unknown))
                        return
                    }
                    observer(.success(model))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return Disposables.create { request.cancel() }
        }
    }
    
    
    
    func requestMovieDetailInfo(movieId: Int) -> Single<Any> {
        return .create { (observer) in
            
            let path = "/movie/\(movieId)"
            let parameters = "?api_key=\(self.api_key)&language=\(self.language)"
             
            let url = URL(string: self.api_base_url + path + parameters)!
            
            let request = self.session.request(
                url,
                method: .get,
                parameters: nil,
                encoding: JSONEncoding.prettyPrinted,
                headers: nil)
            request.responseData { (response) in
                switch response.result {
                case .success(let data):
                    guard let model = try? JSONDecoder().decode(TMDBMovieDetailModel.self, from: data) else {
                        observer(.failure(RxError.unknown))
                        return
                    }
                    observer(.success(model))
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            
            return Disposables.create {}
        }
    }
}

