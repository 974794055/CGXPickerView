//
//  ViewController.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "AddressViewController.h"
#import "CGXPickerViewOC.h"

@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView reloadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @"省,市,县",
                      @"省,市",
                      @"省",
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
    
    CGXPickerStringManager *manager  =[[CGXPickerStringManager alloc] init];
    manager.topModel.leftBoderModel.isBorder = NO;
    manager.topModel.leftBoderModel.bgColor = [UIColor whiteColor];
    manager.topModel.leftModel.textColor = [UIColor blackColor];
    
    NSString *title =self.dataArray[indexPath.row];
    //    __weak typeof(self) weakSelf = /self;
    if ([title isEqualToString:@"省,市,县"]){
        //        self.manager.isHaveLimit = YES;
        
        CGXPcikerAddressView *popddd = [CGXPcikerAddressView sharedInstance];

        [popddd stringPickerMoreTitle:@"请选择你的城市" IsAuto:NO Manager:nil ResultBlock:^(NSMutableArray<CGXPcikerAddressModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
                    
        }];
    
//    [popddd str
//                [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@4, @0,@0] IsAuto:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
//                    NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
//                    weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@%@%@", selectAddressArr[0], selectAddressArr[1],selectAddressArr[2]];;;;
//                }];
    }else if ([title isEqualToString:@"省,市"]){
        //        [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@0,@0] IsAuto:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
        //            NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
        //            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@%@", selectAddressArr[0], selectAddressArr[1]];
        //        }];
    }else if ([title isEqualToString:@"省"]){
        //        [CGXPickerView showAddressPickerWithTitle:@"请选择你的城市" DefaultSelected:@[@0] IsAuto:YES Manager:nil ResultBlock:^(NSArray *selectAddressArr, NSArray *selectAddressRow) {
        //            NSLog(@"%@-%@",selectAddressArr,selectAddressRow);
        //            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", selectAddressArr[0]];
        //        }];
    }
    
}



@end
