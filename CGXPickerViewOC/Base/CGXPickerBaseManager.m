//
//  CGXPickerBaseManager.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/19.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseManager.h"

/// RGB颜色(16进制)
#define CGXPickerRGBColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];

@implementation CGXPickerBaseManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.topModel = [[CGXPickerBaseTopModel alloc] init];
        _pickerViewH = 200;
        _topViewH = 50;
        _itemViewH = 50;
    }
    return self;
}
@end
