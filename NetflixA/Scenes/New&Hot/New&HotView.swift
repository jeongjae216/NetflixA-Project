//
//  New&HotView.swift
//  NetflixA
//
//  Created by 정재 on 2022/06/19.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage


class NewAndHotView: UIStackView {
    
    private let newAndHotUpsideView = NewAndHotUpsideView()
    
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    
    private let willreleaseLabel = UILabel()
    let movieListView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var posterItems: [NewAndHotBasicCellModel] = []
    
    private let buttonStackView = UIStackView()
    private var titleLabel = UILabel()
    private let alarmButton = UIButton()
    private let informationButton = UIButton()
    
    private var miniTitleLabel = UILabel()
    
    private var storyLineLabel = UILabel()
    
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = .black
        
        //상단바 뷰
        self.addSubview(self.newAndHotUpsideView)
        self.newAndHotUpsideView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        }
        self.newAndHotUpsideView.isLayoutMarginsRelativeArrangement = true
        self.newAndHotUpsideView.layoutMargins.left = 20
        self.newAndHotUpsideView.layoutMargins.right = 20
        self.newAndHotUpsideView.axis = .vertical
        self.newAndHotUpsideView.alignment = .fill
        self.newAndHotUpsideView.distribution = .fill
    
        
        self.newAndHotUpsideView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        
    
        //스크롤 영역
        self.scrollView = UIScrollView()
        self.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints {
            $0.width.centerX.bottom.equalToSuperview()
            $0.top.equalTo(self.newAndHotUpsideView.snp.bottom)
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
        
        
        //공개 예정 레이블
        self.stackView.addArrangedSubview(self.willreleaseLabel)
        self.willreleaseLabel.text = "🍿 공개 예정"
        self.willreleaseLabel.textColor = .white
        self.willreleaseLabel.font = .systemFont(ofSize: 23)
        
        
        self.stackView.setCustomSpacing(15, after: willreleaseLabel)
        
        
        //포스터 리스트 뷰
        self.stackView.addArrangedSubview(self.movieListView)
        self.movieListView.snp.makeConstraints {
            $0.height.equalTo(250)
        }
        self.movieListView.register(NewAndHotBasicCell.self, forCellWithReuseIdentifier: "basicCell")
        
        self.movieListView.backgroundColor = .black
        self.movieListView.delegate = self
        self.movieListView.dataSource = self
        self.movieListView.showsVerticalScrollIndicator = false
//        self.movieListView.alwaysBounceHorizontal = true
        
        //포스터 리스트의 포스터 셀 설정 값
        let flowLayOut = self.movieListView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayOut?.itemSize = CGSize(width: self.frame.size.width, height: 250)
        flowLayOut?.minimumLineSpacing = 10
        flowLayOut?.scrollDirection = .vertical
        
        //버튼 스택 뷰
        self.stackView.addArrangedSubview(self.buttonStackView)
        self.buttonStackView.snp.makeConstraints {
            $0.height.equalTo(70)
        }
        self.buttonStackView.axis = .horizontal
        self.buttonStackView.alignment = .fill
        self.buttonStackView.distribution = .fill
        self.buttonStackView.border(width: 5, color: .blue, radius: 0)
        
        //영화제목
        self.buttonStackView.addArrangedSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        self.titleLabel.numberOfLines = 2
        self.titleLabel.textColor = .white
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        //알림 버튼
        self.buttonStackView.addArrangedSubview(self.alarmButton)
        self.alarmButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.15)
        }
        self.alarmButton.titleLabel?.numberOfLines = 2
        self.alarmButton.setTitle("알림 받기", for: .normal)
        self.alarmButton.setTitleColor(.lightGray, for: .normal)
        self.alarmButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        self.alarmButton.border(width: 2, color: .white, radius: 35)
        
        //정보 버튼
        self.buttonStackView.addArrangedSubview(self.informationButton)
        self.informationButton.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.15)
        }
        self.informationButton.titleLabel?.numberOfLines = 1
        self.informationButton.setTitle("정보", for: .normal)
        self.informationButton.setTitleColor(.lightGray, for: .normal)
        self.informationButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        self.informationButton.border(width: 2, color: .white, radius: 35)
        
        //
        self.stackView.addArrangedSubview(self.miniTitleLabel)
        self.miniTitleLabel.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        self.miniTitleLabel.numberOfLines = 1
        self.miniTitleLabel.textColor = .white
        self.miniTitleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        self.miniTitleLabel.border(width: 3, color: .green, radius: 0)
        
        //
        self.stackView.addArrangedSubview(self.storyLineLabel)
        self.storyLineLabel.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        self.storyLineLabel.numberOfLines = 3
        self.storyLineLabel.textColor = .lightGray
        self.storyLineLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.storyLineLabel.border(width: 3, color: .green, radius: 0)
        
        
    }
    
    //
    func displayContents(title: String, storyLine: String) {
//        self.posterItems = posterItems
        self.titleLabel.text = title
        self.miniTitleLabel.text = title
        self.storyLineLabel.text = storyLine
        
            self.movieListView.reloadData()
    }
    
}


extension NewAndHotView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //섹션개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    //셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posterItems.count
    }
    
    //셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let posterItem = self.posterItems[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath)
        if let cell = cell as? NewAndHotBasicCell {
            cell.displayContents(model: posterItem)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    
}
