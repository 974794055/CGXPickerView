//
//  CGXPickerStringView.m
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerStringView.h"
#import "NSString+CGXPickerView.h"
@interface CGXPickerStringView ()<UIPickerViewDelegate,UIPickerViewDataSource>
// 字符串选择器
@property (nonatomic, strong) UIPickerView *pickerView;
// 是否是单列
@property (nonatomic, assign) BOOL isSingleColumn;
//数据源
@property (nonatomic, strong) NSMutableArray<NSMutableArray<CGXPickerStringItemModel *> *> *dataSource;
// 是否开启自动选择
@property (nonatomic, assign) BOOL IsAuto;
@property (nonatomic, copy) CGXPickerStringResultBlock resultBlock;
// 多列选中的项
@property (nonatomic, strong) NSMutableArray<CGXPickerStringItemModel *> *selectedItems;


@property (nonatomic, strong) CGXPickerStringManager *manager;

@end

@implementation CGXPickerStringView

- (void)initializeData
{
    [super initializeData];
    self.dataSource = [NSMutableArray array];
    self.selectedItems  = [NSMutableArray array];
    self.manager = [[CGXPickerStringManager alloc] init];
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
    return _dataSource.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_dataSource[component] count];
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    CGXPickerStringItemModel *itemModel = _dataSource[component][row];
    return itemModel.text;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    CGXPickerStringItemModel *itemModel = _dataSource[component][row];
    self.selectedItems[component] = itemModel;
    // 设置是否自动回调
    if (self.IsAuto) {
        [self resultBlockSure];
    }
    [pickerView reloadAllComponents];
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews){
        if (singleLine.frame.size.height < 1){
            singleLine.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
        }
    }
    //可以通过自定义label达到自定义pickerview展示数据的方式
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel)
    {
        float width = [UIScreen mainScreen].bounds.size.width;
        if (self.dataSource.count==0) {
            width = [UIScreen mainScreen].bounds.size.width;
        } else {
            width = [UIScreen mainScreen].bounds.size.width / self.dataSource.count;
        }
        pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.manager.itemViewH)];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
    }
    pickerLabel.attributedText = [self pickerView:pickerView attributedTitleForRow:row forComponent:component];
    return pickerLabel;
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    CGXPickerStringItemModel *itemModel = self.dataSource[component][row];
    NSString *normalRowString = [self pickerView:pickerView titleForRow:row forComponent:component];
    NSString *selectRowString = [self pickerView:pickerView titleForRow:[pickerView selectedRowInComponent:component] forComponent:component];
    
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:normalRowString];
    [attriStr addAttribute:NSForegroundColorAttributeName value:itemModel.textColor range:NSMakeRange(0, normalRowString.length)];
    [attriStr addAttribute:NSFontAttributeName value:itemModel.textFont range:NSMakeRange(0, normalRowString.length)];
    
    NSMutableAttributedString * attriSelStr = [[NSMutableAttributedString alloc] initWithString:selectRowString];
    [attriSelStr addAttribute:NSForegroundColorAttributeName value:itemModel.textColor range:NSMakeRange(0, selectRowString.length)];
    [attriSelStr addAttribute:NSFontAttributeName value:itemModel.textFont range:NSMakeRange(0, selectRowString.length)];
    
    if (row == [pickerView selectedRowInComponent:component]) {
        return attriSelStr;
    } else {
        return attriStr;
    }
}
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
    if(self.resultBlock) {
        NSMutableArray *selectRowAry = [NSMutableArray array];
        for (int i = 0; i<_dataSource.count; i++) {
            NSArray *arr = _dataSource[i];
            CGXPickerStringItemModel *str = self.selectedItems[i];
            //            [selectRowAry addObject:@([arr indexOfObject:str])];
            [selectRowAry addObject:[NSString stringWithFormat:@"%ld" , [arr indexOfObject:str]]];
        }
        CGXPickerDebugLog(@"%@--%@" ,self.selectedItems,selectRowAry);
        self.resultBlock(self.selectedItems,[selectRowAry copy]);
    }
}


