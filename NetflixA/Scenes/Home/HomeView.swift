//
//  HomeView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/18.
//

import UIKit
import SnapKit

final class HomeView: UIView {
    
    private let scrollView: UIScrollView = .init()
    private let stackView: UIStackView = .init()
    
    let recommendMovieView: RecommendMovieView = .init()
    let homeupsideView: HomeUpsideView = .init()
    
    let nowPlayingMovieListView: HorizontalContentsPosterListView = .init()
    let animationMovieListView: HorizontalContentsPosterListView = .init()
    let popularMovieListView: HorizontalContentsPosterListView = .init()
    let newMovieListView: HorizontalContentsPosterListView = .init()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .black
        
        //스크롤 영역
        self.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints {
            $0.width.height.centerX.centerY.equalToSuperview()
        }
        self.scrollView.delegate = self
        self.scrollView.contentInset.top = 0 - UIApplication.shared.keyWindow!.safeAreaInsets.top
        
        //스택
        self.scrollView.addSubview(self.stackView)
        self.stackView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.bottom.top.equalToSuperview()
        }
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        self.stackView.spacing = 20
        
        
        //상단바 뷰
        self.addSubview(self.homeupsideView)
        self.homeupsideView.snp.makeConstraints {
            $0.width.centerX.top.equalToSuperview()
        }
        self.homeupsideView.backgroundColor = .clear
        self.homeupsideView.isLayoutMarginsRelativeArrangement = true
        self.homeupsideView.layoutMargins.left = 20
        self.homeupsideView.layoutMargins.right = 20
        self.homeupsideView.axis = .vertical
        self.homeupsideView.alignment = .fill
        self.homeupsideView.distribution = .fill
        
        
        //추천영화
        self.stackView.addArrangedSubview(self.recommendMovieView)
        self.recommendMovieView.snp.makeConstraints {
            $0.height.equalTo(self.stackView.snp.width).multipliedBy(1.3)
        }
        
        
        //상영 중인 영화 리스트 뷰
        self.stackView.addArrangedSubview(self.nowPlayingMovieListView)
//            $0.delegate = self
        
        
        
        //애니메이션 영화 리스트 뷰
        self.stackView.addArrangedSubview(self.animationMovieListView)
//            $0.delegate = self
        
        
        //인기 영화 리스트 뷰
        self.stackView.addArrangedSubview(self.popularMovieListView)
//            $0.delegate = sel
        
        
        //신작 영화 리스트 뷰
        self.stackView.addArrangedSubview(self.newMovieListView)
        
    }
    
    
    
    private var prevScrollViewContentOffsetY: CGFloat = 0
    private var homeupsideViewMinY: CGFloat {
        return self.homeupsideView.frame.size.height * -1
    }
    private var homeupsideViewMaxY: CGFloat { 0.0 }
     
    private func positionHomeupsideView(by scrollContentOffset: CGPoint) {
        let view = self.homeupsideView
        
        let value = (scrollContentOffset.y - self.prevScrollViewContentOffsetY)
        self.prevScrollViewContentOffsetY = scrollContentOffset.y
        
        var newY: CGFloat = view.frame.origin.y + (value * -1)
        
        let minY: CGFloat = self.homeupsideViewMinY
        let maxY: CGFloat = self.homeupsideViewMaxY
        
        newY = max(minY, newY)
        newY = min(maxY, newY)
        
        view.frame.origin.y = newY
    }
    
    private func shouldOpenHomeupsideView() -> Bool {
        let minY: CGFloat = self.homeupsideViewMinY
        let maxY: CGFloat = self.homeupsideViewMaxY
        let y: CGFloat = self.homeupsideView.frame.origin.y
        if y > (minY + maxY) / 2 {
            return true
        } else {
            return false
        }
    }
    
    
    private var isUpsideViewOpened: Bool = true
    
    private func openHomeupsideView(animated: Bool) {
        self.isUpsideViewOpened = true
        guard animated else {
            self.homeupsideView.frame.origin.y = 0
            return
        }
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.homeupsideView.frame.origin.y = 0
            },
            completion: { (bool) in
                print(bool)
            })
    }
    private func closeHomeupsideView(animated: Bool) {
        self.isUpsideViewOpened = false
        guard animated else {
            self.homeupsideView.frame.origin.y = self.homeupsideView.frame.size.height * -1
            return
        }
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.homeupsideView.frame.origin.y = self.homeupsideView.frame.size.height * -1
            },
            completion: { (bool) in
                print(bool)
            })
    }
    
    
    
}




extension HomeView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if 0 <= scrollView.contentOffset.y {
            self.positionHomeupsideView(by: scrollView.contentOffset)
        } else {
            if self.isUpsideViewOpened == false {
                self.openHomeupsideView(animated: true)
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }
        if self.shouldOpenHomeupsideView() {
            self.openHomeupsideView(animated: true)
        } else {
            self.closeHomeupsideView(animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.shouldOpenHomeupsideView() {
            self.openHomeupsideView(animated: true)
        } else {
            self.closeHomeupsideView(animated: true)
        }
    }
    
}



