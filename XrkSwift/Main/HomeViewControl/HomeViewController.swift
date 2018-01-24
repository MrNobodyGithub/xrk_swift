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
    }
    func basicConfigration()  {
         self.title = "home"
        requestA()
        requestB()
        
    }
    func requestB() {
       
        ZHomeTool.homeRequestList(params: nil) { ( res) in
            let result = res as! BaseResult
            if result.success{
//                let arr = result.array
//                let m = result.datas as! HomeModelList
//                print("--aaa--\(m.store_id)--\(m.store_name)")
//                 for i in 0...arr.count-1{
//                    let m : HomeModelList = arr[i] as! HomeModelList
//                    print("--aaa-\(i)-\(m.store_id)--\(m.store_name)")
//                }
             }else{
                
            }
        }
        
    }
    func requestA() {
        let url = "http://www.hisunflower.com/mobile/index.php?act=banner&op=get20171116&area_id=224&gc_id=-3";
        
        ZHomeTool.homeRequest(.get, urlString: url, params: nil) { (res) in
//            print("--res--\(res)")
//            let model:HomeModel = res as! HomeModel
//
//            print("--img--\(String(describing: model.banner_img))")
//            print("--title--\(String(describing: model.banner_title))")
//            print("--url--\(String(describing: model.banner_url))")
//            print("--al--\(res)")
        }
    }
    
    func setupTableview()  {
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: MLScreenWidth, height: MLScreenHeight - 64 - 49))
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.cyan
     }
}
