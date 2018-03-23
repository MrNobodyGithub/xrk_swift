//
//  MainViewController.swift
//  XrkSwift
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UIViewController{
    func test() -> String {
        print("--test--")
        return "testa"
    }
}
