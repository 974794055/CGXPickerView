//
//  CGXPcikerAddressModel.h
//  CGXPickerView-OC
//
//  Created by 曹贵鑫 on 2020/4/19.
//  Copyright © 2020 CGX. All rights reserved.
//

#import "CGXPickerBaseTextModel.h"

NS_ASSUME_NONNULL_BEGIN
@class CGXPcikerAddressModel;
@interface CGXPcikerAddressModel : CGXPickerBaseTextModel

@property (nonatomic , strong) id dataModel;//原始数据源
@property (nonatomic, assign) NSInteger code;// 编码
@property (nonatomic, strong) NSArray<CGXPcikerAddressModel*> *rowArr;

@end


NS_ASSUME_NONNULL_END
