//
//  CGXPickerViewTopView.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/27.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXPickerViewTopView: UIView {

    // 左边取消按钮
    lazy var leftBtn: UIButton = {
        let btn = UIButton(type: .custom)
        self.addSubview(btn)
        btn.frame = CGRect(x: 5, y: 7, width: 60, height: manager.kTopViewH-14)
        btn.backgroundColor = manager.leftBtnBGColor
        btn.layer.cornerRadius = manager.leftBtnCornerRadius
        btn.layer.borderColor = manager.leftBtnborderColor?.cgColor
        btn.layer.borderWidth = manager.leftBtnBorderWidth
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = UIFont.systemFont(ofSize: manager.leftBtnTitleSize)
        btn.setTitleColor(manager.leftBtnTitleColor, for: .normal)
        btn.setTitle(manager.leftBtnTitle, for: .normal)
        return btn
    }()
    

    // 右边确定按钮
    lazy  var rightBtn: UIButton = {
        let btn = UIButton(type: .custom)
        self.addSubview(btn)
        btn.frame = CGRect(x: UIScreen.main.bounds.size.width - 65, y: 7, width: 60, height: manager.kTopViewH - 14)
        btn.backgroundColor = manager.rightBtnBGColor
        btn.layer.cornerRadius = manager.rightBtnCornerRadius
        btn.layer.masksToBounds = true
        btn.layer.borderWidth = manager.rightBtnBorderWidth
        btn.layer.borderColor = manager.rightBtnborderColor?.cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: manager.rightBtnTitleSize)
        btn.setTitleColor(manager.rightBtnTitleColor, for: .normal)
        btn.setTitle(manager.rightBtnTitle, for: .normal)
        return btn
    }()
    // 中间标题

    lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        self.addSubview(label)
        label.frame = CGRect(x: 65, y: 5, width: UIScreen.main.bounds.size.width - 130, height: manager.kTopViewH-5)
        label.backgroundColor = manager.titleLabelBGColor
        label.textColor = manager.titleLabelColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: manager.titleLabelSize)
        return label
    }()
    // 分割线视图
    lazy var lineView: UIView = {
        let view = UIView.init()
        self.addSubview(view)
        view.frame = CGRect.init(x: 0, y: manager.kTopViewH-1, width: UIScreen.main.bounds.size.width, height: 1)
        view.backgroundColor = manager.lineViewColor
        return view
    }()
    
    
    lazy var manager:CGXPickerViewManager = {
        let man = CGXPickerViewManager.init()
        return man
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    
    func initUI() -> Void {

        leftBtn.backgroundColor = manager.leftBtnBGColor
        leftBtn.layer.cornerRadius = manager.leftBtnCornerRadius
        leftBtn.layer.borderColor = manager.leftBtnborderColor?.cgColor
        leftBtn.layer.borderWidth = manager.leftBtnBorderWidth
      
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: manager.leftBtnTitleSize)
        leftBtn.setTitleColor(manager.leftBtnTitleColor, for: .normal)
        leftBtn.setTitle(manager.leftBtnTitle, for: .normal)
       
        
        
       
        rightBtn.backgroundColor = manager.rightBtnBGColor
        rightBtn.layer.cornerRadius = manager.rightBtnCornerRadius

        rightBtn.layer.borderWidth = manager.rightBtnBorderWidth
        rightBtn.layer.borderColor = manager.rightBtnborderColor?.cgColor
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: manager.rightBtnTitleSize)
        rightBtn.setTitleColor(manager.rightBtnTitleColor, for: .normal)
        rightBtn.setTitle(manager.rightBtnTitle, for: .normal)
        
        
       
        titleLabel.backgroundColor = manager.titleLabelBGColor
        titleLabel.textColor = manager.titleLabelColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: manager.titleLabelSize)
      
        
        leftBtn.frame = CGRect(x: 5, y: 7, width: 60, height: manager.kTopViewH-14)
        rightBtn.frame = CGRect(x: UIScreen.main.bounds.size.width - 65, y: 7, width: 60, height: manager.kTopViewH - 14)
        lineView.frame = CGRect.init(x: 0, y: manager.kTopViewH-manager.lineViewH, width: UIScreen.main.bounds.size.width, height: manager.lineViewH)
        titleLabel.frame = CGRect(x: 65, y: 5, width: UIScreen.main.bounds.size.width - 130, height: manager.kTopViewH-10)
        
        
        
        leftBtn.setTitle(manager.leftBtnTitle, for: .normal)
        rightBtn.setTitle(manager.rightBtnTitle, for: .normal)
        lineView.backgroundColor = manager.lineViewColor
        titleLabel.text = manager.titleLabeStr

    }
    func updateTopView(Manager:CGXPickerViewManager) -> Void {
        self.manager = Manager
        
        initUI()
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
