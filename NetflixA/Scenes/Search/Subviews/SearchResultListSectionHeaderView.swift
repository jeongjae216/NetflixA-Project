//
//  SearchResultListSectionHeaderView.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/10.
//

import UIKit
import SnapKit


final class SearchResultListSectionHeaderView: UICollectionReusableView {
    
    private let titleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = .black
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.bottom.equalToSuperview()
        }
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
    
    func display(title: String) {
        self.titleLabel.text = title
    }
    
}
