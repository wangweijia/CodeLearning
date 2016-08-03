//
//  DoctorInfoCellM.m
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DoctorInfoCellM.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface DoctorInfoCellM ()

@end

@implementation DoctorInfoCellM

- (instancetype)initWithDoctor:(Doctor *)doctor {
    self = [super init];
    if (self) {
        self.doctor = doctor;
        
        [self bindRAC];
    }
    return self;
}

- (void)bindRAC {
    //监听 doctor 属性变化 || 直接用 doctor 的set方法
    [RACObserve(self, doctor) subscribeNext:^(id x) {
        [self newCellHeight];
    }];
}

- (void)newCellHeight {
    CGFloat baseH = 90.0;
    
    CGFloat labelMaxWidth = [[UIScreen mainScreen] bounds].size.width - 16.0 * 2;
    CGSize constraint = CGSizeMake(labelMaxWidth, 20000.f);
    CGSize fontSize = [_doctor.info boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:17.0] forKey:NSFontAttributeName] context:nil].size;
    CGFloat infoHeight = fontSize.height;
    
    if (infoHeight > 0) {
        self.cellHeight = (baseH + infoHeight + 16.0);
    }else{
        self.cellHeight = baseH;
    }
}

@end
