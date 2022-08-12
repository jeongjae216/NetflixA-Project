//
//  MovieDetailInformationView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/19.
//

import UIKit
import SnapKit


protocol MovieDetailInformationViewDelegate {
    func playButtonDidTap()
    func storeButtonDidTap()
    func meaningButtonDidTap()
    func evaluationButtonDidTap()
    func shareButtonDidTap()
}


class MovieDetailInformationView: UIView {
    
    var delegate: MovieDetailInformationViewDelegate?
    
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let playButton = UIButton()
    private let storeButton = UIButton()
    private let storyLineLabel = UILabel()
    private let castLabel = UILabel()
    private let creatorLabel = UILabel()
    private let buttonStackView = UIStackView()
    private let meaningContentsButton = UIButton()
    private let evaluationButton = UIButton()
    private let shareButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configure() {
        
        //스택 뷰
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.width.centerX.top.bottom.equalToSuperview()
        }
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins.left = 5
        stackView.layoutMargins.right = 5
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
//        stackView.border(width: 10, color: .blue, radius: 0)
        
        //포스터 제목
        stackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 20, weight: .medium)
//        self.titleLabel.border(width: 5, color : .red, radius: 0)
        
        //개봉일
        stackView.addArrangedSubview(self.releaseDateLabel)
        self.releaseDateLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        self.releaseDateLabel.textColor = .white
        self.releaseDateLabel.font = .systemFont(ofSize: 15, weight: .light)
        
//        self.releaseDateLabel.border(width: 5, color: .red, radius: 0)
        
        stackView.setCustomSpacing(10, after: self.releaseDateLabel)
        
        //재생 버튼
        stackView.addArrangedSubview(self.playButton)
        self.playButton.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        self.playButton.setTitle("▶︎ 재생", for: .normal)
        self.playButton.setTitleColor(.black, for: .normal)
        self.playButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        self.playButton.backgroundColor = .white
        self.playButton.addTarget(self, action: #selector(self.playButtonDidTap), for: .touchUpInside)
        self.playButton.border(width: 1, color: .black, radius: 5)
        
        stackView.setCustomSpacing(5, after: self.playButton)
        
        //저장 버튼
        stackView.addArrangedSubview(self.storeButton)
        self.storeButton.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        self.storeButton.setTitle("⍖ 저장", for: .normal)
        self.storeButton.setTitleColor(.white, for: .normal)
        self.storeButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        self.storeButton.backgroundColor = .gray
        self.storeButton.addTarget(self, action: #selector(self.storeButtonDidTap), for: .touchUpInside)
        self.storeButton.border(width: 1, color: .gray, radius: 5)
        
        stackView.setCustomSpacing(10, after: self.storeButton)
        
        //줄거리
        stackView.addArrangedSubview(self.storyLineLabel)
        self.storyLineLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(20)
        }
        self.storyLineLabel.lineBreakMode = .byTruncatingTail
        self.storyLineLabel.numberOfLines = 3
        self.storyLineLabel.textColor = .white
        self.storyLineLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        stackView.setCustomSpacing(10, after: self.storyLineLabel)
        
        //출연진
        stackView.addArrangedSubview(self.castLabel)
        self.castLabel.numberOfLines = 1
        self.castLabel.textColor = .lightGray
        self.castLabel.font = .systemFont(ofSize: 13, weight: .light)
        
        //크리에이터
        stackView.addArrangedSubview(self.creatorLabel)
        self.creatorLabel.numberOfLines = 1
        self.creatorLabel.textColor = .lightGray
        self.creatorLabel.font = .systemFont(ofSize: 13, weight: .light)
        
        stackView.setCustomSpacing(10, after: self.creatorLabel)
        
        //버튼 스택 뷰
        stackView.addArrangedSubview(self.buttonStackView)
        self.buttonStackView.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        self.buttonStackView.isLayoutMarginsRelativeArrangement = true
        self.buttonStackView.layoutMargins.right = 100
        self.buttonStackView.axis = .horizontal
        self.buttonStackView.alignment = .fill
        self.buttonStackView.distribution = .fillEqually
        self.buttonStackView.spacing = 15
//        self.border(width: 5, color: .white, radius: 0)
        
        //찜하기 버튼
        self.buttonStackView.addArrangedSubview(self.meaningContentsButton)
        self.meaningContentsButton.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        self.meaningContentsButton.setTitle("찜 하기", for: .normal)
        self.meaningContentsButton.setTitleColor(.white, for: .normal)
        self.meaningContentsButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        self.meaningContentsButton.backgroundColor = .clear
        self.meaningContentsButton.addTarget(self, action: #selector(self.meaningButtonDidTap), for: .touchUpInside)
        self.meaningContentsButton.border(width: 1, color: .white, radius: 8)
        
        self.buttonStackView.setCustomSpacing(30, after: self.meaningContentsButton)
        
        //평가 버튼
        self.buttonStackView.addArrangedSubview(self.evaluationButton)
        self.evaluationButton.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        self.evaluationButton.setTitle("평가", for: .normal)
        self.evaluationButton.setTitleColor(.white, for: .normal)
        self.evaluationButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        self.evaluationButton.backgroundColor = .clear
        self.evaluationButton.addTarget(self, action: #selector(self.evaluationButtonDidTap), for: .touchUpInside)
        self.evaluationButton.border(width: 1, color: .white, radius: 8)
        
        self.buttonStackView.setCustomSpacing(30, after: self.evaluationButton)
        
        //공유 버튼
        self.buttonStackView.addArrangedSubview(self.shareButton)
        self.shareButton.snp.makeConstraints {
            $0.width.equalTo(80)
        }
        self.shareButton.setTitle("공유", for: .normal)
        self.shareButton.setTitleColor(.white, for: .normal)
        self.shareButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        self.shareButton.backgroundColor = .clear
        self.shareButton.addTarget(self, action: #selector(self.shareButtonDidTap), for: .touchUpInside)
        self.shareButton.border(width: 1, color: .white, radius: 8)
        
    }
    
    @objc private func playButtonDidTap() {
        print("Delegate Success")
        self.delegate?.playButtonDidTap()
    }
    @objc private func storeButtonDidTap() {
        print("Delegate Success")
        self.delegate?.storeButtonDidTap()
    }
    
    @objc private func meaningButtonDidTap() {
        print("Delegate Success")
        self.delegate?.meaningButtonDidTap()
    }
    @objc private func evaluationButtonDidTap() {
        print("Delegate Success")
        self.delegate?.evaluationButtonDidTap()
    }
    @objc private func shareButtonDidTap() {
        print("Delegate Success")
        self.delegate?.shareButtonDidTap()
    }
    
    
    func displayContent(
        title: String,
        releaseDate: String,
        storyLine: String,
        cast: String,
        creator: String
    ) {
        self.titleLabel.text = title
        self.releaseDateLabel.text = releaseDate
        self.storyLineLabel.text = storyLine
        self.castLabel.text = "출연: \(cast)"
        self.creatorLabel.text = "크리에이터: \(creator)"
    }
    
}
