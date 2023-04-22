//
//  CGXPickerBaseBorderModel.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerBaseBorderModel : NSObject

@property (nonatomic , strong) UIColor *bgColor;//标题背景颜色
@property (nonatomic , assign) CGFloat cornerRadius;//圆角
@property (nonatomic , assign) CGFloat borderWidth;//边框宽
@property (nonatomic , strong) UIColor *borderColor;//边框颜色

@property (nonatomic , assign) BOOL isBorder;//是否有边框 默认没有

@end

NS_ASSUME_NONNULL_END
