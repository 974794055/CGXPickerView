//
//  ViewController.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "ViewController.h"
#import "CGXPickerStringView.h"

#import "CGXPickerDateView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    [self.tableView reloadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:
                      @"自定义一行",
                      @"自定义二行",
                      @"教育",
                      @"血型",
                      @"星座",
                      @"生肖",
                      @"性别",
                      @"民族",
                      @"宗教",
                      @"星期",
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
    if ([title isEqualToString:@"自定义一行"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:@"时间" DataSource:[NSMutableArray arrayWithObjects:@[@"哈哈1",@"哈哈2",@"哈哈3",@"哈哈4",@"哈哈5",@"哈哈6",@"哈哈7",@"哈哈8",@"哈哈9",@"哈哈0"], nil] DefaultData:[NSMutableArray arrayWithObjects:@"哈哈5", nil] IsAuto:YES Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        }];
    }else if ([title isEqualToString:@"自定义二行"]){
        
        NSMutableArray *selectData = [NSMutableArray array];
        NSMutableArray *defaultData = [NSMutableArray array];
        
        NSMutableArray *array1 = [NSMutableArray array];
        
        for (int i = 0; i<10; i++) {
            CGXPickerStringItemModel *item = [[CGXPickerStringItemModel alloc] init];
            item.text = [NSString stringWithFormat:@"哈--%d",i];
            [array1 addObject:item];
            if (i==1) {
                [defaultData addObject:item];
            }
        }
        [selectData addObject:array1];
        NSMutableArray *array2 = [NSMutableArray array];
        for (int i = 0; i<10; i++) {
            CGXPickerStringItemModel *item = [[CGXPickerStringItemModel alloc] init];
            item.text = [NSString stringWithFormat:@"哇--%d",i];
            [array2 addObject:item];
            if (i==2) {
                [defaultData addObject:item];
            }
        }
        
        [selectData addObject:array2];
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerMoreTitle:@"时间" DataSource:selectData DefaultData:defaultData IsAuto:YES ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            
            NSMutableString *titleStr = [[NSMutableString alloc]init];;
            for (CGXPickerStringItemModel *itemMOdel in selectValue) {
                [titleStr appendString:itemMOdel.text];
                [titleStr appendString:@" "];
            }
            weakSelf.navigationItem.title = titleStr;
        }];
    }else if ([title isEqualToString:@"教育"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"本科" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleEducation];
    } else if ([title isEqualToString:@"血型"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleBlood];
    }   else if ([title isEqualToString:@"星座"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleConstellation];
    }   else if ([title isEqualToString:@"生肖"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleAnimal];
    } else if ([title isEqualToString:@"性别"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleGender];
    }else if ([title isEqualToString:@"民族"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleNation];
        
    }else if ([title isEqualToString:@"宗教"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleReligious];
        
    }else if ([title isEqualToString:@"星期"]){
        CGXPickerStringView *Pop = [CGXPickerStringView sharedInstance];
        [Pop stringPickerTitle:title DefaultValue:@"" IsAuto:NO Manager:manager ResultBlock:^(NSMutableArray<CGXPickerStringItemModel *> * _Nonnull selectValue, NSMutableArray * _Nonnull selectRow) {
            CGXPickerStringItemModel *itemM  = [selectValue firstObject];
            weakSelf.navigationItem.title = [NSString stringWithFormat:@"%@", itemM.text];
        } Style:CGXPickerStringViewStyleWeek];
    }
    
}



@end
