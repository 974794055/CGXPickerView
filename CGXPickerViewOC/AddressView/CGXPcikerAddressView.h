//
//  CGXPcikerAddressView.h
//  CGXPickerView-OC
//
//  Created by CGX on 2020/1/10.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseView.h"
#import "CGXPickerAddressManager.h"
#import "CGXPcikerAddressModel.h"
NS_ASSUME_NONNULL_BEGIN
/**
 *  @param selectValue     选择的行标题文字
 *  @param selectRow       选择的行标题下标
 */
typedef void(^CGXPcikerAddressResultBlock)(NSMutableArray<CGXPcikerAddressModel *> *selectValue,NSMutableArray *selectRow);

@interface CGXPcikerAddressView : CGXPickerBaseView

/**
 *  CGXPickerStringItemModel : model
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                       IsAuto:(BOOL)isAuto
                      Manager:(nullable CGXPickerAddressManager *)manager
                  ResultBlock:(CGXPcikerAddressResultBlock)resultBlock;

/**
 *  CGXPickerStringItemModel : model
 *  @param dataSource       数组数据源      单行@[@[model , model]]    多行@[@[model , model],@[model , model]]
 *  @param defaultData     默认选中的行   单行@[model]    多行@[model , model]
 *  @param isAuto     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param manager  顶部配置 距离配置
 *  @param resultBlock      选择后的回调
 */
- (void)stringPickerMoreTitle:(NSString *)title
                   DataSource:(NSMutableArray<NSMutableArray<CGXPcikerAddressModel *> *> *)dataSource
                  DefaultData:(NSMutableArray<CGXPcikerAddressModel *> *)defaultData
                       IsAuto:(BOOL)isAuto
                      Manager:(nullable CGXPickerAddressManager *)manager
                  ResultBlock:(CGXPcikerAddressResultBlock)resultBlock;


@end

NS_ASSUME_NONNULL_END
