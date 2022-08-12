//
//  StoredContentsListUpsideView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/04.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage


class StoredContentsListUpsideView: UIStackView {
    
    private let sceneTitleBar = SceneTitleBar()
    private let smartStoreButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.storedContentsListUpsideViewConfigure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func storedContentsListUpsideViewConfigure() {
        
        //상단바 버튼 스택 뷰
        self.addArrangedSubview(self.sceneTitleBar)
        self.sceneTitleBar.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.sceneTitleBar.titleButton.setTitle("저장한 콘텐츠 목록", for: .normal)
        self.sceneTitleBar.titleButton.setTitleColor(.white, for: .normal)
        self.sceneTitleBar.titleButton.titleLabel?.font = .systemFont(ofSize: 25)
        
        
        //스마트 저장 버튼
        self.addArrangedSubview(self.smartStoreButton)
        self.smartStoreButton.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.smartStoreButton.contentHorizontalAlignment = .left
        self.smartStoreButton.setTitle("⚙️ 스마트 저장", for: .normal)
        self.smartStoreButton.setTitleColor(.white, for: .normal)
        self.smartStoreButton.titleLabel?.font = .systemFont(ofSize: 15)
    }

}

