//
//  CGXPickerBaseManager.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/19.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGXPickerBaseTopModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerBaseManager : NSObject
@property (nonatomic , strong) CGXPickerBaseTopModel *topModel;

@property (nonatomic , assign) CGFloat pickerViewH;//选择器高度 默认200
@property (nonatomic , assign) CGFloat topViewH;//按钮高度 默认 50
@property (nonatomic , assign) CGFloat itemViewH;// 默认 50



@end

NS_ASSUME_NONNULL_END
