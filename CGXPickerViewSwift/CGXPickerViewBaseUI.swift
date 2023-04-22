//
//  CGXPickerViewBaseUI.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit
import Foundation
/// 系统普通字体
var gof_SystemFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.systemFont(ofSize: size)
}
/// 系统加粗字体
var gof_BoldFontWithSize: (CGFloat) -> UIFont = {size in
    return UIFont.boldSystemFont(ofSize: size)
}

/// 仅用于标题栏上，大标题字号
let kNavFont = gof_SystemFontWithSize(18);

/// 标题字号
let kTitleFont = gof_SystemFontWithSize(18);

/// 正文字号
let kBodyFont = gof_SystemFontWithSize(16);

/// 辅助字号
let kAssistFont = gof_SystemFontWithSize(14);

/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var gof_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}

/// 根据RGB生成颜色(格式为：22,22,22)
var gof_RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}

/// 根据色值生成颜色(无透明度)(格式为0xffffff)
var gof_ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

/// 黑色
let kBColor = gof_ColorWithHex(0x000000);
/// 白色
let kWColor = gof_ColorWithHex(0xffffff)
/// 无色
let kCColor = UIColor.clear
let kG1Color = gof_ColorWithHex(0x323232);
let kG2Color = gof_ColorWithHex(0x646464);
let kG3Color = gof_ColorWithHex(0x969696);
let kG4Color = gof_ColorWithHex(0xc8c8c8); // 仅使用标题栏分割线
let kG5Color = gof_ColorWithHex(0xdcdcdc); // 主页面分割线
let kG6Color = gof_ColorWithHex(0xf0f0f0); // 仅用于背景灰
let kBgColor  = gof_ColorWithHex(0xf8f8f8); // 界面背景颜色
let kHolderTipColor = gof_ColorWithHex(0xafafaf); // 提示：输入框，这个提示语的颜色
let kButtonBlueColor = gof_ColorWithHex(0x41acff);

let kLightColor = gof_ColorWithHex(0x666666);
let kGrayTitleColor = gof_ColorWithHex(0x999999);
let kGrayTipColor = gof_ColorWithHex(0x757575);

let k323232Color = gof_ColorWithHex(0x323232);
let k646464Color = gof_ColorWithHex(0x646464);
let k969696Color = gof_ColorWithHex(0x969696);
let kf0f0f0Color = gof_ColorWithHex(0xf0f0f0);

/// 三大色调
let kEssentialColor = gof_ColorWithHex(0x46a0f0);  // 主色调，蓝色
let kAssistOrangeColor = gof_ColorWithHex(0xff8c28);  // 辅色调，橙色
let kAssistGreenColor = gof_ColorWithHex(0x5abe00);  // 辅色调，绿色


// MARK: - 打印日志

/**
 打印日志
 
 - parameter message: 日志消息内容
 */
func printLog<T>(message: T)
{
    #if DEBUG
    print(" \(message)");
    #endif
}

// MARK: - 系统版本

/// 获取系统版本号
let kSystemVersion = Float(UIDevice.current.systemVersion);
/// 是否IOS7系统
let kIsIOS7OrLater = Int(UIDevice.current.systemVersion)! >= 7 ? true : false;
/// 是否IOS8系统
let kIsIOS8OrLater = Int(UIDevice.current.systemVersion)! >= 8 ? true : false;
/// 是否IOS9系统
let kIsIOS9OrLater = Int(UIDevice.current.systemVersion)! >= 9 ? true : false;

// MARK: - 常用宽高


/// 屏幕Bounds
private let kScreenBounds = UIScreen.main.bounds;
/// 屏幕高度
private let kScreenHeight = UIScreen.main.bounds.size.height;
/// 屏幕宽度
private let kScreenWidth = UIScreen.main.bounds.size.width;
/// 导航栏高度
private let kNavBarHeight = 44.0;
/// 状态栏高度
private let kStatusBarHeight = 20.0;
/// Tab栏高度
private let kTabBarHeight = 49.0;

