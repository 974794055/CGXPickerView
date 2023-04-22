//
//  NSDate+CGXPickerView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CGXPickerView)
/** 获取当前的时间 */
+ (NSString *)pickerCurrentDateString;
#pragma mark - 按指定格式获取当前的时间
+ (NSString *)pickerCurrentDateStringWithFormat:(NSString *)formatterStr;
@end

NS_ASSUME_NONNULL_END
