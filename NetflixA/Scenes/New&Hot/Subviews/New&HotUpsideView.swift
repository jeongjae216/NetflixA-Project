//
//  New&HotUpsideView.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/27.
//


//콜렉셤 뷰


import Foundation
import UIKit
import SnapKit
import SDWebImage


protocol NewAndHotUpsideViewDelegate: SceneTitleBarDelegate {
    func willReleaseButtonDidTap()
    func attentionContentsButtonDidTap()
    func topTenButtonDidTap()
}
class NewAndHotUpsideView: UIStackView {
    
    var delegate: NewAndHotUpsideViewDelegate? {
        didSet {
            self.sceneTitleBar.delegate = self.delegate
        }
    }
    
    private let sceneTitleBar = SceneTitleBar()
    
    private let categoriesStackView = UIStackView()
    private let willReleaseButton = UIButton()
    private let attentionContentsButton = UIButton()
    private let topTenButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        //상단바 버튼 스택 뷰
        self.addArrangedSubview(self.sceneTitleBar)
        self.sceneTitleBar.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.sceneTitleBar.titleButton.setTitle("New & Hot", for: .normal)
        self.sceneTitleBar.titleButton.setTitleColor(.white, for: .normal)
        self.sceneTitleBar.titleButton.titleLabel?.font = .systemFont(ofSize: 25)
        
        
        //상단바 카테고리 스택 뷰
        self.addArrangedSubview(self.categoriesStackView)
        self.categoriesStackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.categoriesStackView.axis = .horizontal
        self.categoriesStackView.alignment = .fill
        self.categoriesStackView.distribution = .fill
        
        
        //공개 예정 버튼
        self.categoriesStackView.addArrangedSubview(self.willReleaseButton)
        self.willReleaseButton.snp.makeConstraints {
            $0.width.equalTo(105)
        }
        self.willReleaseButton.setTitle("🍿 공개 예정", for: .normal)
        self.willReleaseButton.setTitleColor(.black, for: .normal)
        self.willReleaseButton.backgroundColor = .white
        self.willReleaseButton.border(width: 0, color: .black, radius: 12)
        self.willReleaseButton.addTarget(self, action: #selector(self.willReleaseButtonDidTap), for: .touchUpInside)
        
        //모두가 주목하는 콘텐츠 버튼
        self.categoriesStackView.addArrangedSubview(self.attentionContentsButton)
        self.attentionContentsButton.snp.makeConstraints {
            $0.width.equalTo(120)
        }
        self.attentionContentsButton.setTitle("🔥 모두가 주목하는 콘텐츠", for: .normal)
        self.attentionContentsButton.setTitleColor(.white, for: .normal)
        self.attentionContentsButton.titleLabel?.font = .systemFont(ofSize: 18)
        self.attentionContentsButton.contentHorizontalAlignment = .center
        self.attentionContentsButton.addTarget(self, action: #selector(self.attentionContentsButtonDidTap), for: .touchUpInside)

        //톱10 버튼
        self.categoriesStackView.addArrangedSubview(self.topTenButton)
        self.topTenButton.snp.makeConstraints {
            $0.width.equalTo(105)
        }
        self.topTenButton.setTitle("🏆 톱 10", for: .normal)
        self.topTenButton.setTitleColor(.white, for: .normal)
        self.topTenButton.titleLabel?.font = .systemFont(ofSize: 18)
        self.topTenButton.contentHorizontalAlignment = .center
        self.topTenButton.addTarget(self, action: #selector(self.topTenButtonDidTap), for: .touchUpInside)
        
    }
    
    
    @objc private func willReleaseButtonDidTap() {
        print("willReleaseButtonDidTap")
        self.delegate?.willReleaseButtonDidTap()
    }
    @objc private func attentionContentsButtonDidTap() {
        print("attentionContentsButtonDidTap")
        self.delegate?.attentionContentsButtonDidTap()
    }
    @objc private func topTenButtonDidTap() {
        print("topTenButtonDidTap")
        self.delegate?.topTenButtonDidTap()
    }
    
}


