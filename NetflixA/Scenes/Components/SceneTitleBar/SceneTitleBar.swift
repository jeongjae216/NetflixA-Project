//
//  SceneTitleBar.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/28.
//

import Foundation
import UIKit
import SnapKit

protocol SceneTitleBarDelegate {
    func titleButtonDidTap()
    func mirroringButtonDidTap()
    func accountButtonDidTap()
}

final class SceneTitleBar: UIStackView {
    
    var delegate: SceneTitleBarDelegate?
    
    let titleButton = UIButton()
    let mirroringButton = UIButton()
    let accountButton = UIButton()
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        //Scene Title Bar
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
        
        //제목 버튼
        self.addArrangedSubview(self.titleButton)
        self.titleButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        self.titleButton.contentHorizontalAlignment = .left
        self.titleButton.addTarget(self, action: #selector(self.titleButtonDidTap), for: .touchUpInside)
        
        //미러링 버튼
        self.addArrangedSubview(self.mirroringButton)
        self.mirroringButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.1)
        }
        self.mirroringButton.setTitle("📺", for: .normal)
        self.mirroringButton.titleLabel?.font = .systemFont(ofSize: 25)
        self.mirroringButton.contentHorizontalAlignment = .center
        self.mirroringButton.addTarget(self, action: #selector(self.mirroringButtonDidTap), for: .touchUpInside)
        
        //계정 버튼
        self.addArrangedSubview(self.accountButton)
        self.accountButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.1)
        }
        self.accountButton.setTitle("🙎🏻‍♂️", for: .normal)
        self.accountButton.titleLabel?.font = .systemFont(ofSize: 25)
        self.accountButton.contentHorizontalAlignment = .center
        self.accountButton.addTarget(self, action: #selector(self.accountButtonDidTap), for: .touchUpInside)
        
    }
    
    
    
    
    @objc private func titleButtonDidTap() {
        self.delegate?.titleButtonDidTap()
    }
    @objc private func mirroringButtonDidTap() {
        self.delegate?.mirroringButtonDidTap()
    }
    @objc private func accountButtonDidTap() {
        self.delegate?.accountButtonDidTap()
    }
    
}
