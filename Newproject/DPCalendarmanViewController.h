//
//  DPCalendarmanViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 03/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPEvntcalViewController.h"
#import "Eventmdl.h"
@interface DPCalendarmanViewController : UINavigationController<UIActionSheetDelegate>{
    BOOL recordResults;
    NSString*olddate;
    NSString*previoustitle;
    NSString*lastdate;
    
    
    
}
@property(strong,nonatomic)Eventmdl*eventmdl;
@property(strong,nonatomic)MPEvntcalViewController * calctrl;
@property(strong,nonatomic)NSDate*previousdate;
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

/*Arrays*/
@property(strong,nonatomic)NSMutableArray *calendararray;
@property(strong,nonatomic)NSMutableArray *datearray;
@property(strong,nonatomic)NSMutableArray *titlearray;
@property(strong,nonatomic)NSMutableArray *sumarray;
@property(strong,nonatomic)NSMutableArray *eventdatearray;
@property(strong,nonatomic)NSMutableArray *alldatearray;
@property(strong,nonatomic)NSMutableDictionary*titledict;
@property(strong,nonatomic)NSMutableArray *alltitlearray;
@property(strong,nonatomic)NSString *comparestring;

@end
