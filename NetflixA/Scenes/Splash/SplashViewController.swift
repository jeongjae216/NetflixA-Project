//
//  SplashViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/02/09.
//

import UIKit
import SnapKit

final class SplashViewController: UIViewController {
    private var logoView: UIImageView!
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .black
        
//        UIImageView().do {
//            self.logoView = $0
//            self.view.addSubview($0)
//            $0.backgroundColor = .red
//            $0.snp.makeConstraints {
//                $0.width.height.equalTo(100)
//                $0.centerX.centerY.equalToSuperview()
//            }
//        }
        
        let netflixLabel = UILabel()
        self.view.addSubview(netflixLabel)
        netflixLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        netflixLabel.text = "NETFLIX"
        netflixLabel.textColor = .red
        netflixLabel.textAlignment = .center
        netflixLabel.font = .systemFont(ofSize: 60, weight: .heavy)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            
//            let mainViewController = HomeViewController()
//            mainViewController.modalPresentationStyle = .fullScreen
//            self.present(mainViewController, animated: false, completion: nil)
            
//            let mainViewController0 = HomeViewController()
//            let mainViewController1 = HomeViewController()
//            let mainViewController2 = HomeViewController()
//
//            let tabBarController: UITabBarController = .init()
//            tabBarController.setViewControllers([mainViewController0, mainViewController1, mainViewController2], animated: false)
//            tabBarController.modalPresentationStyle = .fullScreen
//            self.present(tabBarController, animated: false, completion: nil)
            
            let mainTabBarController = MainTabBarController()
            
            mainTabBarController.modalPresentationStyle = .fullScreen
            self.present(mainTabBarController, animated: false, completion: nil)
            
        }
    }
    
}
