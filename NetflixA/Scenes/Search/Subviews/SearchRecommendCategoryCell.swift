//
//  SearchRecommendCategoryCell.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/10.
//

import UIKit
import SnapKit

final class SearchRecommendCategoryCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }
        self.titleLabel.textColor = .lightGray
        self.titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    func display(title: String) {
        self.titleLabel.text = title
    }
    
}
