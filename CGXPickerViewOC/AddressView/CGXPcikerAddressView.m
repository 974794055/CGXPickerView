//
//  CGXPcikerAddressView.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPcikerAddressView.h"
#import "NSString+CGXPickerView.h"

@interface CGXPcikerAddressView ()<UIPickerViewDelegate,UIPickerViewDataSource>
// 字符串选择器
@property (nonatomic, strong) UIPickerView *pickerView;
// 是否是单列
@property (nonatomic, assign) BOOL isSingleColumn;
//数据源
@property (nonatomic, strong) NSMutableArray<CGXPcikerAddressModel *> *dataSource;
// 是否开启自动选择
@property (nonatomic, assign) BOOL IsAuto;
@property (nonatomic, copy) CGXPcikerAddressResultBlock resultBlock;
// 多列选中的项
//@property (nonatomic, strong) NSMutableArray<CGXPcikerAddressModel *> *selectedItems;


@property (nonatomic, strong) CGXPickerAddressManager *manager;

@property (nonatomic, assign) NSInteger provinceIndex,citieIndex,areaIndex;

///// 选中的省
//@property (nonatomic, strong) CGXPcikerAddressRowModel *selectedProvince;
///// 选中的市
//@property (nonatomic, strong) CGXPcikerAddressRowModel *selectedCitie;
///// 选中的区
//@property (nonatomic, strong) CGXPcikerAddressRowModel *selectedArea;

@end

@implementation CGXPcikerAddressView

- (void)initializeData
{
    [super initializeData];
    self.dataSource = [NSMutableArray array];
//    self.selectedItems  = [NSMutableArray array];
    self.manager = [[CGXPickerAddressManager alloc] init];
    
    self.provinceIndex = 0;
    self.citieIndex = 0;
    self.areaIndex = 0;
}
- (void)initializeViews
{
    [super initializeViews];
    self.frame = [UIScreen mainScreen].bounds;
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.20];
    _pickerView = [[UIPickerView alloc]init];
    _pickerView.frame = CGRectMake(0, self.manager.topViewH, [UIScreen mainScreen].bounds.size.width, self.alertView.frame.size.height-self.manager.pickerViewH);
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self.alertView addSubview:_pickerView];
    
    [self updatwWithManager:self.manager];
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dataSource.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    CGXPcikerAddressModel *model = self.dataSource[component];
    return model.rowArr.count;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *showTitleValue = @"";
    if (component == 0) {//省
        CGXPcikerAddressModel *mode1 = self.dataSource[self.provinceIndex];
        CGXPcikerAddressModel *mode2 = mode1.rowArr[row];
        showTitleValue = mode2.text;
    }
    if (component == 1) {//市
        CGXPcikerAddressModel *mode1 = self.dataSource[self.provinceIndex];
        CGXPcikerAddressModel *mode2 = mode1.rowArr[self.citieIndex];
        CGXPcikerAddressModel *mode3 = mode2.rowArr[row];
        showTitleValue = mode3.text;
    }
    if (component == 2) {//区
        CGXPcikerAddressModel *mode1 = self.dataSource[self.provinceIndex];
        CGXPcikerAddressModel *mode2 = mode1.rowArr[self.citieIndex];
        CGXPcikerAddressModel *mode3 = mode2.rowArr[self.areaIndex];
        CGXPcikerAddressModel *mode4 = mode3.rowArr[row];
        showTitleValue = mode4.text;
    }
    return showTitleValue;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        self.provinceIndex = row;
        self.citieIndex = 0;
        self.areaIndex = 0;
    } else if (component == 1) {
        self.citieIndex = row;
        self.areaIndex = 0;
    } else if (component == 2) {
        self.areaIndex = row;
    }
    // 滚动到指定行
    [self scrollToRow:self.provinceIndex secondRow:self.citieIndex thirdRow:self.areaIndex];
    
    
