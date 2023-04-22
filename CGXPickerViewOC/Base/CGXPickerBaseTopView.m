//
//  CGXPickerBaseTopView.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/11.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseTopView.h"

@implementation CGXPickerBaseTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeViews];
    }
    return self;
}

- (void)initializeViews
{
    // 添加左边取消按钮
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.layer.masksToBounds = YES;
    [_leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftBtn];
    // 添加右边确定按钮
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.layer.masksToBounds = YES;
    [_rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rightBtn];
    
    // 添加中间标题按钮
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    // 添加分割线
    _lineView = [[UIView alloc]init];
    [self addSubview:self.lineView];
    [self bringSubviewToFront:self.lineView];
}
#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    if (self.cancelBlock) {
        self.cancelBlock();
    };
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    if (self.sureBlock) {
        self.sureBlock();
    };
}
- (void)updateWithTopModel:(CGXPickerBaseTopModel *)topModel
{
    _titleLabel.frame = CGRectMake(65, 0, CGRectGetWidth(self.frame) - 130, CGRectGetHeight(self.frame));
    _lineView.frame = CGRectMake(0, CGRectGetHeight(self.frame)-0.5, CGRectGetWidth(self.frame), topModel.lineHeight);
    _rightBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - 70, 10, 60, CGRectGetHeight(self.frame)-20);
    _leftBtn.frame = CGRectMake(10, 10, 60, CGRectGetHeight(self.frame)-20);
    
    _lineView.backgroundColor  = topModel.lineViewColor;
    
    
    _titleLabel.text = topModel.middleModel.text;
    _titleLabel.font = topModel.middleModel.textFont;
    _titleLabel.textColor = topModel.middleModel.textColor;
    
    _leftBtn.backgroundColor = topModel.leftBoderModel.bgColor;
    _leftBtn.layer.cornerRadius = topModel.leftBoderModel.cornerRadius;;
    if (topModel.leftBoderModel.isBorder) {
        _leftBtn.layer.borderColor = topModel.leftBoderModel.borderColor.CGColor;
        _leftBtn.layer.borderWidth = topModel.leftBoderModel.borderWidth;
    }
    _leftBtn.titleLabel.font = topModel.leftModel.textFont;
    [_leftBtn setTitleColor:topModel.leftModel.textColor forState:UIControlStateNormal];
    [_leftBtn setTitle:topModel.leftModel.text forState:UIControlStateNormal];
    
    _rightBtn.backgroundColor = topModel.rightBoderModel.bgColor;
    _rightBtn.layer.cornerRadius = topModel.rightBoderModel.cornerRadius;;
    if (topModel.rightBoderModel.isBorder) {
        _rightBtn.layer.borderColor = topModel.rightBoderModel.borderColor.CGColor;
        _rightBtn.layer.borderWidth = topModel.rightBoderModel.borderWidth;
    }
    _rightBtn.titleLabel.font = topModel.rightModel.textFont;
    [_rightBtn setTitleColor:topModel.rightModel.textColor forState:UIControlStateNormal];
    [_rightBtn setTitle:topModel.rightModel.text forState:UIControlStateNormal];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
