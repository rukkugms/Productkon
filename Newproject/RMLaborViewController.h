//
//  RMLaborViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 06/01/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCalendarView.h"
#import "jobsitemodel.h"

@interface RMLaborViewController : UIViewController
{
    NSInteger calendertype;
    NSInteger poptype;
    BOOL recordResults;
}

@property(strong,nonatomic)jobsitemodel *jobmdl;
@property(strong,nonatomic)CKCalendarView *calender;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

//IBActions
- (IBAction)clsebtn:(id)sender;
- (IBAction)SelectJobs:(id)sender;
- (IBAction)SelectStartdate:(id)sender;
- (IBAction)SelectEnddate:(id)sender;
- (IBAction)SelectCraft:(id)sender;

//IBOutlets
@property (strong, nonatomic) IBOutlet UIButton *jobbtn;
@property (strong, nonatomic) IBOutlet UIButton *startdatebtn;
@property (strong, nonatomic) IBOutlet UIButton *enddatebtn;
@property (strong, nonatomic) IBOutlet UIButton *craftbtn;

@property(strong,nonatomic)IBOutlet UIView *maintabletitleview;
@property (strong, nonatomic) IBOutlet UIView *dropview;

@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

@property(strong,nonatomic)NSMutableArray*jobarray;
@property(strong,nonatomic)NSMutableArray*jobmdlarray;
@property(strong,nonatomic)NSMutableArray*Craftlistarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;




@end
