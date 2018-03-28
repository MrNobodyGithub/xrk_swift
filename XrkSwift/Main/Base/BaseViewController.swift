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
    
    func z_navLeftItem(target: Any?, action: Selector) {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: "back_b"), for: .normal);
//        btn.backgroundColor = UIColor.cyan
        btn.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        btn.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        btn.addTarget(target, action: action, for: .touchUpInside)
       self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
    }
    
    func z_back(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
