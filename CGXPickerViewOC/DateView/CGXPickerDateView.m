//
//  CGXPickerDateView.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerDateView.h"

@interface CGXPickerDateView ()
{
    UIDatePickerMode _datePickerMode;
    NSString *_title;
    NSString *_minDateStr;
    NSString *_maxDateStr;
    CGXPickerDateResultBlock _resultBlock;
    NSString *_selectValue;
    BOOL _isAutoSelect;  // 是否开启自动选择
}
// 时间选择器(默认大小: 320px × 216px)
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) CGXPickerDateManager *manager;

// 是否开启自动选择
@property (nonatomic, assign) BOOL IsAuto;
@property (nonatomic, copy) CGXPickerDateResultBlock resultBlock;

@end

@implementation CGXPickerDateView

- (void)initializeData
{
    [super initializeData];
    self.manager = [[CGXPickerDateManager alloc] init];
}
- (void)initializeViews
{
    [super initializeViews];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.20];
    [self.alertView addSubview:self.datePicker];
}
#pragma mark - 时间选择器
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, self.manager.topViewH, [UIScreen mainScreen].bounds.size.width, self.manager.pickerViewH)];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = _datePickerMode;
        _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh-Hans"];
        if (@available(iOS 13.4, *)) {
            _datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        }
        // 设置时间范围
        if (_minDateStr) {
            NSDate *minDate = [self toDateWithDateString:_minDateStr];
            _datePicker.minimumDate = minDate;
        }
        if (_maxDateStr) {
            NSDate *maxDate = [self toDateWithDateString:_maxDateStr];
            _datePicker.maximumDate = maxDate;
        }
        // 把当前时间赋值给 _datePicker
        [_datePicker setDate:[self toDateWithDateString:_selectValue] animated:YES];
        //        [_datePicker setLocale:[NSLocale systemLocale]];
        // 设置时区
        //        [_datePicker setTimeZone:[NSTimeZone localTimeZone]];
        //        // 设置UIDatePicker的显示模式
        // 滚动改变值的响应事件
        [_datePicker addTarget:self action:@selector(didSelectValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.datePicker.frame = CGRectMake(0, self.manager.topViewH, [UIScreen mainScreen].bounds.size.width, self.manager.pickerViewH);
    [self updatwWithManager:self.manager];
    
}

/**
 *  显示时间选择器   年月日
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
                        ResultBlock:(CGXPickerDateResultBlock)resultBlock
{
    [self showDatePickerWithTitle:title
                         DateType:UIDatePickerModeDate
                  DefaultSelValue:defaultSelValue
                       MinDateStr:minDateStr
                       MaxDateStr:maxDateStr
                     IsAutoSelect:isAutoSelect
                          Manager:manager ResultBlock:resultBlock];
}

/**
 *  显示时间选择器   时 、分
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如2015-08-28  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：2015-08-28），可为空
 *  @param maxDateStr       最大时间（如：2018-05-05），可为空
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
                        ResultBlock:(CGXPickerDateResultBlock)resultBlock
{
    [self showDatePickerWithTitle:title
                         DateType:UIDatePickerModeTime
                  DefaultSelValue:defaultSelValue
                       MinDateStr:minDateStr
                       MaxDateStr:maxDateStr
                     IsAutoSelect:isAutoSelect
                          Manager:manager ResultBlock:resultBlock];
}
/**
 *  显示时间选择器   年、月、日  时 、分
 *
 *  @param title            标题
 *  @param defaultSelValue  默认时间（如2015-08-28 00:00  为空，默认选中现在的时间）
 *  @param minDateStr       最小时间（如：2015-08-28 00:00），可为空
 *  @param maxDateStr       最大时间（如：2018-05-05 00:00），可为空
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
                               ResultBlock:(CGXPickerDateResultBlock)resultBlock
{
    [self showDatePickerWithTitle:title
                         DateType:UIDatePickerModeDateAndTime
                  DefaultSelValue:defaultSelValue
                       MinDateStr:minDateStr
                       MaxDateStr:maxDateStr
                     IsAutoSelect:isAutoSelect
                          Manager:manager ResultBlock:resultBlock];
}
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
                             ResultBlock:(CGXPickerDateResultBlock)resultBlock
{
    [self showDatePickerWithTitle:title
                         DateType:UIDatePickerModeCountDownTimer
                  DefaultSelValue:defaultSelValue
                       MinDateStr:minDateStr
                       MaxDateStr:maxDateStr
                     IsAutoSelect:isAutoSelect
                          Manager:manager ResultBlock:resultBlock];
}
- (void)showDatePickerWithTitle:(NSString *)title
                       DateType:(UIDatePickerMode)type
                DefaultSelValue:(NSString *__nonnull)defaultSelValue
                     MinDateStr:(NSString *__nonnull)minDateStr
                     MaxDateStr:(NSString *__nonnull)maxDateStr
                   IsAutoSelect:(BOOL)isAutoSelect
                        Manager:(CGXPickerDateManager *)manager
                    ResultBlock:(CGXPickerDateResultBlock)resultBlock
{
    self.resultBlock = resultBlock;
    self.IsAuto =- isAutoSelect;
    _datePickerMode = type;
    _title = title;
    if (minDateStr) {
        _minDateStr = minDateStr;
    }
    if (maxDateStr) {
        _maxDateStr = maxDateStr;
    }
    _isAutoSelect = isAutoSelect;
    _resultBlock = resultBlock;
    
    if (manager) {
        self.manager = manager;
    }
    // 默认选中今天的日期
    if (defaultSelValue.length > 0) {
        _selectValue = defaultSelValue;
    } else {
        _selectValue = [self toStringWithDate:[NSDate date]];
    }
    
    // 设置时间范围
    if (_minDateStr) {
        NSDate *minDate = [self toDateWithDateString:_minDateStr];
        _datePicker.minimumDate = minDate;
    }
    if (_maxDateStr) {
        NSDate *maxDate = [self toDateWithDateString:_maxDateStr];
        _datePicker.maximumDate = maxDate;
    }
    // 把当前时间赋值给 _datePicker
    [_datePicker setDate:[self toDateWithDateString:_selectValue] animated:YES];
    _datePicker.datePickerMode = _datePickerMode;
    
    self.manager.topModel.middleModel.text = title;
    
    [self showWithAnimation:YES];
}
#pragma mark - 时间选择器的滚动响应事件
- (void)didSelectValueChanged:(UIDatePicker *)sender {
    // 读取日期：datePicker.date
    _selectValue = [self toStringWithDate:sender.date];
    NSLog(@"滚动完成后，执行block回调: %@", _selectValue);
    // 设置是否开启自动回调
    if (_isAutoSelect) {
        if (_resultBlock) {
            _resultBlock(_selectValue);
        }
    }
}
#pragma mark - 格式转换：NSDate --> NSString
- (NSString *)toStringWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (_datePickerMode) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

#pragma mark - 格式转换：NSDate <-- NSString
- (NSDate *)toDateWithDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (_datePickerMode) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSDate *destDate = [dateFormatter dateFromString:dateString];
    
    return destDate;
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn
{
    [super clickLeftBtn];
    [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn
{
    [super clickRightBtn];
    if (_resultBlock) {
        _resultBlock(_selectValue);
    }
    [self dismissWithAnimation:YES];
}
- (void)didTapBackgroundView
{
    [super didTapBackgroundView];
}
- (void)dismissWithAnimation:(BOOL)animation
{
    [super dismissWithAnimation:animation];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
