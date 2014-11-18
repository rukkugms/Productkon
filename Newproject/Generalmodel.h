//
//  Generalmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 21/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Generalmodel : NSObject

@property(strong,nonatomic)NSString *gid;


@property(strong,nonatomic)NSString *Unit;
@property(strong,nonatomic)NSString *SubUnit;

@property(strong,nonatomic)NSString *Equipment;


@property(strong,nonatomic)NSString *ProjectHeader;

@property(strong,nonatomic)NSString *Phase;

@property(strong,nonatomic)NSString *genDescription;

@property(strong,nonatomic)NSString *Quantity;

@property(strong,nonatomic)NSString *TotalHoures;
@property(strong,nonatomic)NSString *PlanId;
@property(strong,nonatomic)NSString *sequence;
@property(strong,nonatomic)NSString *EquipmentHours;
@property(strong,nonatomic)NSString *WorkSlNo;

@end
