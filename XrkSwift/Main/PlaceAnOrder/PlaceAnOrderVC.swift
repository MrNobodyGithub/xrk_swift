//
//  PlaceAnOrderVC.swift
//  XrkSwift
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 HuaZhengInfo. All rights reserved.
//

import UIKit

class PlaceAnOrderVC: UIViewController,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate {

//    var navigationOperation :UINavigationControllerOperation
    
//     func navigationController(navigationController: UINavigationController!, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController!, toViewController toVC: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
//        navigationOperation = operation
//        return self as! UIViewControllerAnimatedTransitioning
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
