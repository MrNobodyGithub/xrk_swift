//
//  HomeHeaderView.swift
//  XrkSwift
//
//  Created by jason on 2018/3/23.
//  Copyright © 2018年 HuaZhengInfo. All rights reserved.
//

import Foundation
import UIKit
import SDCycleScrollView

protocol HomeHeaderViewDelegate {
//    var model : HomeModelCategory {get set}

      func clickCategory(model: HomeModelCategory)
    func clickCycle(model: HomeModelCycle)
}


class HomeHeaderView: UIView, SDCycleScrollViewDelegate{
    
    var viewCategory : UIView = UIView.init()
    var viewCycle : SDCycleScrollView = SDCycleScrollView.init()
    let h_cycle = MLScreenWidth/2.0
    let h_category = 240
    override init(frame:CGRect){
        super.init(frame: frame)
        
        setupViewCycle()
        setupViewCategory()
        
    }
    func setupViewCycle( )  {
        let view = SDCycleScrollView.init(frame: CGRect.init(x: 0, y: 0, width: MLScreenWidth, height: h_cycle))
        viewCycle = view
        self.addSubview(view)
        view.delegate = self
        
    }
    func setupViewCategory( )  {
        let view = UIView.init(frame: CGRect.init(x: 0, y: Int(h_cycle), width: Int(MLScreenWidth), height: h_category))
        viewCategory = view
        self.addSubview(view)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     var delegate : HomeHeaderViewDelegate?
    

    var _dataArrCycle : NSArray!
    var dataArrCycle :NSArray{
        set{
            _dataArrCycle  = newValue
            setupViewCycle(arr: newValue)
        }
        get {
            return _dataArrCycle!
        }
    }
    let objc_key_btn_homecategory = "objc_key_btn_homecategory"
    
//    var _dataArrCategory: NSArray?
    var dataArrCategory:NSArray?{
//        willSet{  }
        didSet{
            setupViewsCategory(arr: dataArrCategory!)
        }
        //        set{
//            _dataArrCategory = newValue
//            setupViewsCategory(arr: dataArrCategory!)
//        }
//        get{
//            return _dataArrCategory
//        }
    }
    func setupViewCycle(arr: NSArray){ 
       
        let mutArr = NSMutableArray.init()
        for model : HomeModelCycle in arr as! [HomeModelCycle]  {
            mutArr.add(model.banner_img)
            mutArr.add(model.banner_img)
        }
        viewCycle.autoScrollTimeInterval = 3.5
        viewCycle.imageURLStringsGroup = mutArr.copy() as! [Any]
        viewCycle.adjustWhenControllerViewWillAppera()
        viewCycle.placeholderImage = UIImage.init(named: "default")
    }
    
    
    func btnAction(btn:UIButton){
//        let model : HomeModelCategory = objc_getAssociatedObject(btn, objc_key_btn_homecategory) as! HomeModelCategory
        let model: HomeModelCategory = self.dataArrCategory![btn.tag - 10] as! HomeModelCategory
        if self.delegate != nil {
             self.delegate?.clickCategory(model: model)
        }
        
    }
    func setupViewsCategory(arr: NSArray)  {
        
        for view : UIView in viewCategory.subviews {
            view.removeFromSuperview()
        }
        
         for i: Int in 0...arr.count-2 {
            let model: HomeModelCategory = arr[i] as! HomeModelCategory
            let btnW:CGFloat = MLScreenWidth/5.0;
            let btnH:CGFloat = 100.0;
            var btnX:CGFloat = 0;
            var btnY:CGFloat = 25;
            
            btnX = (i % 5 ).cgfloat() * btnW
            btnY += (i/5).cgfloat() * btnH
            
            let btn :ZButton = ZButton.init(frame:CGRect.init(x: btnX, y: btnY, width: btnW, height: CGFloat(btnH)))
            
            btn.imageView?.sd_setImage(with: URL.init(string: model.cn_pic), completed: { (image, err, Type, ur) in

                btn.setImage(image, for: .normal)
            })
//             self.addSubview(btn)
            viewCategory.addSubview(btn)
            btn.setTitle(model.gc_name, for: UIControlState.normal)

            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            btn.titleLabel?.textAlignment = NSTextAlignment.center
            
//            objc_setAssociatedObject(btn, objc_key_btn_homecategory, model, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            btn.tag = 10 + i
            btn.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
            
        }
        
    }
    
    //cycle delegate
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        let model = _dataArrCycle[index]
        if self.delegate != nil {
            self.delegate?.clickCycle(model: model as! HomeModelCycle)
        }
    }
    
    
}
