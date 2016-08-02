//
//  Doctor.m
//  MVVMTest
//
//  Created by apple on 02/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        self.hospitalName = dic[@"hospitalName"];
        self.doctorId = [dic[@"doctorId"] integerValue];
        self.cityStr = dic[@"cityStr"];
        self.info = dic[@"info"];
    }
    return self;
}

+ (NSArray<Doctor *> *)initWithArray:(NSArray *)array {
    NSMutableArray *newArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        Doctor *temp = [[Doctor alloc] initWithDic:dic];
        [newArray addObject:temp];
    }
    return newArray;
}

@end
