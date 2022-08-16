//
//  HomeViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/02/10.
//

import UIKit


class HomeViewController: UIViewController {
    
    private let model = HomeModel()
    private lazy var mainView: HomeView = .init()
    
    
    override func loadView() {
        self.view = self.mainView
        self.mainView.homeupsideView.delegate = self
        self.mainView.recommendMovieView.delegate = self
        
        self.mainView.nowPlayingMovieListView.cellDidTap = { (index: Int) -> Void in
            guard let movies = self.model.nowPlayingModel?.results else { return }
            guard let movieID = movies[index].id else { return }
            self.routeToMovieDetail(movieID: movieID)
        }
        
        self.mainView.animationMovieListView.cellDidTap = { (index: Int) in
            
        }
        
        self.mainView.popularMovieListView.cellDidTap = { (index: Int) in
            
        }
        
        self.mainView.newMovieListView.cellDidTap = { (index: Int) in
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //추천영화 관련 디스플레이 콘텐츠
        self.model.requestRecommendMovie { (movie) in
            guard let posterPath = movie.posterPath,
                  let posterURL = URL(string: posterPath),
                  let title = movie.title,
                  let tag = movie.overview
            else { return }
            self.mainView.recommendMovieView.displayContents(model: RecommendMovieViewModel(
                posterURL: posterURL,
                title: title,
                tags: [tag]))
        }
        
        //상영 중인 영화 관련 디스플레이 콘텐츠
        self.model.requestNowPlayingList { (model) in
            let title = "상영 중인 영화"
            let items = model.results.map { $0.convert() }
            let view = self.mainView.nowPlayingMovieListView
            view.displayContents(kategories: title, posterItems: items)
        }
        
        //애니메이션 영화 관련 디스플레이 콘텐츠
        self.model.requestAnimationList {
            self.mainView.animationMovieListView.displayContents(
                kategories: "애니메이션 영화",
                posterItems: $0.results.map { $0.convert() }
            )
        }
    
        //인기 영화 관련 디스플레이 콘텐츠
        self.model.requestPopularMovieList {
            self.mainView.popularMovieListView.displayContents(
                kategories: "인기 영화",
                posterItems: $0.results.map { $0.convert() }
            )
        }
        
        //신작 영화 관련 디스플레이 콘텐츠
        self.model.requestNewMovieList {
            self.mainView.newMovieListView.displayContents(
                kategories: "신작 영화",
                posterItems: $0.results.map { $0.convert() }
            )
        }
        
    }
    
    
    
    private func routeToMovieDetail(movieID: Int) {
        let viewController = MovieDetailViewController()
        viewController.movieID = movieID
        self.present(viewController, animated: true, completion: nil)
    }
    
}



extension HomeViewController: HomeUpsideViewDelegate {
    
    func titleButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func mirroringButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func accountButtonDidTap() {
        print(type(of: self), #function)
    }
    
    
    func seriesButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func movieButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func categoriesButtonDidTap() {
        print(type(of: self), #function)
    }
    
}


extension HomeViewController: RecommendMovieViewDelegate {
    
    func recommendMovieDetailButtonDidTap() {
        guard let model = self.model.recommendMovieModel,
              let movieID = model.id
        else { return }
        self.routeToMovieDetail(movieID: movieID)
    }
    
    func recommendMovieMeaningButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func recommendMoviePlayButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func recommendMovieInformationButtonDidTap() {
        print(type(of: self), #function)
    }
    
}




extension TMDBNowPlayingModel.Movie {
    
    func convert() -> HorizontalContentsPosterListBasicCellModel {
        return .init(
            posterUrl: URL(string: self.posterPath ?? "")!,
            titleText: self.title ?? "")
    }
    
}

