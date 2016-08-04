//
//  DayScheduleCell.h
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayScheduleCellM.h"

@protocol DayScheduleCellDelegate;

@interface DayScheduleCell : UITableViewCell

@property (nonatomic, weak) id<DayScheduleCellDelegate> delegate;

@property (nonatomic, strong) DayScheduleCellM *dayScheduleCellM;

@end

@protocol DayScheduleCellDelegate <NSObject>

- (void)weakCellDidSelected:(DayScheduleCell *)cell;

@end