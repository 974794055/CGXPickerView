//
//  CGXPickerBaseTextModel.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseTextModel.h"

@implementation CGXPickerBaseTextModel
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
