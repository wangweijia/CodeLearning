//
//  MVVMBaseViewController.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBaseViewControllerVM.h"

@interface MVVMBaseViewController : UIViewController

/**
 *  strong vm
 */
@property (nonatomic, strong) MVVMBaseViewControllerVM *baseVM;

@end
