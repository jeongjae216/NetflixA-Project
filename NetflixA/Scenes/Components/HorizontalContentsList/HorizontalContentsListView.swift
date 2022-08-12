//
//  HorizontalContentsListView.swift
//  NetflixA
//
//  Created by 정재 on 2022/03/08.
//

import UIKit
import SnapKit


class HorizontalContentsPosterListView: UIStackView {
    
    var cellDidTap: ((Int) -> Void)?
    
    var posterItems: [HorizontalContentsPosterListBasicCellModel] = []
    
    private let contentsKategorieLabel = UILabel()
    private let posterListView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        //콘텐츠 포스터 리스트 뷰
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        
        //콘텐츠 종류 제목
        self.addArrangedSubview(self.contentsKategorieLabel)
        self.contentsKategorieLabel.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        self.contentsKategorieLabel.textColor = .white
        self.contentsKategorieLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        
        //포스터 리스트 뷰
        self.addArrangedSubview(self.posterListView)
        self.posterListView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
        self.posterListView.register(HorizontalContentsPosterListBasicCell.self, forCellWithReuseIdentifier: "basicCell")
        
        self.posterListView.backgroundColor = .black
        self.posterListView.delegate = self
        self.posterListView.dataSource = self
        self.posterListView.showsHorizontalScrollIndicator = false
        self.posterListView.alwaysBounceHorizontal = true
        
        //포스터 리스트의 포스터 셀 설정 값
        let flowLayOut = self.posterListView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayOut?.itemSize = CGSize(width: 120, height: 200)
        flowLayOut?.minimumLineSpacing = 10
        flowLayOut?.scrollDirection = .horizontal
        
    }

    
    
   
    func displayContents(kategories: String, posterItems: [HorizontalContentsPosterListBasicCellModel]) {
        self.contentsKategorieLabel.text = kategories
        self.posterItems = posterItems
        self.posterListView.reloadData()
    }
    
    
}
    





extension HorizontalContentsPosterListView: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        if let cell = cell as? HorizontalContentsPosterListBasicCell {
            cell.displayContents(model: posterItem)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.delegate?.posterListItems(self, didItemsTapAt: indexPath.row)
        self.cellDidTap?(indexPath.row)
    }
    
    
}