/**
 *  CGXPickerStringItemModel : model
 *  @param defaultValue     默认选中的行   str
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerTitle:(NSString *)title
             DefaultValue:(NSString  *)defaultValue
                   IsAuto:(BOOL)isAuto
                  Manager:(CGXPickerStringManager *__nonnull)manager
              ResultBlock:(CGXPickerStringResultBlock)resultBlock
                    Style:(CGXPickerStringViewStyle)style
{
    NSMutableArray *defaultData = [NSMutableArray array];
    if (![defaultValue isEqualToString:@""]) {
        [defaultData addObject:defaultValue];
    }
    
    NSMutableArray *dataSource = [NSMutableArray array];
    switch (style) {
        case CGXPickerStringViewStyleEducation://学历
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerEducation], nil];
        }
            break;
        case CGXPickerStringViewStyleBlood://血型
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerBlood], nil];
        }
            break;
        case CGXPickerStringViewStyleAnimal://生肖
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerAnimal], nil];
        }
            break;
        case CGXPickerStringViewStyleConstellation://星座
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerConstellation], nil];
        }
            break;
        case CGXPickerStringViewStyleGender:///性别
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerGender], nil];
        }
            break;
        case CGXPickerStringViewStyleWeek:///星期
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerWeek], nil];
        }
            break;
        case CGXPickerStringViewStyleNation://民族
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerNational], nil];
        }
            break;
        case CGXPickerStringViewStyleReligious://宗教
        {
            dataSource = [NSMutableArray arrayWithObjects:[NSString pickerReligion], nil];
        }
            break;
            
        default:
            break;
    }
    
    
    
    [self stringPickerTitle:title DataSource:dataSource DefaultData:defaultData IsAuto:NO Manager:manager ResultBlock:resultBlock];
}
/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[ str , str ]    多行@[@[str , str],@[str , str]]
 *  @param defaultData     默认选中的行   单行@[str]    多行@[ [str , str]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerTitle:(NSString *)title
               DataSource:(NSMutableArray<NSMutableArray<NSString *> *> *)dataSource
              DefaultData:(NSMutableArray<NSString *> *)defaultData
                   IsAuto:(BOOL)isAuto
                  Manager:(CGXPickerStringManager *__nonnull)manager
              ResultBlock:(CGXPickerStringResultBlock)resultBlock
{
    NSMutableArray *dataSourceArr = [NSMutableArray array];
    NSMutableArray *defaultDataArr = [NSMutableArray array];
    
    for (NSMutableArray *strArr in dataSource) {
        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSString *str in strArr) {
            CGXPickerStringItemModel *item = [[CGXPickerStringItemModel alloc] init];
            item.text = str;
            [dataArr addObject:item];
            
            if ([defaultData containsObject:str]) {
                [defaultDataArr addObject:item];
            }
        }
        [dataSourceArr addObject:dataArr];
    }
    if (manager) {
        self.manager = manager;
    }
    [self stringPickerMoreTitle:title DataSource:dataSourceArr DefaultData:defaultDataArr IsAuto:isAuto Manager:self.manager ResultBlock:resultBlock];
}


/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[model , model]    多行@[@[model , model]]
 *  @param defaultData     默认选中的行   单行@[model]    多行@[[model , model]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                   DataSource:(NSMutableArray<NSMutableArray<CGXPickerStringItemModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPickerStringItemModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                  ResultBlock:(CGXPickerStringResultBlock)resultBlock
{
    
    [self stringPickerMoreTitle:title DataSource:dataSource DefaultData:defaultData IsAuto:isAuto Manager:self.manager ResultBlock:resultBlock];
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
                   DataSource:(NSMutableArray<NSMutableArray<CGXPickerStringItemModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPickerStringItemModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                      Manager:(CGXPickerStringManager *__nonnull)manager
                  ResultBlock:(CGXPickerStringResultBlock)resultBlock
{
    manager.topModel.middleModel.text = title;
    
    self.resultBlock = resultBlock;
    [self.dataSource removeAllObjects];
    [self.selectedItems removeAllObjects];
    [self.dataSource addObjectsFromArray:dataSource];
    self.IsAuto = isAuto;
    if (manager) {
        self.manager = manager;
    }
    if (defaultData.count==0) {
        for (int i = 0; i<self.dataSource.count; i++) {
            NSMutableArray *array = self.dataSource[i];
            for (int j = 0; j<array.count; j++) {
                CGXPickerStringItemModel *itemmm = array[j];
                if (j==0) {
                    [self.selectedItems addObject:itemmm];
                }
            }
        };
    } else{
        if (defaultData.count==dataSource.count) {
            self.selectedItems = [NSMutableArray arrayWithArray:defaultData];
        } else{
            return;
        }
    }
    
    [self.pickerView reloadAllComponents];
    CGXPickerDebugLog(@"\n数据源--\n%@\n选择数据源--\n%@" , self.dataSource,self.selectedItems);
    __weak typeof(self) weakSelf = self;
    [self.selectedItems enumerateObjectsUsingBlock:^(CGXPickerStringItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.dataSource[idx] enumerateObjectsUsingBlock:^(id rowItem, NSUInteger rowIdx, BOOL *stop) {
            CGXPickerStringItemModel *smModel = (CGXPickerStringItemModel *)rowItem;
            if (obj == smModel) {
                [weakSelf.pickerView selectRow:rowIdx inComponent:idx animated:NO];
                *stop = YES;
            }
        }];
    }];
    [self updatwWithManager:self.manager];
    [self showWithAnimation:YES];
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
    [self.selectedItems removeAllObjects];
    [self dismissWithAnimation:YES];
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn
{
    [super clickRightBtn];
    [self resultBlockSure];
    [self.dataSource removeAllObjects];
    [self.selectedItems removeAllObjects];
    [self dismissWithAnimation:YES];
}
- (void)didTapBackgroundView
{
    [super didTapBackgroundView];
    [self.dataSource removeAllObjects];
    [self.selectedItems removeAllObjects];
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
