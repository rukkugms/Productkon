//
//  MPChartcalViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 02/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Eventmdl.h"

@interface DPChartcalViewController : UINavigationController
{
    BOOL recordResults;
    NSString*olddate;
    NSString*lastdate;

}

@property(strong,nonatomic)Eventmdl *eventmdl;

/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

@property(strong,nonatomic)NSDate*previousdate;
@property(strong,nonatomic)NSMutableArray *datearray;
@property(strong,nonatomic)NSMutableArray *phasearry;
@property(strong,nonatomic)NSMutableArray *manpwerarray;
@property(strong,nonatomic)NSMutableArray *calenderarray;
@property(strong,nonatomic)NSMutableArray *eventdatearray;
@property(strong,nonatomic)NSMutableArray *alldatearray;
@property(strong,nonatomic)NSString *comparestring;


@property(strong,nonatomic)NSMutableArray *manarray;

@end
