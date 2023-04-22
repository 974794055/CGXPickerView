//
//  CGXPickerBaseView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXPickerCommon.h"
#import "CGXPickerBaseTopModel.h"
#import "CGXPickerBaseManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXPickerBaseView : UIView
+ (instancetype)sharedInstance;


- (void)updatwWithManager:(CGXPickerBaseManager *)manager NS_REQUIRES_SUPER;


- (void)initializeData NS_REQUIRES_SUPER;

- (void)initializeViews NS_REQUIRES_SUPER ;

- (void)didTapBackgroundView NS_REQUIRES_SUPER;

// 弹出视图
@property (nonatomic, strong) UIView *alertView;


#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation;
#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation;

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn NS_REQUIRES_SUPER;

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn NS_REQUIRES_SUPER;

    
@end

NS_ASSUME_NONNULL_END
