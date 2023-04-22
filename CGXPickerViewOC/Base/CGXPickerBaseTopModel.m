//
//  CGXPickerBaseTopModel.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseTopModel.h"
#define CGXPickerRGBColor(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];

@implementation CGXPickerBaseTopModel
- (instancetype)init
{
    self = [super init];
    if (self) {

        self.leftModel = [[CGXPickerBaseTextModel alloc] init];
        self.leftModel.text = @"取消";
        self.leftModel.textColor = [UIColor whiteColor];
        self.leftModel.textFont = [UIFont systemFontOfSize:14];
        
        self.rightModel = [[CGXPickerBaseTextModel alloc] init];
        self.rightModel.text = @"确定";
        self.rightModel.textColor = [UIColor whiteColor];
        self.rightModel.textFont = [UIFont systemFontOfSize:14];
        
        self.middleModel = [[CGXPickerBaseTextModel alloc] init];
        self.middleModel.text = @"";
        self.middleModel.textColor = [UIColor redColor];
        self.middleModel.textFont = [UIFont systemFontOfSize:14];
        
        
        self.leftBoderModel = [[CGXPickerBaseBorderModel alloc] init];
        self.rightBoderModel = [[CGXPickerBaseBorderModel alloc] init];
        self.middleBoderModel = [[CGXPickerBaseBorderModel alloc] init];
        self.middleBoderModel.borderWidth = 0;
        self.middleBoderModel.cornerRadius = 0;
        
        self.lineViewColor =CGXPickerRGBColor(225, 225, 225, 1);
        
        self.lineHeight = 1;
 
    }
    return self;
}
@end
