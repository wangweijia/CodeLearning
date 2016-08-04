//
//  DaySchedule.m
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DaySchedule.h"
/*
 date = 1470550618333;
 dateInt = 20160807;
 did = 353;
 scheduleCount = 0;
 weekStr = "\U5468\U65e5";
 */

@implementation DaySchedule

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.date = [dic[@"date"] longLongValue];
        self.dateInt = [dic[@"dateInt"] integerValue];
        self.did = [dic[@"did"] integerValue];
        self.scheduleCount = [dic[@"scheduleCount"] integerValue];
        self.weekStr = dic[@"weekStr"];
    }
    return self;
}

+ (NSArray *)DaySchedules:(NSArray *)array {
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [temp addObject:[[DaySchedule alloc] initWithDic:dic]];
    }
    return temp;
}

@end
