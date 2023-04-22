//
//  CGXPickerStringItemModel.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/16.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerStringItemModel.h"

@implementation CGXPickerStringItemModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _text = @"";
        _textColor =  [UIColor blackColor];
        _textFont= [UIFont systemFontOfSize:14];
    }
    return self;
}
@end
