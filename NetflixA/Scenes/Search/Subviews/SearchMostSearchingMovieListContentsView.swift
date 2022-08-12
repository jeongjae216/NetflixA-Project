//
//  SearchMostSearchingMovieListContentsView.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/03.
//

import UIKit
import SnapKit
import SDWebImage

final class SearchMostSearchingMovieListContentsView: UITableViewCell {
    
    private let contentsStackView = UIStackView()
    private let posterView = UIImageView()
    private let titleLabel = UILabel()
    private let playButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.contentView.addSubview(self.contentsStackView)
        self.contentsStackView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(5)
            $0.height.equalTo(80)
        }
        self.contentsStackView.axis = .horizontal
        self.contentsStackView.alignment = .center
        self.contentsStackView.distribution = .fill
        
        //포스터 뷰
        self.contentsStackView.addArrangedSubview(self.posterView)
        self.posterView.snp.makeConstraints {
            $0.width.equalTo(140)
        }
        self.posterView.clipsToBounds = true
        self.posterView.contentMode = .scaleAspectFill
        
        self.contentsStackView.setCustomSpacing(10, after: self.posterView)
        
        //영화 제목
        self.contentsStackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        self.titleLabel.textAlignment = .left
        
        //재생버튼
        self.contentsStackView.addArrangedSubview(self.playButton)
        self.playButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
        self.playButton.setTitle("▶︎", for: .normal)
        self.playButton.setTitleColor(.white, for: .normal)
        self.playButton.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        self.playButton.border(width: 1, color: .white, radius: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterView.sd_cancelCurrentImageLoad()
    }
    
    func displayContents(posterImageURL: URL, title: String) {
        self.posterView.sd_setImage(with: posterImageURL, completed: nil)
        self.titleLabel.text = title
    }
}
