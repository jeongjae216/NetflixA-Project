//
//  HomeUpsideView.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/27.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage


protocol HomeUpsideViewDelegate: SceneTitleBarDelegate {
    func seriesButtonDidTap()
    func movieButtonDidTap()
    func categoriesButtonDidTap()
}

class HomeUpsideView: UIStackView {
    
    var delegate: HomeUpsideViewDelegate? {
        didSet {
            self.sceneTitleBar.delegate = self.delegate
        }
    }
    
    private let topSafeAreaDimlayer = CALayer()
    private let dimlayer = CAGradientLayer()
    private let sceneTitleBar = SceneTitleBar()
    
    private let homeupsideCategoriesStackView = UIStackView()
    private let seriesButton = UIButton()
    private let movieButton = UIButton()
    private let categoriesButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.layer.addSublayer(self.topSafeAreaDimlayer)
        self.topSafeAreaDimlayer.backgroundColor = UIColor.black.withAlphaComponent(0.7).cgColor
        
        self.layer.addSublayer(self.dimlayer)
        self.dimlayer.colors = [
            UIColor.black.withAlphaComponent(0.7).cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor
        ]
        
        
        //상단바 버튼 스택 뷰
        self.addArrangedSubview(self.sceneTitleBar)
        self.sceneTitleBar.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.sceneTitleBar.titleButton.setTitle("N", for: .normal)
        self.sceneTitleBar.titleButton.setTitleColor(.red, for: .normal)
        self.sceneTitleBar.titleButton.titleLabel?.font = .systemFont(ofSize: 25)
        
        
        //상단바 카테고리 스택 뷰
        self.addArrangedSubview(self.homeupsideCategoriesStackView)
        self.homeupsideCategoriesStackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.homeupsideCategoriesStackView.isLayoutMarginsRelativeArrangement = true
        self.homeupsideCategoriesStackView.layoutMargins.left = 20
        self.homeupsideCategoriesStackView.layoutMargins.right = 20
        self.homeupsideCategoriesStackView.axis = .horizontal
        self.homeupsideCategoriesStackView.alignment = .fill
        self.homeupsideCategoriesStackView.distribution = .fillEqually
        
        
        //시리즈 버튼
        self.homeupsideCategoriesStackView.addArrangedSubview(self.seriesButton)
        self.seriesButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.seriesButton.setTitle("시리즈", for: .normal)
        self.seriesButton.setTitleColor(.white, for: .normal)
        self.seriesButton.titleLabel?.font = .systemFont(ofSize: 18)
        self.seriesButton.contentHorizontalAlignment = .center
        self.seriesButton.addTarget(self, action: #selector(self.seriesButtonDidTap), for: .touchUpInside)
        self.homeupsideCategoriesStackView.setCustomSpacing(15, after: seriesButton)
        
        //영화 버튼
        self.homeupsideCategoriesStackView.addArrangedSubview(self.movieButton)
        self.movieButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.movieButton.setTitle("영화", for: .normal)
        self.movieButton.setTitleColor(.white, for: .normal)
        self.movieButton.titleLabel?.font = .systemFont(ofSize: 18)
        self.movieButton.contentHorizontalAlignment = .center
        self.movieButton.addTarget(self, action: #selector(self.movieButtonDidTap), for: .touchUpInside)
        
        
        self.homeupsideCategoriesStackView.setCustomSpacing(15, after: movieButton)
        
        
        //카테고리 버튼
        self.homeupsideCategoriesStackView.addArrangedSubview(self.categoriesButton)
        self.categoriesButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.categoriesButton.setTitle("카테고리", for: .normal)
        self.categoriesButton.setTitleColor(.white, for: .normal)
        self.categoriesButton.titleLabel?.font = .systemFont(ofSize: 18)
        self.categoriesButton.contentHorizontalAlignment = .center
        self.categoriesButton.addTarget(self, action: #selector(self.categoriesButtonDidTap), for: .touchUpInside)
        
    }
    
    @objc private func seriesButtonDidTap() {
        print("seriesButtonDidTap")
        self.delegate?.seriesButtonDidTap()
    }
    @objc private func movieButtonDidTap() {
        print("movieButtonDidTap")
        self.delegate?.movieButtonDidTap()
    }
    @objc private func categoriesButtonDidTap() {
        print("categoriesButtonDidTap")
        self.delegate?.categoriesButtonDidTap()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.topSafeAreaDimlayer.frame.origin.x = 0
        self.topSafeAreaDimlayer.frame.origin.y = 0
        self.topSafeAreaDimlayer.frame.size.width = self.bounds.size.width
        self.topSafeAreaDimlayer.frame.size.height = self.safeAreaInsets.top
        self.dimlayer.frame.origin.x = 0
        self.dimlayer.frame.origin.y = self.safeAreaInsets.top
        self.dimlayer.frame.size.width = self.bounds.size.width
        self.dimlayer.frame.size.height = 100
    }
    
}




