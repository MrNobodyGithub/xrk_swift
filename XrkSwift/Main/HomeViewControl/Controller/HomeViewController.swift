//
//  HomeViewController.swift
//  XrkSwift
//
//  Created by jason on 2017/9/8.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//
import UIKit 
class HomeViewController: UIViewController {
    @IBOutlet weak var viewdown: UIView!
    
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.basicConfigration()
        self.setupTableview()
        requestData()
    }
    func basicConfigration()  {
         self.title = "home"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(actionRightItem))
    }
    
    func actionRightItem()  {
        let vc = TestViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        let nav = UINavigationController.init(rootViewController: TestViewController())
        
        self.present(nav, animated: true) {
            
        }
        
    }
    func requestData() {
        
        
    }
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: MLScreenWidth, height: MLScreenHeight - 64 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
     }
}
