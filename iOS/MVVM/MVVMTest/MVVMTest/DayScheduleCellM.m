//
//  DayScheduleCellM.m
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DayScheduleCellM.h"

@implementation DayScheduleCellM

+ (NSArray<DayScheduleCellM *> *)DayScheduleCellMs:(NSArray<DaySchedule *> *)array {
    NSMutableArray *temp = [NSMutableArray array];
    for (DaySchedule *daySchedule in array) {
        [temp addObject:[[DayScheduleCellM alloc] initWithDaySchedule:daySchedule]];
    }
    return temp;
}

- (instancetype)initWithDaySchedule:(DaySchedule *)daySchedule {
    self = [super init];
    if (self) {
        self.daySchedule = daySchedule;
        
        [self updateCellHeight];
    }
    return self;
}

- (void)updateCellHeight {
    self.cellHeight = 44.0;
}

@end
