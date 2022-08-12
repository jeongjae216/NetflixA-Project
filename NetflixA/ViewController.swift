//
//  ViewController.swift
//  NetflixA
//
//  Created by 정재 on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {
    
//    var value: Int = 0
    
//    init() {
//        self.value = 0
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let label = UILabel()
        
        label.text = "ViewController"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
    }
    
    
}

