//
//  CGXPickerStringManager.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/18.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerStringManager.h"

/// RGB颜色(16进制)
#define RGBColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
@implementation CGXPickerStringManager
- (instancetype)init
{
    self = [super init];
    if (self) {
 

        _pickerTitleSize  =15;
        _pickerTitleColor = [UIColor blackColor];
        
        _pickerTitleSelectSize  =15;
        _pickerTitleSelectColor = [UIColor blackColor];
        

        _isHaveLimit = NO;
        
    }
    return self;
}
@end
