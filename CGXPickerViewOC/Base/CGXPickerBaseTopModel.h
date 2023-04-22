//
//  CGXPickerBaseTopModel.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXPickerBaseTextModel.h"
#import "CGXPickerBaseBorderModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerBaseTopModel : NSObject



@property (nonatomic , strong) CGXPickerBaseTextModel *leftModel;
@property (nonatomic , strong) CGXPickerBaseBorderModel *leftBoderModel;

@property (nonatomic , strong) CGXPickerBaseTextModel *rightModel;
@property (nonatomic , strong) CGXPickerBaseBorderModel *rightBoderModel;

@property (nonatomic , strong) CGXPickerBaseTextModel *middleModel;
@property (nonatomic , strong) CGXPickerBaseBorderModel *middleBoderModel;

@property (nonatomic , strong) UIColor *lineViewColor;//下划线颜色
@property (nonatomic , assign) CGFloat lineHeight;//下划线高度



@end

NS_ASSUME_NONNULL_END
