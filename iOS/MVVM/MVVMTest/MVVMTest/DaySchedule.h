//
//  DaySchedule.h
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 date = 1470550618333;
 dateInt = 20160807;
 did = 353;
 scheduleCount = 0;
 weekStr = "\U5468\U65e5";
 */

@interface DaySchedule : NSObject

#pragma - mark 属性
@property (nonatomic, assign) long long date;

@property (nonatomic, assign) NSInteger dateInt;

@property (nonatomic, assign) NSInteger did;

@property (nonatomic, assign) NSInteger scheduleCount;

@property (nonatomic, copy) NSString *weekStr;

#pragma - mark 方法
- (instancetype)initWithDic:(NSDictionary *)dic;

+ (NSArray<DaySchedule *> *)DaySchedules:(NSArray *)array;

@end
