//
//  ViewController.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "TimeViewController.h"
#import "CGXPickerStringView.h"

#import "CGXPickerDateView.h"
@interface TimeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView reloadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @"出生年月选择器",
                      @"时间选择器",
                      @"日期和时间",
                      @"倒计时",
                      nil];
    }
    return _dataArray;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView  =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 50;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *title =self.dataArray[indexPath.row];
    
    cell.textLabel.text = title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    
    CGXPickerDateManager *manager  =[[CGXPickerDateManager alloc] init];
    manager.topModel.leftBoderModel.isBorder = NO;
    manager.topModel.leftBoderModel.bgColor = [UIColor whiteColor];
    manager.topModel.leftModel.textColor = [UIColor blackColor];
    
    NSString *title =self.dataArray[indexPath.row];
    //    __weak typeof(self) weakSelf = /self;
    if ([title isEqualToString:@"出生年月选择器"]) {
        NSDate *now = [NSDate date];
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd";
        NSString *nowStr = [fmt stringFromDate:now];
        CGXPickerDateView *popData = [CGXPickerDateView sharedInstance];
        [popData showDatePickerWithDateTitle:@"出生年月" DefaultSelValue:@"2019-06-26" MinDateStr:@"1990-01-01" MaxDateStr:nowStr IsAutoSelect:NO Manager:manager ResultBlock:^(NSString * _Nonnull selectValue) {
            weakSelf.navigationItem.title = selectValue;;
        }];
        
    }else if ([title isEqualToString:@"时间选择器"]){
        CGXPickerDateView *popData = [CGXPickerDateView sharedInstance];
        [popData showDatePickerWithTimeTitle:@"出生时刻" DefaultSelValue:@"06:06" MinDateStr:@"09:22" MaxDateStr:@"23:27" IsAutoSelect:NO Manager:manager ResultBlock:^(NSString * _Nonnull selectValue) {
            weakSelf.navigationItem.title = selectValue;;
        }];
    }else if ([title isEqualToString:@"日期和时间"]){
        CGXPickerDateView *popData = [CGXPickerDateView sharedInstance];
        [popData showDatePickerWithDateAndTimeTitle:@"日期和时间" DefaultSelValue:@"" MinDateStr:@"2019-01-26 09:22" MaxDateStr:@"2019-06-26 19:58" IsAutoSelect:NO Manager:manager ResultBlock:^(NSString * _Nonnull selectValue) {
            weakSelf.navigationItem.title = selectValue;;
        }];
    }else if ([title isEqualToString:@"倒计时"]){
        CGXPickerDateView *popData = [CGXPickerDateView sharedInstance];
        [popData showDatePickerWithDownTimerTitle:@"倒计时" DefaultSelValue:@"15:00" MinDateStr:@"12:00" MaxDateStr:@"23:59" IsAutoSelect:NO Manager:manager ResultBlock:^(NSString * _Nonnull selectValue) {
            weakSelf.navigationItem.title = selectValue;;
        }];
    }
}



@end
