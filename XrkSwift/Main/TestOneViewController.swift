//
//  TestOneViewController.swift
//  XrkSwift
//
//  Created by CityMedia on 2018/4/18.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit
//import ztestView

class TestOneViewController: UIViewController {
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        print("-------")
//        let testView = Bundle.main.loadNibNamed("ZTestView", owner: self, options: nil)?.last as! ZTestView
        
        let rect = CGRect.init(x: 0, y: 200, width: MLScreenWidth, height: 200)
        let testView:ZTestView = ZTestView.init(frame: rect)
        self.view.addSubview(testView)
     
        testView.frame = rect
        
    }
  
    @IBAction func btnActionDrag(_ sender: Any) {
        
    }
    
    @IBAction func btnAction(_ sender: Any) {
        let vc = TestOcViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnActionSwiftOc(_ sender: Any) {
        let model = OcSwiftBridgeObject.init()
        model.testA()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