//根据图片名称获取图片
let gof_ImageWithName: (String) -> UIImage? = {imageName in
    return UIImage(named: imageName);
}


typealias CGXPickerViewStringResultBlock = (_ selectAddressArr:NSArray, _ selectAddressRow:NSArray) -> Void


class CGXPickerViewBaseUI: UIView {

     var resultBlock: CGXPickerViewStringResultBlock?
    
    // 背景视图
    
    // MARK: - 背景遮罩图层
    lazy var backGroundView:UIView = {
        var view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        self.addSubview(view)
        view.backgroundColor = UIColor(white: 0, alpha: 0.20)
        view.isUserInteractionEnabled = true
        let myTap = UITapGestureRecognizer(target: self, action: #selector(self.didTapBackgroundView(_:)))
        view.addGestureRecognizer(myTap)
        return view
    }()
    
    
    // 弹出视图
    lazy var alertView: UIView = {
       let view = UIView.init(frame: CGRect.init(x: 0, y: kScreenHeight-manager.kTopViewH - manager.kPickerViewH, width: kScreenWidth, height: manager.kTopViewH + manager.kPickerViewH))
        view.backgroundColor = UIColor.white
        self.addSubview(view)
        return view
    }()
    // 顶部视图
    lazy var topView: CGXPickerViewTopView = {
        let view = CGXPickerViewTopView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: manager.kTopViewH))
        view.backgroundColor = UIColor.white
        self.alertView.addSubview(view)
         view.leftBtn.addTarget(self, action: #selector(self.clickLeftBtn), for: .touchUpInside)
         view.rightBtn.addTarget(self, action: #selector(self.clickRightBtn), for: .touchUpInside)
        return view
    }()
 

    lazy var manager:CGXPickerViewManager = {
       let man = CGXPickerViewManager.init()
        return man
    }()
    
     lazy var pickerView:UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect.init(x: 0, y: manager.kTopViewH, width: frame.size.width, height: manager.kPickerViewH)
        picker.backgroundColor = UIColor.white
        self.alertView.addSubview(picker)
        return picker
     }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

       
    }
    

    // MARK: - 弹出视图方法
    func show(withAnimation animation: Bool) {
        //1. 获取当前应用的主窗口
        let keyWindow: UIWindow? = UIApplication.shared.keyWindow
        keyWindow?.addSubview(self)
        if animation {
            // 动画前初始位置
            var rect: CGRect = alertView.frame
            rect.origin.y = kScreenHeight
            alertView.frame = rect
            // 浮现动画
            UIView.animate(withDuration: 0.3, animations: {
                var rect: CGRect = self.alertView.frame
                rect.origin.y -= self.manager.kTopViewH + self.manager.kPickerViewH
                self.alertView.frame = rect
            })
        }
    }
    
    // MARK: - 关闭视图方法
    func dismiss(withAnimation animation: Bool) {
        // 关闭动画
        UIView.animate(withDuration: 0.5, animations: {
            var rect: CGRect = self.alertView.frame
            rect.origin.y += self.manager.kTopViewH + self.manager.kPickerViewH
            self.alertView.frame = rect
            self.backGroundView.alpha = 0
        }) { finished in
            self.removeFromSuperview()
        }
    }

    
    
    
    /** 点击背景遮罩图层事件 */
    @objc func didTapBackgroundView(_ sender: UITapGestureRecognizer?) {
        self.dismiss(withAnimation: true)
    }
    
    /** 取消按钮的点击事件 */
    @objc func clickLeftBtn() {
        self.dismiss(withAnimation: true)
    }
    
    /** 确定按钮的点击事件 */
    @objc func clickRightBtn() {
        print("确定")
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
// MARK: - 懒加载view层
extension CGXPickerViewBaseUI {
    

}
