//
//  NSString+CGXPickerView.m
//  CGXPickerView-OC
//
//  Created by 曹贵鑫 on 2020/1/29.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "NSString+CGXPickerView.h"


@implementation NSString (CGXPickerView)


+ (NSArray *)pickerWeek
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日", nil];
}
+ (NSArray *)pickerBlood
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"A型",@"B型",@"AB型",@"O型", nil];
}
+ (NSArray *)pickerConstellation
{
    return [NSMutableArray arrayWithObjects:@"不限",@"水瓶座",@"双鱼座",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座", nil];
}
+ (NSArray *)pickerGender
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"男",@"女", nil];
}
+ (NSArray *)pickerEducation
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"高中及以下",@"大专",@"本科",@"硕士",@"博士",@"博士后", nil];
}
+ (NSArray *)pickerAnimal
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪", @"鼠",nil];
}
+ (NSArray *)pickerNational
{
    return [NSMutableArray arrayWithObjects:
            @"汉族",@"壮族",@"满族",@"回族",@"苗族",@"维吾尔族",@"土家族",@"彝族",@"蒙古族",@"藏族",@"布依族",@"侗族",@"瑶族",@"朝鲜族",
            @"白族",@"哈尼族",@"哈萨克族",@"黎族",@"傣族",@"畲族",@"傈僳族",@"仡佬族",@"东乡族",@"高山族",@"拉祜族",@"水族",@"佤族",@"纳西族",@"羌族",@"土族",@"仫佬族",@"锡伯族",@"柯尔克孜族",@"达斡尔族",@"景颇族",@"毛南族",@"撒拉族",@"布朗族",@"塔吉克族",@"阿昌族",@"普米族",@"鄂温克族",@"怒族",@"京族",@"基诺族",@"德昂族",@"保安族",@"俄罗斯族",@"裕固族",@"乌孜别克族",@"门巴族",@"鄂伦春族",@"独龙族",@"塔塔尔族",@"赫哲族",@"珞巴族",nil];
}
+ (NSArray *)pickerReligion
{
    return [NSMutableArray arrayWithObjects:
            @"不限",@"佛教",@"道教",@"儒教",@"伊斯兰教",@"基督教",@"天主教",@"其他宗教",nil];
}

@end
