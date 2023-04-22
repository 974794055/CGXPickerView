//
//  CGXPickerBaseTopView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXPickerBaseTopModel.h"
NS_ASSUME_NONNULL_BEGIN
/*
 取消按钮
 */
typedef void(^CGXPickerBaseTopViewCancelBlock)(void);
/*
 确认按钮
 */
typedef void(^CGXPickerBaseTopViewSureBlock)(void);
@interface CGXPickerBaseTopView : UIView

// 左边取消按钮
@property (nonatomic, strong) UIButton *leftBtn;
// 右边确定按钮
@property (nonatomic, strong) UIButton *rightBtn;
// 中间标题
@property (nonatomic, strong) UILabel *titleLabel;
// 分割线视图
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic , copy) CGXPickerBaseTopViewCancelBlock cancelBlock;
@property (nonatomic , copy) CGXPickerBaseTopViewSureBlock sureBlock;

- (void)updateWithTopModel:(CGXPickerBaseTopModel *)topModel;

@end

NS_ASSUME_NONNULL_END
