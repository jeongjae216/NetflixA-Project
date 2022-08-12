//
//  MainTabBarController.swift
//  NetflixA
//
//  Created by 정재 on 2022/04/22.
//

import UIKit
import SnapKit

class MainTabBarController: UIViewController {
    
    private let homeViewController = HomeViewController()
    private let newAndHotViewController = NewAndHotViewController()
    private let searchViewController = SearchViewController()
    private let searchNavigationController = UINavigationController()
    private let storedContentsListViewController = StoredContentsListViewController()
    
    private let containerLayoutGuide = UILayoutGuide()
    private weak var keyViewController: UIViewController?
    
    override func loadView() {
        
        super.loadView()
        self.view.backgroundColor = .yellow
        
        //레이아웃 가이드
        let tabBarLayoutGuide = UILayoutGuide()
        self.view.addLayoutGuide(tabBarLayoutGuide)
        tabBarLayoutGuide.snp.makeConstraints {
            $0.width.centerX.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        //콘테이너 레이아웃 가이드
        self.view.addLayoutGuide(self.containerLayoutGuide)
        self.containerLayoutGuide.snp.makeConstraints {
            $0.width.centerX.top.equalToSuperview()
            $0.bottom.equalTo(tabBarLayoutGuide.snp.top)
        }
        
        //탭 바
        let tabBar = UIView()
        self.view.addSubview(tabBar)
        tabBar.snp.makeConstraints {
            $0.width.centerX.top.equalTo(tabBarLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        tabBar.backgroundColor = .black
        
        //탭 바 스택 뷰
        let tabBarStack = UIStackView()
        self.view.addSubview(tabBarStack)
        tabBarStack.snp.makeConstraints {
            $0.width.height.centerX.centerY.equalTo(tabBarLayoutGuide)
        }
        tabBarStack.axis = .horizontal
        tabBarStack.alignment = .fill
        tabBarStack.distribution = .fillEqually
        
        
        //홈 버튼
        let homeButton = UIButton()
        tabBarStack.addArrangedSubview(homeButton)
        homeButton.setTitle("홈", for: .normal)
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.addTarget(self, action: #selector(homeButtonDidTap), for: .touchUpInside)
        
        //New&Hot 버튼
        let newAndHotButton = UIButton()
        tabBarStack.addArrangedSubview(newAndHotButton)
        newAndHotButton.setTitle("New & Hot", for: .normal)
        newAndHotButton.setTitleColor(.white, for: .normal)
        newAndHotButton.addTarget(self, action: #selector(newAndHotButtonDidTap), for: .touchUpInside)
        
        //검색 버튼
        let searchButton = UIButton()
        tabBarStack.addArrangedSubview(searchButton)
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        
        //저장한 콘텐츠 목록 버튼
        let storedContentsButton = UIButton()
        tabBarStack.addArrangedSubview(storedContentsButton)
        storedContentsButton.setTitle("저장한 콘텐츠 목록", for: .normal)
        storedContentsButton.setTitleColor(.white, for: .normal)
        storedContentsButton.addTarget(self, action: #selector(storedContentsButtonDidTap), for: .touchUpInside)
        storedContentsButton.titleLabel?.numberOfLines = 2
        storedContentsButton.titleLabel?.textAlignment = .center
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchNavigationController.viewControllers = [self.searchViewController]
        self.displayViewController(self.homeViewController)
        
        
    }
    
    
    @objc func homeButtonDidTap() {
        print(#function)
        self.displayViewController(self.homeViewController)
    }
    @objc func newAndHotButtonDidTap() {
        print(#function)
        self.displayViewController(self.newAndHotViewController)
    }
    @objc func searchButtonDidTap() {
        print(#function)
        self.displayViewController(self.searchNavigationController)
    }
    @objc func storedContentsButtonDidTap() {
        print(#function)
        self.displayViewController(self.storedContentsListViewController)
    }
    
    func displayViewController(_ viewController: UIViewController) {
        
        guard viewController !== self.keyViewController else {
            return
        }
        self.keyViewController?.removeFromParent()
        self.keyViewController?.view.removeFromSuperview()
        self.keyViewController = nil
        
        self.keyViewController = viewController
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.view.snp.makeConstraints {
            $0.width.height.centerX.centerY.equalTo(self.containerLayoutGuide)
        }
        
    }
    
}

