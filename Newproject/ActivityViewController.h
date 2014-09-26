//
//  ActivityViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"
#import "FollowupViewController.h"
#import "activityInfo.h"
#import "commentmdl.h"
#import "Validation.h"
#import "FLPViewController.h"
#import "Craftreqmtmdl.h"
@interface ActivityViewController : UIViewController
{
       BOOL recordResults;
    NSString *datetext;
      NSInteger butnidtfr;
    NSInteger poptype;
    NSInteger btnindex;
    UIButton *button;
    NSInteger path;
    NSInteger webtype;
    NSInteger selectedcell;
    UIButton *carbtn;
    //NSInteger poptype;
}
@property(strong,nonatomic)FLPViewController *flpctrl;
@property(strong,nonatomic)Craftreqmtmdl *followmdl;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *resultmsg;
@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;
@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *commentlabel;


@property(strong,nonatomic)IBOutlet UITableView *activityTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *actvityCell;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIView *newviewactivity;
@property(strong,nonatomic)IBOutlet UINavigationItem *activityNav;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
@property(strong,nonatomic)IBOutlet UIView *view2;
@property(strong,nonatomic)FollowupViewController*followupVCtrl;
@property(readwrite)NSInteger leadid;
/*Arrays*/
@property(strong,nonatomic)NSMutableArray*btnArray;

/*butn*/
-(IBAction)addNewActivity:(id)sender;
-(IBAction)deleteActivity:(id)sender;

-(IBAction)closetheView:(id)sender;
-(IBAction)selectDate:(id)sender;
- (IBAction)editcellbtn:(id)sender;
- (IBAction)closeactivity:(id)sender;
- (IBAction)closecomments:(id)sender;
//- (IBAction)disbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disbtnlbl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)NSMutableArray*popoverArray;
/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray *activityArray;
@property(strong,nonatomic)activityInfo *act;



@property(strong,nonatomic)IBOutlet UILabel *activityname;
@property(strong,nonatomic)IBOutlet UILabel *datetext;
@property(strong,nonatomic)IBOutlet UILabel *employee;
@property(strong,nonatomic)IBOutlet UILabel *description;
@property(strong,nonatomic)IBOutlet UILabel *status;
@property(readwrite)  NSInteger activityid;

//*txtfld
@property(strong,nonatomic)IBOutlet UITextField *employerTxtfld;
@property(strong,nonatomic)IBOutlet UITextField *statusTxtFld;
@property(strong,nonatomic)IBOutlet UITextField *activityTxtFld;
@property(strong,nonatomic)IBOutlet UITextView *descptionTextview;
@property(strong,nonatomic)IBOutlet UIButton *activityTypeBtn;
@property(strong,nonatomic)NSMutableArray *activitytypeArray;
-(IBAction)selectActivityType:(id)sender;
-(IBAction)saveActivity:(id)sender;
-(IBAction)cancelaction:(id)sender;

@property (strong, nonatomic)NSIndexPath *Path;


//*commentview

@property (strong, nonatomic) IBOutlet UIView *commentview;
@property (strong, nonatomic) IBOutlet UINavigationBar *cmtnav;
@property (strong, nonatomic) IBOutlet UITableView *cmttable;
@property (strong, nonatomic) IBOutlet UITextView *cmttxtbox;
@property (strong, nonatomic) IBOutlet UIView *composecmtview;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmtcell;
@property (strong, nonatomic) IBOutlet UILabel *titilelbl;

@property (strong, nonatomic) IBOutlet UITextView *commentcellview;


@property(strong,nonatomic)commentmdl *cmtmdl;
@property(strong,nonatomic)NSMutableArray *cmntarray;
@property(strong,nonatomic)NSMutableArray *folloarray;

- (IBAction)Addcmtbtn:(id)sender;
-(IBAction)savecomment:(id)sender;
-(IBAction)cancelcomment:(id)sender;
-(IBAction)tofollowup:(id)sender;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;

@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *savebtnlbl;

-(IBAction)disclosure:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;
@property(strong,nonatomic)NSMutableArray *disclosurearray;


@end
