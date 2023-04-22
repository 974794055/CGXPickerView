//
//  BaseViewController.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor=[UIColor colorWithWhite:0.93 alpha:1];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
//    UIImage *image = [UIImage updateImageWithColor:AppThemeColor toSize:CGSizeMake(ScreenWidth, kTopHeight)];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance * appearance = [[UINavigationBarAppearance alloc] init];
        // 背景色
        appearance.backgroundColor = AppThemeColor;
        // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
        appearance.shadowColor = [UIColor clearColor];
        // 字体颜色、尺寸等
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName:AppMainColor};
        // 带scroll滑动的页面
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        // 常规页面
        self.navigationController.navigationBar.standardAppearance = appearance;
    }
    // iOS 15适配
    if (@available(iOS 15.0, *)) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0) forBarMetrics:UIBarMetricsDefault];
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance setBackgroundColor:AppThemeColor];
        // UINavigationBarAppearance 会覆盖原有的导航栏设置，这里需要重新设置返回按钮隐藏，不隐藏可注释或删掉
        appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffsetMake(-200, 0);
        [[UINavigationBar appearance] setScrollEdgeAppearance:appearance];
        [[UINavigationBar appearance] setStandardAppearance:appearance];
    }
    NSMutableDictionary *attr3=[NSMutableDictionary dictionary];
    attr3[NSForegroundColorAttributeName]=AppMainColor;
    attr3[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    [[UITabBarItem appearance]setTitleTextAttributes:attr3 forState:UIControlStateNormal];
    
    NSMutableDictionary *attr4=[NSMutableDictionary dictionary];
    attr4[NSForegroundColorAttributeName]=AppThemeColor;
    attr4[NSFontAttributeName]=[UIFont systemFontOfSize:12];;
    [[UITabBarItem appearance]setTitleTextAttributes:attr4 forState:UIControlStateSelected];
    if (@available(iOS 13.0, *)) {
        [[UITabBar appearance] setUnselectedItemTintColor:AppMainColor];
        [[UITabBar appearance] setTintColor: AppThemeColor];
    }
    [[UITabBar appearance]  setBackgroundColor:[UIColor whiteColor]];

}
//- (void)showNavTitle:(NSString *)title
//{
//    UILabel *navTitleLabel = ({
//        UILabel *ppLabel = [[UILabel alloc]init];
//        ppLabel.font = APPTextFontBold17;
//        ppLabel.textColor = [UIColor whiteColor];
//        ppLabel.textAlignment = NSTextAlignmentCenter;
//        ppLabel.numberOfLines = 0;
//        ppLabel.layer.masksToBounds = YES;
//        ppLabel.text = title;
//        ppLabel;
//    });
//    navTitleLabel.frame = CGRectMake(0, 0, kScaleSpace(100), 44);
//    self.navigationItem.titleView = navTitleLabel;
//}
//- (void)showProgressHUDInfo:(NSString*)str
//{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.removeFromSuperViewOnHide = YES;
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.bezelView.backgroundColor = [UIColor blackColor];
//    hud.detailsLabel.text = str;
//    hud.detailsLabel.font = APPTextFont14;
//    hud.detailsLabel.textColor = [UIColor whiteColor];
//    hud.contentColor = [UIColor whiteColor];
//    hud.animationType = MBProgressHUDAnimationZoomOut;
//    hud.mode=MBProgressHUDModeIndeterminate;
//    hud.square = NO;
//    [self.view addSubview:hud];
//    [hud showAnimated:YES];
//    [hud hideAnimated:YES afterDelay:1];
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
