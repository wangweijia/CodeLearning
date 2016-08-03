//
//  DoctorInfoCell.h
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorInfoCellM.h"

@interface DoctorInfoCell : UITableViewCell

/**
 *  cell view 对应的 页面模型
 */
@property (nonatomic, strong) DoctorInfoCellM *doctorInfoCellM;

@end
