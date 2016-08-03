//
//  DoctorInfoCellM.h
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface DoctorInfoCellM : NSObject

/**
 *  cell 的高度
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 *  数据模型
 */
@property (nonatomic, strong) Doctor *doctor;

/**
 *  初始化方法
 *
 *  @param doctor 医生信息
 *
 *  @return self
 */
- (instancetype)initWithDoctor:(Doctor *)doctor;

@end
