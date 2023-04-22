//
//  NSString+CGXPickerView.h
//  CGXPickerView-OC
//
//  Created by 曹贵鑫 on 2020/1/29.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CGXPickerView)

/*
 星期
 */
+ (NSArray *)pickerWeek;
/*
 血型
 */
+ (NSArray *)pickerBlood;
/*
 星座
 */
+ (NSArray *)pickerConstellation;
/*
 性别
 */
+ (NSArray *)pickerGender;
/*
 学历
 */
+ (NSArray *)pickerEducation;
/*
 生肖
 */
+ (NSArray *)pickerAnimal;
/*
 民族
 */
+ (NSArray *)pickerNational;
/*
 宗教
 */
+ (NSArray *)pickerReligion;
@end

NS_ASSUME_NONNULL_END
