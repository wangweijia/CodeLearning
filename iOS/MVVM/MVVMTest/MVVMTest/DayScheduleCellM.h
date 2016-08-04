//
//  DayScheduleCellM.h
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DaySchedule.h"

@interface DayScheduleCellM : NSObject

@property (nonatomic, strong) DaySchedule *daySchedule;

@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithDaySchedule:(DaySchedule *)daySchedule;

+ (NSArray<DayScheduleCellM *> *)DayScheduleCellMs:(NSArray<DaySchedule *> *)array;

@end
