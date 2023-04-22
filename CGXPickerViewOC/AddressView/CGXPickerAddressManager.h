//
//  CGXPickerAddressManager.h
//  CGXPickerView-OC
//
//  Created by 曹贵鑫 on 2020/4/12.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerAddressManager : CGXPickerBaseManager
@property (nonatomic , strong) UIColor *pickerTitleColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSize;//字体大小  默认15

@property (nonatomic , strong) UIColor *pickerTitleSelectColor;//字体颜色  默认黑色
@property (nonatomic , assign) CGFloat pickerTitleSelectSize;//字体大小  默认15
@end

NS_ASSUME_NONNULL_END
