//
//  FirstViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMBaseViewControllerVM.h"
#import "DoctorInfoCellM.h"
#import "Doctor.h"
@class FirstViewController;

@interface FirstViewControllerVM : MVVMBaseViewControllerVM <UITableViewDataSource>

#pragma - mark 暴露在外的数据
/**
 *  TableView 数据源
 */
@property (nonatomic, strong) NSArray<DoctorInfoCellM *> *dataSourceCellsArray;

#pragma - mark 与 vc 通信的功能
/**
 *  请求医生
 */
@property (nonatomic, strong, readonly) RACCommand *requestDoctors;

/**
 *  cell 点击
 */
@property (nonatomic, strong, readonly) RACCommand *cellSelected;

- (FirstViewController *)targetVC;

@end
