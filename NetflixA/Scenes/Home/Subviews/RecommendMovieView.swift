//
//  RecommendMovieView.swift
//  NetflixA
//
//  Created by 정재 on 2022/02/22.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

protocol RecommendMovieViewDelegate {
    func recommendMovieDetailButtonDidTap()
    func recommendMovieMeaningButtonDidTap()
    func recommendMoviePlayButtonDidTap()
    func recommendMovieInformationButtonDidTap()
}
struct RecommendMovieViewModel {
    var posterURL: URL
    var title: String
    var tags: [String]
}
class RecommendMovieView: UIView {
    
//    var mainViewController: HomeViewController? = nil
    
    var cellDidTap: ((Int) -> Void)?
    var delegate: RecommendMovieViewDelegate?
    
    private let posterView = UIImageView()
    private let posterDimLayer = CAGradientLayer()
    private let movieDetailButton = UIButton()
    
    private let contentsStackView = UIStackView()
    let titleLabel = UILabel()
    private let tagsLabel = UILabel()
    
    private let buttonStackView = UIStackView()
    private let meaningButton = UIButton()
    private let playButton = UIButton()
    private let informationButton = UIButton()
    
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure() {
        
        //포스터
        self.addSubview(self.posterView)
        self.posterView.snp.makeConstraints {
            $0.width.height.centerX.centerY.equalToSuperview()
        }
        self.posterView.clipsToBounds = true
        self.posterView.contentMode = .scaleAspectFill

        //포스터 그라데이션
        self.layer.addSublayer(self.posterDimLayer)
        self.posterDimLayer.colors = [
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor.black.withAlphaComponent(0.9).cgColor,
            UIColor.black.withAlphaComponent(1).cgColor
        ]
        
        
        //컨텐츠 스택 뷰
        self.addSubview(self.contentsStackView)
        self.contentsStackView.snp.makeConstraints {
            $0.width.centerX.bottom.equalToSuperview()
        }
        self.contentsStackView.isLayoutMarginsRelativeArrangement = true
        self.contentsStackView.layoutMargins.left = 30
        self.contentsStackView.layoutMargins.right = 30
        self.contentsStackView.layoutMargins.bottom = 20
        self.contentsStackView.axis = .vertical
        self.contentsStackView.alignment = .fill
        self.contentsStackView.distribution = .fill
        
        //제목
        self.contentsStackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        self.titleLabel.textAlignment = .center

        //태그리스트
        self.contentsStackView.addArrangedSubview(self.tagsLabel)
        self.tagsLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        self.tagsLabel.numberOfLines = 3
        self.tagsLabel.textColor = .white
        self.tagsLabel.font = .systemFont(ofSize: 18, weight: .medium)
        self.tagsLabel.textAlignment = .center
        
        
        self.contentsStackView.setCustomSpacing(10, after: tagsLabel)
        
        
        //버튼 스택 뷰
        self.contentsStackView.addArrangedSubview(self.buttonStackView)
        self.buttonStackView.snp.makeConstraints {
            $0.height.equalTo(37)
        }
        self.buttonStackView.isLayoutMarginsRelativeArrangement = true
        self.buttonStackView.axis = .horizontal
        self.buttonStackView.alignment = .fill
        self.buttonStackView.distribution = .fillEqually
        
        //찜버튼
        self.buttonStackView.addArrangedSubview(self.meaningButton)
        self.meaningButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.meaningButton.setTitle("찜하기", for: .normal)
        self.meaningButton.setTitleColor(.white, for: .normal)
        self.meaningButton.backgroundColor = .black
        self.meaningButton.border(width: 1, color: .white, radius: 5)
        self.meaningButton.addTarget(self, action: #selector(self.meaningButtonDidTap), for: .touchUpInside)
        
        
        self.buttonStackView.setCustomSpacing(30, after: meaningButton)
        
        
        //재생버튼
        self.buttonStackView.addArrangedSubview(self.playButton)
        self.playButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.playButton.setTitle("재생하기", for: .normal)
        self.playButton.setTitleColor(.black, for: .normal)
        self.playButton.backgroundColor = .white
        self.playButton.border(width: 0, color: .black, radius: 5)
        self.playButton.addTarget(self, action: #selector(self.playButtonDidTap), for: .touchUpInside)
        
        
        self.buttonStackView.setCustomSpacing(30, after: playButton)
        
        
        //정보버튼
        self.buttonStackView.addArrangedSubview(self.informationButton)
        self.informationButton.snp.makeConstraints {
            $0.width.equalTo(75)
        }
        self.informationButton.setTitle("영화정보", for: .normal)
        self.informationButton.setTitleColor(.white, for: .normal)
        self.informationButton.backgroundColor = .black
        self.informationButton.border(width: 1, color: .white, radius: 5)
        self.informationButton.addTarget(self, action: #selector(self.informationButtonDidTap), for: .touchUpInside)
        
        
        //영화 상세 정보
        self.addSubview(self.movieDetailButton)
        self.movieDetailButton.snp.makeConstraints {
            $0.width.centerX.top.equalToSuperview()
            $0.bottom.equalTo(self.buttonStackView.snp.top)
        }
        self.movieDetailButton.addTarget(self, action: #selector(self.movieDetailButtonDidTap), for: .touchUpInside)
        
        
        
    }
    
    override func layoutSubviews() {
        self.posterDimLayer.frame = self.posterView.frame
    }
    
    func displayContents(model: RecommendMovieViewModel) {
        self.posterView.sd_setImage(with: model.posterURL, completed: nil)
        self.titleLabel.text = model.title
        self.tagsLabel.text = model.tags.joined(separator: "*")
    }
    
    
    
    @objc private func movieDetailButtonDidTap() {
        self.delegate?.recommendMovieDetailButtonDidTap()
    }
    @objc private func meaningButtonDidTap() {
        self.delegate?.recommendMovieMeaningButtonDidTap()
    }
    @objc private func playButtonDidTap() {
        self.delegate?.recommendMoviePlayButtonDidTap()
    }
    @objc private func informationButtonDidTap() {
        self.delegate?.recommendMovieInformationButtonDidTap()
    }
    
}
