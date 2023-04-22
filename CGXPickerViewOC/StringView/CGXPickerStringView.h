//
//  CGXPickerStringView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseView.h"
#import "CGXPickerStringItemModel.h"
#import "CGXPickerStringManager.h"
#import "CGXPickerCommon.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  @param selectValue     选择的行标题文字
 *  @param selectRow       选择的行标题下标
 */
typedef void(^CGXPickerStringResultBlock)(NSMutableArray<CGXPickerStringItemModel *> *selectValue,NSMutableArray *selectRow);

@interface CGXPickerStringView : CGXPickerBaseView

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
                    Style:(CGXPickerStringViewStyle)style;

/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[@[ str , str ]]    多行@[@[str , str],@[str , str]]
 *  @param defaultData     默认选中的行   单行@[str]    多行@ [str , str]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerTitle:(NSString *)title
               DataSource:(NSMutableArray<NSMutableArray<NSString *> *> *)dataSource
              DefaultData:(NSMutableArray<NSString *> *)defaultData
                   IsAuto:(BOOL)isAuto
                  Manager:(CGXPickerStringManager *__nonnull)manager
              ResultBlock:(CGXPickerStringResultBlock)resultBlock;


/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[@[model , model]]    多行@[@[model , model],@[model , model]]
 *  @param defaultData     默认选中的行   单行@[model]    多行@[model , model]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                   DataSource:(NSMutableArray<NSMutableArray<CGXPickerStringItemModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPickerStringItemModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                  ResultBlock:(CGXPickerStringResultBlock)resultBlock;

/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[@[model , model]]    多行@[@[model , model],@[model , model]]
 *  @param defaultData     默认选中的行   单行@[model]    多行@[model , model]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                   DataSource:(NSMutableArray<NSMutableArray<CGXPickerStringItemModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPickerStringItemModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                      Manager:(CGXPickerStringManager *__nonnull)manager
                  ResultBlock:(CGXPickerStringResultBlock)resultBlock;

@end

NS_ASSUME_NONNULL_END
