//
//  MovieDetailPreviewView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/19.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

protocol MovieDetailPreviewViewDelegate {
    func posterViewDidTap()
    func muteButtonDidTap()
}

class MovieDetailPreviewView: UIView {
    
    var delegate: MovieDetailPreviewViewDelegate?
    
    private let posterView = UIImageView()
    private let previewLabel = UILabel()
    private let muteButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configure() {
        
        //포스터 뷰
        self.addSubview(self.posterView)
        self.posterView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.posterView.clipsToBounds = true
        self.posterView.contentMode = .scaleAspectFill
        
        self.posterView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        self.posterView.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(self.posterViewDidTap))
        
        //미리보기 레이블
        self.addSubview(self.previewLabel)
        self.previewLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        self.previewLabel.font = .systemFont(ofSize: 16, weight: .regular)
        self.previewLabel.textColor = .white
        self.previewLabel.text = "미리보기 없음"
        self.previewLabel.border()
        
        //음소거 버튼
        self.addSubview(self.muteButton)
        self.muteButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.height.equalTo(20)
        }
        self.muteButton.setTitle("🎵", for: .normal)
        self.muteButton.setTitleColor(.white, for: .normal)
        self.muteButton.addTarget(self, action: #selector(self.muteButtonDidTap), for: .touchUpInside)
        self.previewLabel.border()
        
        
        
    }
   
    @objc private func posterViewDidTap() {
        print("Delegate Success")
        self.delegate?.posterViewDidTap()
    }
    @objc private func muteButtonDidTap() {
        print("Delegate Success")
        self.delegate?.muteButtonDidTap()
    }
   
    func displayContent(posterImageURL: URL) {
        self.posterView.sd_setImage(with: posterImageURL, completed: nil)
    }
    
    
}
