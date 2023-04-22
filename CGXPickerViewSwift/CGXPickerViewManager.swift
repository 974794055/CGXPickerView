//
//  CGXPickerViewManager.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXPickerViewManager: NSObject {
    
  
    var pickerLabelColor: UIColor = UIColor.black//
     var pickerLabelSelectColor: UIColor = UIColor.red//
    var pickerLabelBGColor: UIColor = UIColor.white//
    var pickerLabelSize: CGFloat = 14//字体大小
    
    
    var kPickerViewH: CGFloat = 200
    var kTopViewH: CGFloat = 40
    var lineViewColor: UIColor = UIColor.init(white: 0.93, alpha: 1)//分割线颜色
    var lineViewH: CGFloat = 1//分割线颜色
    var titleLabelColor: UIColor = UIColor.black//中间标题颜色
    var titleLabelBGColor: UIColor = UIColor.white//中间标题背景颜色
    var titleLabelSize: CGFloat = 14//字体大小
    var titleLabeStr: String = "" //文字
    
    var rightBtnTitleColor: UIColor = UIColor.blue//右侧标题颜色
    var rightBtnBGColor: UIColor = UIColor.white//右侧标题背景颜色
    var rightBtnTitleSize: CGFloat = 14//字体大小
    var rightBtnTitle = "确定"//右侧文字
    var rightBtnCornerRadius: CGFloat = 0.0//右侧圆角
    var rightBtnBorderWidth: CGFloat = 0.0//右侧边框宽
    var rightBtnborderColor: UIColor?//右侧边框颜色
    
    var leftBtnTitleColor:UIColor = UIColor.blue //右侧标题颜色
    var leftBtnBGColor: UIColor = UIColor.white //右侧标题背景颜色
    var leftBtnTitleSize: CGFloat = 14//字体大小
    var leftBtnTitle = "取消"//右侧文字
    var leftBtnCornerRadius: CGFloat = 0.0//右侧圆角
    var leftBtnBorderWidth: CGFloat = 0.0//右侧边框宽
    var leftBtnborderColor: UIColor?//右侧边框颜色
    
}
