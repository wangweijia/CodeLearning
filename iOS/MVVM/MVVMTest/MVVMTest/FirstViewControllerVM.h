//
//  FirstViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MVVMBaseViewControllerVM.h"
#import "Doctor.h"

@interface FirstViewControllerVM : MVVMBaseViewControllerVM <UITableViewDataSource>

/**
 *  请求医生
 */
@property (nonatomic, strong, readonly) RACCommand *requestDoctors;

@end
