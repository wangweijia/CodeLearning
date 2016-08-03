//
//  FirstViewController.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMBaseViewController.h"
#import "FirstViewControllerVM.h"

@interface FirstViewController : MVVMBaseViewController

@property (nonatomic, weak) FirstViewControllerVM *firstViewControllerVM;

@end
