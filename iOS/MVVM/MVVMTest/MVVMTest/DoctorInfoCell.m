//
//  DoctorInfoCell.m
//  MVVMTest
//
//  Created by apple on 03/08/2016.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DoctorInfoCell.h"

@interface DoctorInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *city;

@property (weak, nonatomic) IBOutlet UILabel *hostital;

@property (weak, nonatomic) IBOutlet UILabel *info;

@end

@implementation DoctorInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDoctorInfoCellM:(DoctorInfoCellM *)doctorInfoCellM {
    _doctorInfoCellM = doctorInfoCellM;
    
    self.name.text = doctorInfoCellM.doctor.name;
    self.city.text = doctorInfoCellM.doctor.cityStr;
    self.hostital.text = doctorInfoCellM.doctor.hospitalName;
    self.info.text = doctorInfoCellM.doctor.info;
}

@end
