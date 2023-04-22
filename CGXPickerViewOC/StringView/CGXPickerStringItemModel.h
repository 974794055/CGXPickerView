//
//  CGXPickerStringItemModel.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/16.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerStringItemModel : NSObject

@property (nonatomic , strong) NSString *text;
@property (nonatomic , strong) UIColor *textColor;//标题颜色
@property (nonatomic , assign) UIFont *textFont;//字体大小
@property (nonatomic , strong) id dataModel;//原始数据源

@end

NS_ASSUME_NONNULL_END
