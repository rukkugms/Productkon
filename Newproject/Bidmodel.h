//
//  Bidmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bidmodel : NSObject

@property(readwrite)NSInteger idvalue;
@property(strong,nonatomic)NSString *bidid;
@property(strong,nonatomic)NSString *totalamount;
@property(strong,nonatomic)NSString *bidstatus;
@property(strong,nonatomic)NSString *customername;
@property(strong,nonatomic)NSString *mancost;
@property(strong,nonatomic)NSString *matcost;
@property(strong,nonatomic)NSString *eqcost;
@property(strong,nonatomic)NSString *othercost;


@end
