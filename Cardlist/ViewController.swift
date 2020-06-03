//
//  ViewController.swift
//  Cardlist
//
//  Created by m on 2020/6/3.
//  Copyright © 2020 m. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let networkClient = NetworkClient.sharedClient
//        networkClient.get(path: "https://www.baidu.com", parameters: nil, successBlock: { (response, data, dict) in
//            print(dict ?? "")
//        }, failureBlock: {
//            error in
//            print(error ?? "")
//        })
        
        let btn = UIButton(frame: CGRect.zero)
        btn.left = 100
        btn.top = 100
        btn.size = CGSize(width: 100, height: 100)
        btn.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
        btn.backgroundColor = UIColor.gray
        self.view.addSubview(btn)
    }

    @objc func btnAction(_ sender: UIButton) {
        let v = CardlistViewController()
        self.present(v, animated: true) {
            
        }
    }

}

