//
//  CGXPickerStringManager.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/18.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseManager.h"


NS_ASSUME_NONNULL_BEGIN



@interface CGXPickerStringManager : CGXPickerBaseManager


@property (nonatomic , strong) UIColor *pickerTitleColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSize;//字体大小  默认15

@property (nonatomic , strong) UIColor *pickerTitleSelectColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSelectSize;//字体大小  默认15


@property (nonatomic , assign) BOOL isHaveLimit; //是否有 “不限”选项  默认没有

@end

NS_ASSUME_NONNULL_END
