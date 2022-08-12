//
//  StoredContentsListViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/04.
//

import Foundation
import UIKit
import SnapKit
import Alamofire



class StoredContentsListViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    
    private let storedContentsListUpsideView = StoredContentsListUpsideView()

    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .black
        
        //상단바 뷰
        self.view.addSubview(self.storedContentsListUpsideView)
        self.storedContentsListUpsideView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        }
//        self.storedContentsListUpsideView.delegate = self
        self.storedContentsListUpsideView.isLayoutMarginsRelativeArrangement = true
        self.storedContentsListUpsideView.layoutMargins.left = 20
        self.storedContentsListUpsideView.layoutMargins.right = 20
        self.storedContentsListUpsideView.axis = .vertical
        self.storedContentsListUpsideView.alignment = .fill
        self.storedContentsListUpsideView.distribution = .fill
    
        
        self.storedContentsListUpsideView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        
    
        //스크롤 영역
        self.scrollView = UIScrollView()
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints {
            $0.width.centerX.bottom.equalToSuperview()
            $0.top.equalTo(self.storedContentsListUpsideView.snp.bottom)
        }
        self.scrollView.alwaysBounceVertical = true
        
        //스택
        self.stackView = UIStackView()
        self.scrollView.addSubview(self.stackView)
        self.stackView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.bottom.top.equalToSuperview()
        }
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        
    }
    
}

