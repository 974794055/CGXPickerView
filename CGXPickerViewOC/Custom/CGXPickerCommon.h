//
//  Header.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/12.
//  Copyright © 2020 CGX. All rights reserved.
//

#ifndef Header_h
#define Header_h


#import "NSDate+CGXPickerView.h"

/// RGB颜色(16进制)
#define RGB_HEX(rgbValue, a) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((CGFloat)(rgbValue & 0xFF)) / 255.0 alpha:(a)]

///DEBUG打印日志
#ifdef DEBUG
# define CGXPickerDebugLog(FORMAT, ...) printf("[%s 行号:%d]:\n%s\n",__FUNCTION__,__LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
# define CGXPickerDebugLog(FORMAT, ...)
#endif

#define CGXPickerDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

typedef NS_ENUM(NSInteger, CGXPickerStringViewStyle) {
    CGXPickerStringViewStyleNode,
    CGXPickerStringViewStyleEducation,   //学历
    CGXPickerStringViewStyleBlood,   //血型
    CGXPickerStringViewStyleAnimal,   //生肖
    CGXPickerStringViewStyleConstellation, //星座
    CGXPickerStringViewStyleGender,   //性别
    CGXPickerStringViewStyleNation,  //民族
    CGXPickerStringViewStyleReligious,   //宗教
    CGXPickerStringViewStyleWeek,    //星期
};
///yyyy/MM/dd HH:mm EEE
typedef NS_ENUM(NSInteger, CGXPickerDateMode) {
    CGXPickerDateModeYMD,   //年月日
    CGXPickerDateModeStyle2,   //血型
    CGXPickerDateModeStyle3,   //生肖
    CGXPickerDateModeStyle4, //星座
};

#endif /* Header_h */
