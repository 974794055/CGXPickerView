//
//  CGXPickerViewDate.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXPickerViewDate: CGXPickerViewBaseUI {

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    func initWith(title:String) -> Void {
        
        backGroundView.backgroundColor = UIColor(white: 0, alpha: 0.20)
        if !title.isEmpty {
            manager.titleLabeStr = title
        }
      
        
        topView.updateTopView(Manager: manager)
        
        self.show(withAnimation: true)
    }
    
    override func clickRightBtn() {
      
//        if resultBlock != nil{
////            resultBlock!(selectArr,selectRow)
//        }
        self.dismiss(withAnimation: true)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
