//
//  subcontract.h
//  Newproject
//
//  Created by GMSIndia 2 on 03/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subcontract : NSObject


@property(readwrite)NSInteger contractid;

@property(readwrite)NSInteger custid;
@property(readwrite)NSInteger indemntyflag;
@property(readwrite)NSInteger  labrflag;
@property(readwrite)NSInteger  paymntflag;
@property(readwrite)NSInteger  vlumeflag;

@property(strong,nonatomic)NSString *CustomerName;

@property(strong,nonatomic)NSString *AgreementorContract;

@property(strong,nonatomic)NSString *Number;

@property(strong,nonatomic)NSString *EffectiveDate;

@property(strong,nonatomic)NSString *IndemnityClause;

@property(strong,nonatomic)NSString *Payementclause;

@property(strong,nonatomic)NSString *NetDays;

@property(strong,nonatomic)NSString *VolumeDisClause;

@property(strong,nonatomic)NSString *LabourClause;

@property(strong,nonatomic)NSString *WeeklyHours;

@property(strong,nonatomic)NSString *LabourOverTime;

@property(strong,nonatomic)NSString *ShiftDifferential;

@property(strong,nonatomic)NSString *MinHrs;

@property(strong,nonatomic)NSString *HolidaysPaid;

@property(strong,nonatomic)NSString *SubContractorMarkup;

@property(strong,nonatomic)NSString *SubContractorMarkup1;

@property(strong,nonatomic)NSString *OtherClause;

@property(strong,nonatomic)NSString *ShopWorkPermitted;

@property(strong,nonatomic)NSString *ConsumableBilling;

@property(strong,nonatomic)NSString *SmallToolBilling;

@property(strong,nonatomic)NSString *MarkupId;

@property(strong,nonatomic)NSString *OvertimeMarkupPer;

@property(strong,nonatomic)NSString *EquipmentClause;

@property(strong,nonatomic)NSString *ThirdPartyequipmentMarkup;

@property(strong,nonatomic)NSString *LeaseMarkup;

@property(strong,nonatomic)NSString *RentalMarkup;

@property(strong,nonatomic)NSString *MaterialPurchaseMarkup;

@property(strong,nonatomic)NSString *DeliveryRatesClause;

@property(strong,nonatomic)NSString *SpecialRatesStructure;
@property(strong,nonatomic)NSString *ExpiryDate;
@property(strong,nonatomic)NSString *TempworkerMarkup;


@end
