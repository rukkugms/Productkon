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
//#import "DragFirstmodel.h"
//#import "DrsgSecmdl.h"
#import "RMLaborMain.h"

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

@property(strong,nonatomic)IBOutlet UITableView *maintableview;
@property(strong,nonatomic)IBOutlet UITableView *firstdgtable;
@property(strong,nonatomic)IBOutlet UITableView *secdgtable;

//Main table
@property (strong, nonatomic) IBOutlet UILabel *craftlabel;
@property (strong, nonatomic) IBOutlet UILabel *declabel;
@property (strong, nonatomic) IBOutlet UILabel *requiredlabel;
@property (strong, nonatomic) IBOutlet UILabel *filledlabel;
@property (strong, nonatomic) IBOutlet UILabel *balancelabel;

//Firstdgcell
@property (strong, nonatomic) IBOutlet UILabel *Firstnamelabel;
@property (strong, nonatomic) IBOutlet UILabel *secnamelabel;


//Secdgcell
@property (strong, nonatomic) IBOutlet UILabel *flabel;
@property (strong, nonatomic) IBOutlet UILabel *Llabel;
@property (strong, nonatomic) IBOutlet UILabel *Dgcraftlabel;
@property (strong, nonatomic) IBOutlet UILabel *assigndatelabel;

@property(strong,nonatomic)IBOutlet UITableViewCell *maincell;
@property(strong,nonatomic)IBOutlet UITableViewCell *fdgcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *Sdgcell;


@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

@property(strong,nonatomic)NSMutableArray*jobarray;
@property(strong,nonatomic)NSMutableArray*jobmdlarray;
@property(strong,nonatomic)NSMutableArray*firstdgarray;
@property(strong,nonatomic)NSMutableArray *secdgarray;
@property(strong,nonatomic)NSMutableArray *craftlistarray;
@property(strong,nonatomic)NSMutableArray *mainlistarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;




@end
