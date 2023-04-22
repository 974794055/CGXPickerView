//
//  CGXPickerViewAddress.swift
//  CGXPickerView-Swift
//
//  Created by 曹贵鑫 on 2018/8/19.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXPickerViewAddress: CGXPickerViewBaseUI,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var dataArray = NSMutableArray.init()
    var selectArr = NSMutableArray.init()
    var selectRow = NSMutableArray.init()
    var defaultSelectArr = NSMutableArray.init()
    var isAutomatic:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dataArray = NSMutableArray.init()
        selectRow = NSMutableArray.init()
        selectArr = NSMutableArray.init()
        defaultSelectArr = NSMutableArray.init()
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initWith(title:String) -> Void {
        
        backGroundView.backgroundColor = UIColor(white: 0, alpha: 0.20)
        if !title.isEmpty {
            manager.titleLabeStr = title
        }
        
        if self.dataArray.count == 0 {
            return
        }
        
        topView.updateTopView(Manager: manager)
        
        pickerView.backgroundColor = UIColor.white
        pickerView.dataSource = self
        pickerView.delegate = self
        
        for index in 0..<self.dataArray.count {
            let rowArr:NSArray  = self.dataArray[index] as! NSArray
            if self.defaultSelectArr.count == 0 {
                selectArr.add(rowArr[0])
                selectRow.add(0)
                pickerView.selectRow(0, inComponent: index, animated: true)
                self.pickerView(self.pickerView, didSelectRow: 0, inComponent: index)
            } else{
                for defaultindex in 0..<self.defaultSelectArr.count {
                    selectArr.add(rowArr[defaultindex])
                    selectRow.add(defaultindex)
                    pickerView.selectRow(defaultindex, inComponent: index, animated: true)
                    self.pickerView(self.pickerView, didSelectRow: defaultindex, inComponent: index)
                }
            }
        }
        self.show(withAnimation: true)
    }
    
    
    override func clickRightBtn() {
        print(selectArr,selectRow)
        if self.resultBlock != nil{
            self.resultBlock!(selectArr,selectRow)
        }
        self.dismiss(withAnimation: true)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
// MARK: - "代理处理"
extension CGXPickerViewAddress {
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.dataArray.count
    }
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let rowArr:NSArray  = self.dataArray[component] as! NSArray
        return rowArr.count
    }
    //设置列宽
    //    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    //            return (pickerView.frame.size.width-40) / 3
    //    }
    //设置行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowArr:NSArray  = self.dataArray[component] as! NSArray
        let rowStr:String  = rowArr[row] as! String
        return rowStr
    }
    //任意UIView类型的元素
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel
        if pickerLabel == nil{
            pickerLabel = UILabel()
            pickerLabel?.frame = CGRect.init(x: 0, y: 0, width: (pickerView.frame.size.width-40) / CGFloat(self.dataArray.count), height: 30)
            pickerLabel?.font = UIFont.systemFont(ofSize: 16)
            pickerLabel?.textAlignment = .center
            pickerLabel?.adjustsFontSizeToFitWidth = true
            pickerLabel?.backgroundColor = UIColor.orange
            pickerLabel?.textColor = UIColor.blue
        }
        pickerLabel?.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        return pickerLabel!
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rowArr:NSArray  = self.dataArray[component] as! NSArray
        let rowStr:String  = rowArr[row] as! String
        selectRow.replaceObject(at: component, with: row)
        selectArr.replaceObject(at: component, with: rowStr)
        if self.isAutomatic {
            if resultBlock != nil{
                resultBlock!(selectArr,selectRow)
            }
        }
        print(component,row,rowStr)
    }
}
// MARK: - "外界调用处理"
extension CGXPickerViewAddress {
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        let aa = CGXPickerViewString.init(frame:  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        aa.dataArray = dataSourceArr
        aa.resultBlock =  block
        aa.initWith(title: title)
    }
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray,manager:CGXPickerViewManager, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        let aa = CGXPickerViewString.init(frame:  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        aa.dataArray = dataSourceArr
        aa.manager = manager
        aa.initWith(title: title)
        aa.resultBlock =  block
    }
    class func showStringPickerWithTitle(title:String,dataSourceArr:NSMutableArray,defaultSelectArr:NSMutableArray,isAutomatic:Bool,manager:CGXPickerViewManager, block: @escaping CGXPickerViewStringResultBlock) -> Void {
        let aa = CGXPickerViewString.init(frame:  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        aa.dataArray = dataSourceArr
        aa.manager = manager
        aa.isAutomatic = isAutomatic
        aa.defaultSelectArr = defaultSelectArr
        aa.initWith(title: title)
        aa.resultBlock =  block
        
    }
}

