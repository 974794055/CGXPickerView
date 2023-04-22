//
//  CGXPickerBaseBorderModel.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseBorderModel.h"
#define CGXPickerRGBColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];

@implementation CGXPickerBaseBorderModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bgColor =  CGXPickerRGBColor(252, 96, 134, 1);
        _cornerRadius = 16;
        _borderWidth = 6;
        _borderColor =  CGXPickerRGBColor(252, 96, 134, 1);
        _isBorder = NO;
    }
    return self;
}

@end
