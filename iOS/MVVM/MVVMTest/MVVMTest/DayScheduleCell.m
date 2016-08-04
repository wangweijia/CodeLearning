//
//  DayScheduleCell.m
//  MVVMTest
//
//  Created by apple on 04/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DayScheduleCell.h"

@interface DayScheduleCell ()

@property (weak, nonatomic) IBOutlet UILabel *weak;

@property (weak, nonatomic) IBOutlet UILabel *count;

@end

@implementation DayScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDayScheduleCellM:(DayScheduleCellM *)dayScheduleCellM {
    _dayScheduleCellM = dayScheduleCellM;
    
    self.weak.text = dayScheduleCellM.daySchedule.weekStr;
    self.count.text = [@(dayScheduleCellM.daySchedule.scheduleCount) stringValue];
}

@end
