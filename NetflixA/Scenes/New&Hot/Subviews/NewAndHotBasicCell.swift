//
//  New&NewAndHotBasicCell.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/14.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

struct NewAndHotBasicCellModel {
    var posterUrl: URL
    var titleText: String
}

class NewAndHotBasicCell: UICollectionViewCell {
    
    let posterView = UIImageView()
    let posterTitleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        //포스터 리스트 베이직 셀
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        
        //셀 영화 포스터
        self.addSubview(self.posterView)
        self.posterView.snp.makeConstraints {
            $0.centerX.centerY.width.height.equalToSuperview()
        }
        self.posterView.contentMode = .scaleAspectFill
        self.posterView.border(width: 2, color: .yellow, radius: 0)
        
        
        //셀 영화 제목
        self.addSubview(self.posterTitleLabel)
        self.posterTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.bottom.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
        self.posterTitleLabel.numberOfLines = 2
        self.posterTitleLabel.textColor = .white
        self.posterTitleLabel.textAlignment = .center
        self.posterTitleLabel.adjustsFontSizeToFitWidth = true
        self.posterTitleLabel.font = .systemFont(ofSize: 40, weight: .heavy)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterView.sd_cancelCurrentImageLoad()
        self.posterView.image = nil
        self.posterTitleLabel.text = nil
    }
        
    func displayContents(model: NewAndHotBasicCellModel) {
        self.posterView.sd_setImage(with: model.posterUrl, completed: nil)
        self.posterTitleLabel.text = model.titleText
    }
    
}
    

