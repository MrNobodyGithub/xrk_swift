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
  
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var layoutBtnTop: NSLayoutConstraint!
    @IBOutlet weak var labTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 
//        let testView = Bundle.main.loadNibNamed("ZTestView", owner: self, options: nil)?.last as! ZTestView
        
        let rect = CGRect.init(x: 0, y: 200, width: MLScreenWidth, height: 200)
        let testView = ZTestView.init(frame: rect)
        self.view.addSubview(testView)
        testView.frame = rect
        
    }
    @IBAction func btnAction(_ sender: Any) {
        layoutBtnTop.constant = 100
        labTest.text = "lab test"
    }
    
    @IBAction func btnActionDrag(_ sender: Any) {
        layoutBtnTop.constant = 234
        labTest.text = "drag"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


