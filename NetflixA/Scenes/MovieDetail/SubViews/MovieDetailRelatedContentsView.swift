//
//  MovieDetailRelatedContentsView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/19.
//

import UIKit
import SnapKit

protocol MovieDetailRelatedContentsViewDelegate {
    func contentsViewDidContentTap(contentIndex: Int)
}

class MovieDetailRelatedContentsView: UIView {
    
    struct ContentInfo {
        var posterImageURL: URL
        var title: String
    }
    
    var delegate: MovieDetailRelatedContentsViewDelegate?
    
    private let titleLabel = UILabel()
    private let firstHStackView = UIStackView()
    private let poster1View = UIImageView()
    private let poster2View = UIImageView()
    private let poster3View = UIImageView()
    private let secondHStackView = UIStackView()
    private let poster4View = UIImageView()
    private let poster5View = UIImageView()
    private let poster6View = UIImageView()
    
    
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
        
        //관련된 영화 레이블
        stackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        self.titleLabel.text = "함께 시청된 콘텐츠"
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        stackView.setCustomSpacing(10, after: self.titleLabel)
        
        
        
        //관련 영화 콘텐츠 스택뷰1
        stackView.addArrangedSubview(self.firstHStackView)
        self.firstHStackView.snp.makeConstraints {
            $0.height.equalTo(210)
        }
        self.firstHStackView.axis = .horizontal
        self.firstHStackView.alignment = .fill
        self.firstHStackView.distribution = .equalSpacing
        
        //관련 영화1
        self.firstHStackView.addArrangedSubview(self.poster1View)
        self.poster1View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster1View.clipsToBounds = true
        self.poster1View.contentMode = .scaleAspectFill
        
        self.firstHStackView.setCustomSpacing(5, after: self.poster1View)
        
        //관련 영화2
        self.firstHStackView.addArrangedSubview(self.poster2View)
        self.poster2View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster2View.clipsToBounds = true
        self.poster2View.contentMode = .scaleAspectFill
        
        self.firstHStackView.setCustomSpacing(5, after: self.poster2View)
        
        //관련 영화3
        self.firstHStackView.addArrangedSubview(self.poster3View)
        self.poster3View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster3View.clipsToBounds = true
        self.poster3View.contentMode = .scaleAspectFill
        
        stackView.setCustomSpacing(5, after: firstHStackView)
    
        
        //관련 영화 콘텐츠 스택뷰2
        stackView.addArrangedSubview(self.secondHStackView)
        self.secondHStackView.snp.makeConstraints {
            $0.height.equalTo(210)
        }
        self.secondHStackView.axis = .horizontal
        self.secondHStackView.alignment = .fill
        self.secondHStackView.distribution = .equalSpacing
        
        //관련 영화4
        self.secondHStackView.addArrangedSubview(self.poster4View)
        self.poster4View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster4View.clipsToBounds = true
        self.poster4View.contentMode = .scaleAspectFill
        
        self.secondHStackView.setCustomSpacing(5, after: self.poster4View)
        
        //관련 영화5
        self.secondHStackView.addArrangedSubview(self.poster5View)
        self.poster5View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster5View.clipsToBounds = true
        self.poster5View.contentMode = .scaleAspectFill
        
        self.secondHStackView.setCustomSpacing(5, after: self.poster5View)
        
        //관련 영화6
        self.secondHStackView.addArrangedSubview(self.poster6View)
        self.poster6View.snp.makeConstraints {
            $0.width.equalTo(130)
        }
        self.poster6View.clipsToBounds = true
        self.poster6View.contentMode = .scaleAspectFill
        
        //관련영화1 버튼함수
        self.poster1View.isUserInteractionEnabled = true
        let tap0 = UITapGestureRecognizer()
        self.poster1View.addGestureRecognizer(tap0)
        tap0.addTarget(self, action: #selector(self.poster1ViewDidTap))
        
        //관련영화2 버튼함수
        self.poster2View.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer()
        self.poster2View.addGestureRecognizer(tap1)
        tap1.addTarget(self, action: #selector(self.poster2ViewDidTap))
        
        //관련영화3 버튼함수
        self.poster3View.isUserInteractionEnabled = true
        let tap2 = UITapGestureRecognizer()
        self.poster3View.addGestureRecognizer(tap2)
        tap2.addTarget(self, action: #selector(self.poster3ViewDidTap))
        
        //관련영화4 버튼함수
        self.poster4View.isUserInteractionEnabled = true
        let tap3 = UITapGestureRecognizer()
        self.poster4View.addGestureRecognizer(tap3)
        tap3.addTarget(self, action: #selector(self.poster4ViewDidTap))
        
        //관련영화5 버튼함수
        self.poster5View.isUserInteractionEnabled = true
        let tap4 = UITapGestureRecognizer()
        self.poster5View.addGestureRecognizer(tap4)
        tap4.addTarget(self, action: #selector(self.poster5ViewDidTap))
        
        //관련영화6 버튼함수
        self.poster6View.isUserInteractionEnabled = true
        let tap5 = UITapGestureRecognizer()
        self.poster6View.addGestureRecognizer(tap5)
        tap5.addTarget(self, action: #selector(self.poster6ViewDidTap))
        
    }
    
    @objc private func poster1ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 0)
    }
    @objc private func poster2ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 1)
    }
    @objc private func poster3ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 2)
    }
    @objc private func poster4ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 3)
    }
    @objc private func poster5ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 4)
    }
    @objc private func poster6ViewDidTap() {
        print("Delegate success")
        self.delegate?.contentsViewDidContentTap(contentIndex: 5)
    }
    
    
    func displayContents(_ contents: [ContentInfo]) {
        guard contents.count >= 6 else {
            return
        }
        self.poster1View.sd_setImage(with: contents[0].posterImageURL, completed: nil)
        self.poster2View.sd_setImage(with: contents[1].posterImageURL, completed: nil)
        self.poster3View.sd_setImage(with: contents[2].posterImageURL, completed: nil)
        self.poster4View.sd_setImage(with: contents[3].posterImageURL, completed: nil)
        self.poster5View.sd_setImage(with: contents[4].posterImageURL, completed: nil)
        self.poster6View.sd_setImage(with: contents[5].posterImageURL, completed: nil)
    }

}
