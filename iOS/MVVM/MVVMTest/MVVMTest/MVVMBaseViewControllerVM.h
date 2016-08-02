//
//  MVVMBaseViewControllerVM.h
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MVVMBaseViewControllerVM : NSObject

/**
 *  weak target ViewController
 */
@property (nonatomic, weak) UIViewController *targetVC;

@end
