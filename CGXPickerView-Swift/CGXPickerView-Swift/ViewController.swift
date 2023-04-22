//
//  ViewController.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit
import CGXPickerViewSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for index in 0..<4 {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 5, y: 100+index*(40+10), width: 60, height:40)
            btn.backgroundColor = UIColor.orange
            self.view.addSubview(btn)
            btn.tag = 1000+index
            btn.addTarget(self, action:#selector(clickLeftBtn(button:)), for: UIControlEvents.touchUpInside)
        }
    }
    @objc func clickLeftBtn(button:UIButton) -> Void {

        if button.tag == 1000 {
            CGXPickerView.showStringPickerWithTitle(title: "请选择配送时间", dataSourceArr: [["很时尚","UI今生今世","圣诞节","于是打包","将换句话说的","很多话"],["很时尚","UI今生今世","圣诞节","于是打包","将换句话说的","很多话"],["于是打包","将换句话说的","很多话"]]) { (arr1, arr2) in
                print(arr1,arr2)
                var titleStr: String = ""
                for inder in 0..<arr1.count{
                    let aa:String = arr1[inder] as! String
                    titleStr = titleStr + "-" + aa
                }
                self.title = titleStr
            }
        } else if button.tag == 1001 {
            let manager = CGXPickerViewManager()
            manager.titleLabelColor = UIColor.red
            CGXPickerView.showStringPickerWithTitle(title: "请选择配送时间", dataSourceArr: [["很时尚","UI今生今世","圣诞节","于是打包","将换句话说的","很多话"]], manager: manager) { (arr1, arr2) in
                print(arr1,arr2)
                var titleStr: String = ""
                for inder in 0..<arr1.count{
                    let aa:String = arr1[inder] as! String
                    titleStr = titleStr + "-" + aa
                }
                self.title = titleStr
            }
        }else if button.tag == 1002 {
            let manager = CGXPickerViewManager()
            manager.titleLabelColor = UIColor.red
            CGXPickerView.showStringPickerWithTitle(title: "请选择配送时间", dataSourceArr: [["很时尚","UI今生今世","圣诞节","于是打包","将换句话说的","很多话"]], manager: manager) { (arr1, arr2) in
                print(arr1,arr2)
                var titleStr: String = ""
                for inder in 0..<arr1.count{
                    let aa:String = arr1[inder] as! String
                    titleStr = titleStr + "-" + aa
                }
                self.title = titleStr
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

