//
//  MovieDetailViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/19.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage


class MovieDetailViewController: UIViewController {
    
    private let model = HomeModel()
    
    private var previewView: MovieDetailPreviewView!
    private var informationView: MovieDetailInformationView!
    private var relatedContentsView: MovieDetailRelatedContentsView!
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .black
        
        //포스터 미리보기 뷰
        self.previewView = MovieDetailPreviewView()
        self.view.addSubview(self.previewView)
        self.previewView.snp.makeConstraints {
            $0.width.centerX.top.equalToSuperview()
            $0.height.equalTo(self.view.snp.width).multipliedBy(3.0/5.0)
            $0.height.lessThanOrEqualTo(250)
        }
        self.previewView.delegate = self
        self.previewView.border()
        
        //스크롤 뷰
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.width.centerX.bottom.equalToSuperview()
            $0.top.equalTo(self.previewView.snp.bottom)
        }
//        scrollView.border(width: 5, color: .blue, radius: 0)
        
        //스택 뷰
        let stackView = UIStackView()
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.width.centerX.top.bottom.equalToSuperview()
        }
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        //포스터 정보 뷰
        self.informationView = MovieDetailInformationView()
        stackView.addArrangedSubview(self.informationView)
        self.informationView.delegate = self
//        self.informationView.border()
        
        stackView.setCustomSpacing(20, after: self.informationView)
        
        //포스터 관련 영화 콘텐츠 뷰
        self.relatedContentsView = MovieDetailRelatedContentsView()
        stackView.addArrangedSubview(self.relatedContentsView)
        self.relatedContentsView.delegate = self
//        self.relatedContentsView.border()
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.model.requestRecommendMovie { (movie) in
            guard let posterPath = movie.posterPath,
                  let posterURL = URL(string: posterPath),
                  let title = movie.title,
                  let releaseDate = movie.releaseDate,
                  let storyLine = movie.overview
            else { return }
            
            //미리보기 영상
            self.previewView.displayContent(posterImageURL: posterURL)
            
            //영화 정보
            self.informationView.displayContent(
                title: title,
                releaseDate: releaseDate,
                storyLine: storyLine,
                cast: "이정재, 이선영, 이주연, 박지성",
                creator: "이정재"
            )
        
        }
        
        self.model.requestPopularMovieList { model in
            let contents = model.results.map { movie -> MovieDetailRelatedContentsView.ContentInfo in
                let url = URL(string: movie.posterPath ?? "")!
                let title = movie.title ?? ""
                return MovieDetailRelatedContentsView.ContentInfo(posterImageURL: url, title: title)
            }
            self.relatedContentsView.displayContents(contents)
        }
        
        
    }
    
}

extension MovieDetailViewController: MovieDetailRelatedContentsViewDelegate {
    
    func contentsViewDidContentTap(contentIndex: Int) {
        print("poster\(contentIndex + 1) Did Tap")
    }
    
}

extension MovieDetailViewController: MovieDetailInformationViewDelegate {
    
    func playButtonDidTap() {
        print(#function)
    }
    
    func storeButtonDidTap() {
        print(#function)
    }
    
    func meaningButtonDidTap() {
        print(#function)
    }
    
    func evaluationButtonDidTap() {
        print(#function)
    }
    
    func shareButtonDidTap() {
        print(#function)
    }
    
}

extension MovieDetailViewController: MovieDetailPreviewViewDelegate {
    
    func posterViewDidTap() {
        print(#function)
    }
    
    func muteButtonDidTap() {
        print(#function)
    }
    
}
