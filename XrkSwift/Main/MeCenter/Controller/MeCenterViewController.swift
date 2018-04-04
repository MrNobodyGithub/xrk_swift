//
//  MeCenterViewController.swift
//  XrkSwift
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit
import SwiftyJSON

private let MeCellId = "MeCellId"

class MeCenterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 

    var  meTabView: UITableView?
    var  meHeardView: UIView?
    var  meSwitchBtn: UIButton?
    var  meTabTitle:NSArray = []
    
    var  meTabeImage:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        base()
        setupUI()
        requestData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true;
        self.meHeardView?.backgroundColor = RGB_arc_Color()

    }
    func base(){
        self.meTabTitle = ["我的订单","我的收藏","申请服务商","帮助与反馈","优惠券","消息","设置"]
        self.meTabeImage = ["merchantOrder","myCollection","myServerPro","myHelp","YouHQ","registerVercode","mySetting"]
    }
    func requestData()  {
        let param  = BaseParam()
        let json = param.toJSON()
//        ZMETool.meRequest(params: (json as? [String : Any])) { ( res) in
//        }
     }

    func setupUI()  {
        //创建tab
        self.meTabView = UITableView(frame:view.bounds,style: UITableViewStyle.plain)
        self.view!.addSubview(self.meTabView!)

        self.meTabView?.delegate = self
        self.meTabView?.dataSource = self
        self.meTabView?.register(UITableViewCell .classForCoder(), forCellReuseIdentifier:MeCellId)
        self.meTabView?.estimatedRowHeight = 50
        self.meTabView?.separatorStyle = .none
        
        //创建Tabheard
        self.meHeardView = UIView(frame:
            CGRect(x:0, y:0, width:self.meTabView!.frame.size.width, height:180))
        self.meHeardView?.backgroundColor = RGB_arc_Color()
        self.meTabView?.tableHeaderView = self.meHeardView
    }
//-------------uitableview delegate------
    //table的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.meTabTitle.count)
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: MeCellId)
        cell.textLabel?.text = self.meTabTitle[indexPath.row] as? String
        cell.imageView?.image = UIImage.init(named: self.meTabeImage[indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MeCollTableViewController.init(style: .plain)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

