//
//  DPCalendarTestViewController.h
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalEventDetailViewController.h"
#import "Eventmdl.h"
@interface DPCalendarTestViewController : UINavigationController<UIActionSheetDelegate>{
    BOOL recordResults;
    NSString*olddate;
    NSString*previoustitle;
    NSString*lastdate;
   
    

}
@property(strong,nonatomic)Eventmdl*eventmdl;
@property(strong,nonatomic)CalEventDetailViewController * calctrl;
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
@end
