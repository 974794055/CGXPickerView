//
//  CGXPickerView.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXPickerView: NSObject {
    
    
    // MARK: - "外界调用处理"
    /*
     title:标题
     dataSourceArr:数据源数组  格式[[String,String,String],[String,String,String]]
     defaultSelectArr:选中的下标 可为空数组 个数和dataSourceArr保持一致
     manager:自定义布局设置
     block: 返回两个数组  第一个选中的字符串数组。 第二个选中的字符串所在分区下标数组
     */
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        CGXPickerViewString.showStringPickerWithTitle(title: title, dataSourceArr: dataSourceArr, block: block)
    }
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray,manager:CGXPickerViewManager, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        CGXPickerViewString.showStringPickerWithTitle(title: title, dataSourceArr: dataSourceArr, manager: manager, block: block)
    }
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray,defaultSelectArr:NSMutableArray,isAutomatic:Bool,manager:CGXPickerViewManager, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        CGXPickerViewString.showStringPickerWithTitle(title: title, dataSourceArr: dataSourceArr, manager: manager, block: block)
    }
    
    
    
    
    
    
    
}
