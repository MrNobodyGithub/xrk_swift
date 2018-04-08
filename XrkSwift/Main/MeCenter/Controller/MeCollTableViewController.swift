//
//  MeCollTableViewController.swift
//  XrkSwift
//
//  Created by jason on 2018/3/27.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import UIKit

import MBProgressHUD

class MeCollTableViewController: UITableViewController {
    
    
    var dataArr : NSArray = NSArray.init()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        base()
        requetaData()
    }
    func requetaData(){
        let param = MeParamColl.init()
        param.curpage = 1
        param.page = 10
        let json = param.toJSON()
        ZMETool.MeRequestCol(params: json!, success: { (res) in
            let result:BaseResult =  res as! BaseResult
            if result.success {
                self.dataArr = result.array
                self.tableView.reloadData()
            }else{
            }
        }) { (err) in
            
            MBProgressHUD.hudShowMessage(curview: self.view, message: MESSAGE_network_fail)
        }
        
    }
    func base(){ 
        self.title = "coll" 
        self.zNavLeftBarButtonItem(target: self )
        self.clearsSelectionOnViewWillAppear = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MeCollTableViewCell.cellWith(tableView: tableView)
        let model = self.dataArr[indexPath.row] as! MeModelCol
        cell.model = model
        
        weak var weakself = self
        cell.block = { model in
            weakself?.cellQuit(strid: model.goods_id)
        }
        return cell
    }
    
    func cellQuit(strid: String)  {
        let param = MeParamCollCancle.init(favid: strid)
        let json = param.toJSON()
        
        ZMETool.MeRequestColCancle(params: json!, success: { (res) in
            let result:BaseResult =  res as! BaseResult
            if result.success {
               MBProgressHUD.hudShowSuccess(curview: self.view, text: "取消成功")
                self.requetaData()
            }else{
                
            }
        }) { (err) in
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