//    CGXPcikerAddressModel *itemModel = _dataSource[component][row];
//    self.selectedItems[component] = itemModel;
//    // 设置是否自动回调
//    if (self.IsAuto) {
//        [self resultBlockSure];
//    }
    [pickerView reloadAllComponents];
}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
//    //设置分割线的颜色
//    for(UIView *singleLine in pickerView.subviews){
//        if (singleLine.frame.size.height < 1){
//            singleLine.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
//        }
//    }
//    //可以通过自定义label达到自定义pickerview展示数据的方式
//    UILabel* pickerLabel = (UILabel*)view;
//    if (!pickerLabel)
//    {
//        float width = [UIScreen mainScreen].bounds.size.width;
//        if (self.dataSource.count==0) {
//            width = [UIScreen mainScreen].bounds.size.width;
//        } else {
//            width = [UIScreen mainScreen].bounds.size.width / self.dataSource.count;
//        }
//        pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.manager.itemViewH)];
//        pickerLabel.adjustsFontSizeToFitWidth = YES;
//        pickerLabel.textAlignment = NSTextAlignmentCenter;
//        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
//    }
//    pickerLabel.attributedText = [self pickerView:pickerView attributedTitleForRow:row forComponent:component];
//    return pickerLabel;
//}
//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    CGXPcikerAddressModel *itemModel = self.dataSource[component][row];
//    NSString *normalRowString = [self pickerView:pickerView titleForRow:row forComponent:component];
//    NSString *selectRowString = [self pickerView:pickerView titleForRow:[pickerView selectedRowInComponent:component] forComponent:component];
//
//    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:normalRowString];
//    [attriStr addAttribute:NSForegroundColorAttributeName value:itemModel.textColor range:NSMakeRange(0, normalRowString.length)];
//    [attriStr addAttribute:NSFontAttributeName value:itemModel.textFont range:NSMakeRange(0, normalRowString.length)];
//
//    NSMutableAttributedString * attriSelStr = [[NSMutableAttributedString alloc] initWithString:selectRowString];
//    [attriSelStr addAttribute:NSForegroundColorAttributeName value:itemModel.textColor range:NSMakeRange(0, selectRowString.length)];
//    [attriSelStr addAttribute:NSFontAttributeName value:itemModel.textFont range:NSMakeRange(0, selectRowString.length)];
//
//    if (row == [pickerView selectedRowInComponent:component]) {
//        return attriSelStr;
//    } else {
//        return attriStr;
//    }
//}
// 设置分组的宽
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (self.dataSource.count==0) {
        return [UIScreen mainScreen].bounds.size.width;
    } else {
        return [UIScreen mainScreen].bounds.size.width / self.dataSource.count;;
    }
}
//设置单元格的高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.manager.itemViewH;
}
- (void)resultBlockSure
{
//    if(self.resultBlock) {
//        NSMutableArray *selectRowAry = [NSMutableArray array];
//        for (int i = 0; i<_dataSource.count; i++) {
//            NSArray *arr = _dataSource[i];
//            CGXPcikerAddressModel *str = self.selectedItems[i];
//            [selectRowAry addObject:@([arr indexOfObject:str])];
//        }
//        self.resultBlock(self.selectedItems,[selectRowAry copy]);
//    }
}




