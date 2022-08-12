//
//  SearchViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/04.
//

import Foundation
import UIKit
import SnapKit
import Alamofire



class SearchViewController: UIViewController {
    
    private let model = HomeModel()
    private lazy var searchView = SearchView()
    private lazy var searchBar = UISearchBar()
    
    
    override func loadView() {
        self.view = self.searchView
        self.searchView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.placeholder = "검색"
        self.searchBar.delegate = self
        self.navigationItem.titleView = self.searchBar
        
        //
        self.model.requestPopularMovieList { model in
            let contents = model.results.map { movie -> SearchView.ContentInfo in
                let url = URL(string: movie.posterPath ?? "")!
                let title = movie.title ?? ""
                return SearchView.ContentInfo(posterImageURL: url, title: title)
            }
            self.searchView.displayContents(contents)
        }
        
    }
    
}


extension SearchViewController: SearchViewDelegate {
    
    func mostSearchingMovieListViewWillBeginDragging(me: SearchView) {
        self.searchBar.endEditing(true)
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
//        let inputedText = searchBar.text
        
//        self.model.requestPopularMovieList { model in
//            let contentsList: [SearchView.ContentInfo] = model.results.map { movie -> SearchView.ContentInfo in
//                let url = URL(string: movie.posterPath ?? "")!
//                let title = movie.title ?? ""
//                return SearchView.ContentInfo(posterImageURL: url, title: title)
//            }
//            self.searchView.displaySearchResultContentsList(contentsList)
//        }
        self.model.requestPopularMovieList {
            self.searchView.displayContents(
                posterItems: $0.results.map { $0._convert() },
                recommendCategoryItems: [
                    "한국 영화",
                    "한국 드라마",
                    "한국 범죄 영화",
                    "한국 영화.로맨스",
                    "흥미진진한 한국 영화",
                    "찬사를 받은 한국 영화",
                    "몰아보기 추천 한국 드라마",
                    "함정", "폭력 한국 영화"
                ]
            )
        }
    }
    
}

extension TMDBNowPlayingModel.Movie {
    
    func _convert() -> SearchResultCollectionViewBasicCellModel {
        return .init(
            posterUrl: URL(string: self.posterPath ?? "")!,
            titleText: self.title ?? "")
    }
    
}
