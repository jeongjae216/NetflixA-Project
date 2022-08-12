//
//  SearchUpsideView.swift
//  NetflixA
//
//  Created by 정재 on 2022/05/04.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage
/*
 SearchMostSearchingMovieListContentsView
 */

protocol SearchViewDelegate: AnyObject {
    func mostSearchingMovieListViewWillBeginDragging(me: SearchView)
}

class SearchView: UIStackView {
    
    public weak var delegate: SearchViewDelegate?
    
    struct ContentInfo {
        var posterImageURL: URL
        var title: String
    }
    
    // 최다 검색
    private let mostSearchLabel = UILabel()
    private let tableView = UITableView()
    private var contentsList: [ContentInfo] = []
    
    // 검색 결과
    private let searchResultStackView = UIStackView()
    private let searchResultContentsListView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var posterItems: [SearchResultCollectionViewBasicCellModel] = []
    private var recommendCategoryItems: [String] = []
    
    
    
    required init() {
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = .black
        
        // 최다 검색
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.width.centerX.height.centerY.equalToSuperview()
        }
        self.tableView.backgroundColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(SearchMostSearchingMovieListContentsView.self, forCellReuseIdentifier: "cell")
        
        self.mostSearchLabel.text = "최다 검색"
        self.mostSearchLabel.textColor = .white
        self.mostSearchLabel.font = .systemFont(ofSize: 20, weight: .medium)
        self.mostSearchLabel.frame.size.width = self.frame.size.width
        self.mostSearchLabel.frame.size.height = 60
        self.tableView.tableHeaderView = self.mostSearchLabel
        
        
        // 검색결과
        self.addSubview(self.searchResultStackView)
        self.searchResultStackView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        self.searchResultStackView.axis = .vertical
        self.searchResultStackView.alignment = .fill
        self.searchResultStackView.distribution = .fill
        
        //콘텐츠 종류 제목
        
        
        //포스터 리스트 뷰
        self.searchResultStackView.addArrangedSubview(self.searchResultContentsListView)
        self.searchResultContentsListView.register(SearchResultCollectionViewBasicCell.self, forCellWithReuseIdentifier: "basicCell")
        self.searchResultContentsListView.register(SearchRecommendCategoryCell.self, forCellWithReuseIdentifier: "categoryCell")
        self.searchResultContentsListView.register(SearchResultListSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader")
        
        self.searchResultContentsListView.backgroundColor = .black
        self.searchResultContentsListView.delegate = self
        self.searchResultContentsListView.dataSource = self
        self.searchResultContentsListView.showsHorizontalScrollIndicator = false
        self.searchResultContentsListView.alwaysBounceVertical = true
        
        //포스터 리스트의 포스터 셀 설정 값
        let flowLayOut = self.searchResultContentsListView.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayOut?.scrollDirection = .vertical
        flowLayOut?.sectionHeadersPinToVisibleBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateSearchResultContentsListViewLayout()
    }
    
    
    private func updateSearchResultContentsListViewLayout() {
        
    }
    
    
    func displayContents(_ contentsList: [ContentInfo]) {
        self.contentsList = contentsList
        self.tableView.reloadData()
        self.tableView.isHidden = false
        self.searchResultStackView.isHidden = true
    }
    
    func displayContents(posterItems: [SearchResultCollectionViewBasicCellModel], recommendCategoryItems: [String]) {
        self.posterItems = posterItems
        self.recommendCategoryItems = recommendCategoryItems
        self.searchResultContentsListView.reloadData()
        self.tableView.isHidden = true
        self.searchResultStackView.isHidden = false
    }
    
    
    
//    func displaySearchResultContentsList(_ contentsList: [ContentInfo]) {
//        self.tableView.isHidden = true
//        self.searchResultContentsListView.isHidden = false
//        
//        self.searchResultContentsList = contentsList
//        self.searchResultContentsListView.reloadData()
//    }
    
}



extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.delegate?.mostSearchingMovieListViewWillBeginDragging(me: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let view = cell as? SearchMostSearchingMovieListContentsView {
            let contents: ContentInfo = self.contentsList[indexPath.row]
            print("cell:", indexPath.row, contents.posterImageURL)
            view.displayContents(
                posterImageURL: contents.posterImageURL,
                title: contents.title)
        }
        return cell
    }
    
}


extension SearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //섹션개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    //셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.posterItems.count
        } else {
            return self.recommendCategoryItems.count
        }
        
    }
    
    //헤더 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath)
        if let view = view as? SearchResultListSectionHeaderView {
            let item: String = {
                
                if indexPath.section == 0 {
                    return "영화 & 시리즈"
                } else {
                    return "다음과 관련된 콘텐츠도 찾아보세요:"
                }
                
            }()
            view.display(title: item)
        }
        
        return view
    }
    
    //셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath)
            if let cell = cell as? SearchResultCollectionViewBasicCell {
                let item = self.posterItems[indexPath.row]
                cell.displayContents(model: item)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath)
            if let cell = cell as? SearchRecommendCategoryCell {
                let item = self.recommendCategoryItems[indexPath.row]
                cell.display(title: item)
            }
            return cell
        }
       
    }
    
}


extension SearchView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            var itemSize = CGSize()

            let itemSizeRate = CGSize(width: 3, height: 4.5)
            let horiItemCount: CGFloat = 3
            let spacing: CGFloat = 10

            itemSize.width = {
                let viewWidth: CGFloat = collectionView.frame.size.width
                let totalSpacing: CGFloat = horiItemCount * spacing - spacing
                return (viewWidth - totalSpacing) / horiItemCount
            }()
            itemSize.height = {
                return itemSize.width * itemSizeRate.height / itemSizeRate.width
            }()
            return itemSize
        } else {
            return CGSize(width: collectionView.frame.width, height: 40)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 0
        }
    }
    
    //collection VC section 마진값
    func collectionCellUI(){
        let interval:CGFloat = 3
        let flowLayout: UICollectionViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.init(top: interval , left: interval, bottom: 0, right: interval)
        self.searchResultContentsListView.collectionViewLayout = flowLayout
    }
}
