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
#import "LbrFirst.h"
#import "LBSecond.h"
#import "RMLaborMain.h"

@interface RMLaborViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSInteger calendertype;
    NSInteger poptype;
    NSInteger jobsiteindexpath;
    NSDate *startdate;
    NSDate *enddate;
    
    BOOL recordResults;
    
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;

}

@property(strong,nonatomic)RMLaborMain *mainmodel;
@property(strong,nonatomic)LbrFirst *firstmodel;
@property(strong,nonatomic)LBSecond *secmodel;
@property(strong,nonatomic)jobsitemodel *jobmdl;
@property(strong,nonatomic)CKCalendarView *calender;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

@property(strong,nonatomic)NSString *currentdatestring;
@property(strong,nonatomic)NSString *craftitemcode;
@property(strong,nonatomic)NSString *craft;

//IBActions
- (IBAction)clsebtn:(id)sender;
- (IBAction)SelectJobs:(id)sender;
- (IBAction)SelectStartdate:(id)sender;
- (IBAction)SelectEnddate:(id)sender;
- (IBAction)SelectCraft:(id)sender;
- (IBAction)Showdata:(id)sender;
- (IBAction)releaseaction:(id)sender;

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

@property(strong,nonatomic)NSMutableDictionary *craftlistdict;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;




@end