/**
 *  CGXPickerStringItemModel : model
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                       IsAuto:(BOOL)isAuto
                      Manager:(nullable CGXPickerAddressManager *)manager
                  ResultBlock:(CGXPcikerAddressResultBlock)resultBlock
{
   [self stringPickerMoreTitle:title DataSource:[NSMutableArray array] DefaultData:[NSMutableArray array] IsAuto:isAuto Manager:manager ResultBlock:resultBlock];
}

/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[model , model]    多行@[@[model , model]]
 *  @param defaultData     默认选中的行   单行@[model]    多行@[[model , model]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                   DataSource:(NSMutableArray<NSMutableArray<CGXPcikerAddressModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPcikerAddressModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                      Manager:(nullable CGXPickerAddressManager *)manager
                  ResultBlock:(CGXPcikerAddressResultBlock)resultBlock
{
   
    self.resultBlock = resultBlock;
    [self.dataSource removeAllObjects];
//    [self.selectedItems removeAllObjects];
//    [self.dataSource addObjectsFromArray:dataSource];
    self.IsAuto = isAuto;
    if (manager) {
        self.manager.topModel.middleModel.text = title;
        self.manager = manager;
    } else{
        self.manager.topModel.middleModel.text = title;
    }
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0; i<3; i++) {
        
        CGXPcikerAddressModel *mode1 = [[CGXPcikerAddressModel alloc] init];
        mode1.text = [NSString stringWithFormat:@"哈哈-%d",i];
        NSMutableArray *array2 = [NSMutableArray array];
        for (int j = 0; j<5; j++) {
            CGXPcikerAddressModel *mode2 = [[CGXPcikerAddressModel alloc] init];
            mode2.text = [NSString stringWithFormat:@"娃娃-%d",j];
            
            NSMutableArray *array3 = [NSMutableArray array];
            for (int k = 0;k<4; k++) {
                CGXPcikerAddressModel *mode3 = [[CGXPcikerAddressModel alloc] init];
                mode3.text = [NSString stringWithFormat:@"人人-%d",k];
                [array3 addObject:mode3];
            };
            mode2.rowArr = array3;
            [array2 addObject:mode2];
        };
        mode1.rowArr = array2;
        [array1 addObject:mode1];
    };
    [self.dataSource addObjectsFromArray:array1];
//    NSLog(@"dataSource:%@" , self.dataSource);
//    if (defaultData.count==0) {
//        for (int i = 0; i<self.dataSource.count; i++) {
//            NSMutableArray *array = self.dataSource[i];
//            for (int j = 0; j<array.count; j++) {
//                CGXPcikerAddressModel *itemmm = array[j];
//                if (j==0) {
//                    [self.selectedItems addObject:itemmm];
//                }
//            }
//        };
//    } else{
//        if (defaultData.count==dataSource.count) {
//            self.selectedItems = [NSMutableArray arrayWithArray:defaultData];
//        } else{
//            return;
//        }
//    }
//
    [self.pickerView reloadAllComponents];
//    NSLog(@"\n数据源--\n%@\n选择数据源--\n%@" , self.dataSource,self.selectedItems);
//    __weak typeof(self) weakSelf = self;
//    [self.selectedItems enumerateObjectsUsingBlock:^(CGXPcikerAddressModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [weakSelf.dataSource[idx] enumerateObjectsUsingBlock:^(id rowItem, NSUInteger rowIdx, BOOL *stop) {
//            CGXPcikerAddressModel *smModel = (CGXPcikerAddressModel *)rowItem;
//            if (obj == smModel) {
//                [weakSelf.pickerView selectRow:rowIdx inComponent:idx animated:NO];
//                *stop = YES;
//            }
//        }];
//    }];
    [self updatwWithManager:self.manager];
    [self showWithAnimation:YES];
}

#pragma mark - 滚动到指定行
- (void)scrollToRow:(NSInteger)firstRow secondRow:(NSInteger)secondRow thirdRow:(NSInteger)thirdRow {
    if (firstRow < self.dataSource.count) {
        self.provinceIndex = firstRow;
        CGXPcikerAddressModel *provinceModel = self.dataSource[firstRow];
        if (self.dataSource.count == 2) {
            if (secondRow < provinceModel.rowArr.count) {
                self.citieIndex = secondRow;
                [self.pickerView reloadComponent:1];
            }
        }
        if (self.dataSource.count == 3) {
            if (secondRow < provinceModel.rowArr.count) {
                self.citieIndex = secondRow;
                [self.pickerView reloadComponent:1];
                CGXPcikerAddressModel *cityModel = provinceModel.rowArr[secondRow];
                if (thirdRow < cityModel.rowArr.count) {
                    self.areaIndex = thirdRow;
                    [self.pickerView selectRow:firstRow inComponent:0 animated:YES];
                    [self.pickerView selectRow:secondRow inComponent:1 animated:YES];
                    [self.pickerView reloadComponent:2];
                    [self.pickerView selectRow:thirdRow inComponent:2 animated:YES];
                }
            }
        }
    }

//    // 是否自动滚动回调
//    if (/* DISABLES CODE */ (false)) {
//        NSArray *arr = [self getChooseCityArr];
//        NSMutableArray *rowAry = [NSMutableArray array];
//        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfProvince]];
//        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfCity]];
//        [rowAry addObject:[NSString stringWithFormat:@"%ld",rowOfTown]];
//        if (self.resultBlock != nil) {
//            self.resultBlock(arr,rowAry);
//        }
//    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pickerView.frame = CGRectMake(0, self.manager.topViewH, [UIScreen mainScreen].bounds.size.width, self.manager.pickerViewH);
    [self updatwWithManager:self.manager];
    
}
#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn
{
    [super clickLeftBtn];
    [self.dataSource removeAllObjects];
//    [self.selectedItems removeAllObjects];
    [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn
{
    [super clickRightBtn];
    [self resultBlockSure];
    [self.dataSource removeAllObjects];
//    [self.selectedItems removeAllObjects];
    [self dismissWithAnimation:YES];
}
- (void)didTapBackgroundView
{
    [super didTapBackgroundView];
    [self.dataSource removeAllObjects];
//    [self.selectedItems removeAllObjects];
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
