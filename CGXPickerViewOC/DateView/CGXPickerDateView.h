//
//  CGXPickerDateView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseView.h"
#import "CGXPickerDateManager.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^CGXPickerDateResultBlock)(NSString *selectValue);

@interface CGXPickerDateView : CGXPickerBaseView

/**
 *  显示时间选择器   // 只显示日期
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如2015-08-28  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：2015-08-28），可为空
 *  @param maxDateStr       最大时间（如：2018-05-05），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择结果的回调
 *
 */
- (void)showDatePickerWithDateTitle:(NSString *)title
                    DefaultSelValue:(NSString *)defaultSelValue
                         MinDateStr:(NSString *)minDateStr
                         MaxDateStr:(NSString *)maxDateStr
                       IsAutoSelect:(BOOL)isAutoSelect
                            Manager:(CGXPickerDateManager *)manager
                        ResultBlock:(CGXPickerDateResultBlock)resultBlock;


/**
 *  显示时间选择器   时 、分  // 显示日期和时间
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如23:59  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：09:59），可为空
 *  @param maxDateStr       最大时间（如：22:59），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择结果的回调
 *
 */
- (void)showDatePickerWithTimeTitle:(NSString *)title
                    DefaultSelValue:(NSString *)defaultSelValue
                         MinDateStr:(NSString *)minDateStr
                         MaxDateStr:(NSString *)maxDateStr
                       IsAutoSelect:(BOOL)isAutoSelect
                            Manager:(CGXPickerDateManager *)manager
                        ResultBlock:(CGXPickerDateResultBlock)resultBlock;

/**
 *  显示时间选择器   年、月、日  时 、分  此时是一年的日期 defaultSelValue、minDateStr、 maxDateStr 设置需要同一年
 只显示小时和分钟 倒计时定时器
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如2015-08-28 00:00  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：2015-08-28 00:00），可为空
 *  @param maxDateStr       最大时间（如：2015-05-05 00:00），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择结果的回调
 *
 */
- (void)showDatePickerWithDateAndTimeTitle:(NSString *)title
                           DefaultSelValue:(NSString *)defaultSelValue
                                MinDateStr:(NSString *)minDateStr
                                MaxDateStr:(NSString *)maxDateStr
                              IsAutoSelect:(BOOL)isAutoSelect
                                   Manager:(CGXPickerDateManager *)manager
                               ResultBlock:(CGXPickerDateResultBlock)resultBlock;

/**
 *  显示时间选择器        只显示小时和分钟 倒计时定时器
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如23:59  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：09:59），可为空
 *  @param maxDateStr       最大时间（如：22:59），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择结果的回调
 *
 */
- (void)showDatePickerWithDownTimerTitle:(NSString *)title
                         DefaultSelValue:(NSString *)defaultSelValue
                              MinDateStr:(NSString *)minDateStr
                              MaxDateStr:(NSString *)maxDateStr
                            IsAutoSelect:(BOOL)isAutoSelect
                                 Manager:(CGXPickerDateManager *)manager
                             ResultBlock:(CGXPickerDateResultBlock)resultBlock;




- (void)showDatePickerWithTitle:(NSString *)title
                       DateType:(UIDatePickerMode)type
                DefaultSelValue:(NSString *__nonnull)defaultSelValue
                     MinDateStr:(NSString *__nonnull)minDateStr
                     MaxDateStr:(NSString *__nonnull)maxDateStr
                   IsAutoSelect:(BOOL)isAutoSelect
                        Manager:(CGXPickerDateManager *)manager
                    ResultBlock:(CGXPickerDateResultBlock)resultBlock;


@end

NS_ASSUME_NONNULL_END
