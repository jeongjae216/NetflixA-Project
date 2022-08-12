//
//  New&HotViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/22.
//

import Foundation
import UIKit
import SnapKit
import Alamofire



class NewAndHotViewController: UIViewController {
    
    private let model = HomeModel()
    private lazy var newAndHotView = NewAndHotView()
    private lazy var newAndHotBasicCell = NewAndHotBasicCell()
    
    
    override func loadView() {
        self.view = self.newAndHotView
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //
        self.model.requestRecommendMovie { (movie) in
            guard let title = movie.title,
                  let storyLine = movie.overview
            else {return}
            
            self.newAndHotView.displayContents(
                title: title,
                storyLine: storyLine
            )
        }
        
        //
        self.model.requestRecommendMovie { (movie) in
            guard let title = movie.title,
                  let posterPath = movie.posterPath,
                  let posterURL = URL(string: posterPath)
            else {return}
            
            self.newAndHotBasicCell.displayContents(model: NewAndHotBasicCellModel(
                posterUrl: posterURL,
                titleText: title
            ))
        }
        
    }
    
}



extension NewAndHotViewController: NewAndHotUpsideViewDelegate {
    
    func titleButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func mirroringButtonDidTap() {
        print(type(of: self), #function)
    }
    
    func accountButtonDidTap() {
        print(type(of: self), #function)
    }
    
    
    func willReleaseButtonDidTap() {
        print(#function)
    }
    
    func attentionContentsButtonDidTap() {
        print(#function)
    }
    
    func topTenButtonDidTap() {
        print(#function)
    }
    
}

fileprivate extension TMDBNowPlayingModel.Movie {
    
    func convert() -> NewAndHotBasicCellModel {
        return .init(
            posterUrl: URL(string: self.posterPath ?? "")!,
            titleText: self.title ?? "")
    }
    
}
