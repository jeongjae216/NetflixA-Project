////
////  SearchResultCollectionView.swift
////  NetflixA
////
////  Created by 정재 on 2022/06/07.
////
//
//import UIKit
//import SnapKit
//
////protocol HorizontalContentsPosterListViewDelegate {
////    func posterListItems(_ posterListView: HorizontalContentsPosterListView, didItemsTapAt index: Int)
////}
//
//class SearchResultCollectionView: UIStackView {
//    
//    
////    var cellDidTap: ((Int) -> Void)?
//    
//    var posterItems: [SearchResultCollectionViewBasicCellModel] = []
//    
//    private let searchResultLabel = UILabel()
//    private let searchResultContentsListView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.configure()
//    }
//    
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    private func configure() {
//        
//        //콘텐츠 포스터 리스트 뷰
//        self.axis = .vertical
//        self.alignment = .fill
//        self.distribution = .fill
//        
//        //콘텐츠 종류 제목
//        self.addArrangedSubview(self.searchResultLabel)
//        self.searchResultLabel.snp.makeConstraints {
//            $0.height.equalTo(30)
//        }
//        self.searchResultLabel.textColor = .white
//        self.searchResultLabel.font = .systemFont(ofSize: 20, weight: .bold)
//        
//        
//        //포스터 리스트 뷰
//        self.addArrangedSubview(self.searchResultContentsListView)
//        self.searchResultContentsListView.snp.makeConstraints {
//            $0.height.equalTo(250)
//        }
//        self.searchResultContentsListView.register(SearchResultCollectionViewBasicCell.self, forCellWithReuseIdentifier: "basicCell")
//        
//        self.searchResultContentsListView.backgroundColor = .black
//        self.searchResultContentsListView.delegate = self
//        self.searchResultContentsListView.dataSource = self
//        self.searchResultContentsListView.showsHorizontalScrollIndicator = false
//        self.searchResultContentsListView.alwaysBounceHorizontal = true
//        
//        //포스터 리스트의 포스터 셀 설정 값
//        let flowLayOut = self.searchResultContentsListView.collectionViewLayout as? UICollectionViewFlowLayout
//        flowLayOut?.itemSize = CGSize(width: 140, height: 250)
//        flowLayOut?.minimumLineSpacing = 10
//        flowLayOut?.scrollDirection = .horizontal
//        
//    }
//
//    
//    
//   
//    func displayContents(kategories: String, posterItems: [SearchResultCollectionViewBasicCellModel]) {
//        self.searchResultLabel.text = kategories
//        self.posterItems = posterItems
//        self.searchResultContentsListView.reloadData()
//    }
//    
//    
//}
//    
//
//
//
//
//
//extension SearchResultCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    //섹션개수
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    //셀의 개수
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.posterItems.count
//    }
//    
//    //셀 설정
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let posterItem = self.posterItems[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath)
//        if let cell = cell as? SearchResultCollectionViewBasicCell {
//            cell.displayContents(model: posterItem)
//        }
//        return cell
//    }
//    
//}
//
//
//
//
