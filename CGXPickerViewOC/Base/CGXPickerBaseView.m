//
//  CGXPickerBaseView.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseView.h"
#import "CGXPickerBaseTopView.h"
#import <objc/runtime.h>

///NavBar高度
#define CGXPickerBaseViewStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
///tab安全区域
#define CGXPickerBaseViewSafeHeight    ((CGXPickerBaseViewStatusBarHeight>20) ? 34.0f : 0.0f)


@interface CGXPickerBaseView()

// 顶部视图
@property (nonatomic, strong) CGXPickerBaseTopView *topView;

@property (nonatomic, strong) CGXPickerBaseManager *baseManager;

@end

@implementation CGXPickerBaseView

/** 单例对象 */
//+ (instancetype)sharedInstance {
//    // 获取当前对象的类
//    Class selfClass = [self class];
//    // 从类中获取对象
//    id instance = objc_getAssociatedObject(selfClass, @"sharedInstance");
//    if (!instance) {
//        // 不存在，创建对象
//        instance = [[super allocWithZone:NULL] init];
//        // 给类绑定对象
//        objc_setAssociatedObject(selfClass, @"sharedInstance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }
//    return instance;
//}
//
///** 保证alloc、init也创建同样的对象 */
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    // 获取当前对象的类
//    Class class = [self class];
//    // 返回当前类绑定的对象
//    return [class sharedInstance];
//}
//

+ (instancetype)sharedInstance {
    id sharedInstance = objc_getAssociatedObject(self, @"CGXPickerSharedInstance");
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL] init];
        objc_setAssociatedObject(self, @"CGXPickerSharedInstance", sharedInstance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return [[self class] sharedInstance];
}

//static CGXPickerBaseView *_instance = nil;
//+ (instancetype)sharedInstance
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [[super alloc] init];
//    });
//    return _instance;
//}
//+(instancetype)allocWithZone:(struct _NSZone *)zone{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super allocWithZone:zone];
//    });
//    return _instance;
//}
//-(id)copyWithZone:(NSZone *)zone{
//    return _instance;
//}
//-(id)mutableCopyWithZone:(NSZone *)zone{
//    return _instance;
//}
//+ (instancetype)alloc {
//    NSCAssert(!_instance, @"_instance类只能初始化一次");
//    //如果已经初始化了
//    if (_instance) {
//        NSException *exception = [NSException exceptionWithName:@"提示" reason:@"CGXTencentManager类只能初始化一次,使用[CGXTencentManager shareTencentManager]调用" userInfo:nil];
//        [exception raise];
//    }
//    return [super alloc];
//}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeData];
        [self initializeViews];
    }
    return self;
}
- (void)dealloc
{
    
}
- (void)initializeData
{
    
}
- (void)initializeViews
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.20];
    __weak typeof(self) weakSelf = self;
    // 背景遮罩图层
    UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapBackgroundView:)];
    [self addGestureRecognizer:myTap];
    
    // 弹出视图
    _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.baseManager.topViewH-self.baseManager.pickerViewH-CGXPickerBaseViewSafeHeight, [UIScreen mainScreen].bounds.size.width, self.baseManager.pickerViewH+self.baseManager.topViewH+CGXPickerBaseViewSafeHeight)];
    _alertView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.alertView];
    
    // 设置弹出视图子视图
    // 添加顶部标题栏
    _topView =[[CGXPickerBaseTopView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.baseManager.topViewH)];
    _topView.backgroundColor = RGB_HEX(0xFDFDFD, 1.0f);
    [self.alertView addSubview:self.topView];
    _topView.cancelBlock = ^{
        [weakSelf clickLeftBtn];
    };
    _topView.sureBlock = ^{
        [weakSelf clickRightBtn];
    };
}

- (void)updatwWithManager:(CGXPickerBaseManager *)manager
{
    self.baseManager = manager;
    self.alertView.frame= CGRectMake(0, [UIScreen mainScreen].bounds.size.height - self.baseManager.topViewH-self.baseManager.pickerViewH-CGXPickerBaseViewSafeHeight, [UIScreen mainScreen].bounds.size.width, self.baseManager.topViewH+self.baseManager.pickerViewH+CGXPickerBaseViewSafeHeight);
    self.topView.frame= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.baseManager.topViewH);
    [self.topView updateWithTopModel:self.baseManager.topModel];
}
#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    //1. 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (animation) {
        CGRect rect = self.alertView.frame;
        rect.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.alertView.frame = rect;
        // 浮现动画
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.alertView.frame;
            rect.origin.y -= self.baseManager.pickerViewH+self.baseManager.topViewH;
            self.alertView.frame = rect;
        }];
    }
}

#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation {
    // 关闭动画
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.alertView.frame;
        rect.origin.y += self.baseManager.pickerViewH+self.baseManager.topViewH;;
        self.alertView.frame = rect;
    } completion:^(BOOL finished) {
//        [self.alertView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

#pragma mark - 点击背景遮罩图层事件
- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
    [self dismissWithAnimation:YES];
}
- (void)didTapBackgroundView
{
    
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
