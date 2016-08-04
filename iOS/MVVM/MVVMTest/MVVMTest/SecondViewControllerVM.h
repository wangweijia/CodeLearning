//
//  SecondViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "MVVMBaseViewControllerVM.h"
#import "Doctor.h"

@interface SecondViewControllerVM : MVVMBaseViewControllerVM

#pragma - mark 暴露在外属性
/**
 *  医生实体
 */
@property (nonatomic, strong) Doctor *doctor;

#pragma - mark 暴露在流操作
/**
 *  请求医生
 */
@property (nonatomic, strong, readonly) RACCommand *requestDoctors;

/**
 *  医生数据模型 更新的时候
 */
@property (nonatomic, strong, readonly) RACSignal *doctorData;

@end
