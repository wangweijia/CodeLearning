//
//  SecondViewController.h
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBaseViewController.h"
#import "SecondViewControllerVM.h"
#import "DayScheduleCell.h"
@class Doctor;

@interface SecondViewController : MVVMBaseViewController <DayScheduleCellDelegate>

- (SecondViewControllerVM *)baseVM;

@end
