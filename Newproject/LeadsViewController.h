//
//  LeadsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ActivityViewController.h"
#import "FollowupViewController.h"
#import "Infoleads.h"
#import "CommentsViewController.h"
#import "commentmdl.h"
#import "Validation.h"
#import "Rightscheck.h"
#import "IndustrytpeViewController.h"
#import "NLProjecttypeViewController.h"
#import "STViewController.h"
#import "LdtypViewController.h"
#import "Craftreqmtmdl.h"
@interface LeadsViewController : UIViewController<UIActionSheetDelegate>{
    NSInteger poptype;
    BOOL recordResults;
    NSInteger butnidtfr;
    UIButton *button;
    NSInteger btnindex;
    NSInteger webtype;
    NSInteger path;
    NSString *phonenostring;
    NSInteger fmt;
    NSString *leadstg,*prjcttypestg,*industrystg,*statustype;
    NSString *empid;
    NSString *empname;
  }
@property(strong,nonatomic)IndustrytpeViewController *industryctl;
@property(strong,nonatomic)STViewController *statusctrl;
@property(strong,nonatomic)LdtypViewController *typctrl;
@property(strong,nonatomic)NLProjecttypeViewController *projectctl;
@property(strong,nonatomic)NSString *stateid;
@property(strong,nonatomic)NSString *msgstring;
@property(readwrite)  NSInteger leadID;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *phonenofmtstring;
@property(strong,nonatomic)IBOutlet UITableView *leadTable;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
// for LeadCustomCell
@property(strong,nonatomic)IBOutlet UILabel *leadName;
@property(strong,nonatomic)IBOutlet UILabel *Location;
@property(strong,nonatomic)IBOutlet UILabel *Contract;
@property(strong,nonatomic)IBOutlet UILabel *EmailId;
@property(strong,nonatomic)IBOutlet UILabel *IndustryType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectExecution;

@property(strong,nonatomic)IBOutlet UITableViewCell *leadsTablecell;
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;

@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imgview;
@property(strong,nonatomic)NSMutableArray*popoverArray;
@property(strong,nonatomic)NSMutableArray*btnArray;

@property(strong,nonatomic)ActivityViewController*activityVCtrl;

@property(strong,nonatomic)FollowupViewController*followupVCtrl;

@property(strong,nonatomic)CommentsViewController*cmtsVCtrl;
@property (strong, nonatomic) IBOutlet UIView *view2;

@property (strong, nonatomic) IBOutlet UINavigationItem *navbaritem;

@property (strong, nonatomic) IBOutlet UIView *view3;


@property (strong, nonatomic) IBOutlet UIButton *editbtncelllbl;

@property (strong, nonatomic) IBOutlet UIButton *disclsurelbl;

@property (strong, nonatomic)NSIndexPath *Path;
/*connections in EDIT VIEW*/

@property (strong, nonatomic) IBOutlet UITextField *cmpnynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contactnametxtfld;

@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UIButton *leadtypebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *projecttype;
@property (strong, nonatomic) IBOutlet UITextField *prjctyeartxtfld;

@property (strong, nonatomic) IBOutlet UITextView *prjctdscptntxtfld;

@property (strong, nonatomic) IBOutlet UITextField *locationtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contacttiletxtfld;
@property (strong, nonatomic) IBOutlet UITextField *emailidtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *statebutton;
@property (strong, nonatomic) IBOutlet UITextField *leadassigntotextfld;
@property (strong, nonatomic) IBOutlet UIButton *industrytypetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *prjctexcutntxtfld;
@property(strong,nonatomic)IBOutlet UIButton *leadstatusBtn;
@property(strong,nonatomic)IBOutlet UIButton *companybtn;
@property (strong, nonatomic)commentmdl*cmtmdl;
@property (strong, nonatomic) UIBarButtonItem*Editbtn;
- (IBAction)Addbtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)editcellbtn:(id)sender;
- (IBAction)disclosurebtn:(id)sender;

- (IBAction)leadtypebtn:(id)sender;
- (IBAction)prjcttypebtn:(id)sender;
- (IBAction)industrytypetxtfld:(id)sender;
-(IBAction)selectLeadStatus:(id)sender;
- (IBAction)prjctexcnbtn:(id)sender;
- (IBAction)selectstate:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)selectcompany:(id)sender;
- (IBAction)closecomments:(id)sender;


-(IBAction)closeleadpage:(id)sender;
-(IBAction)addnewlead:(id)sender;
-(IBAction)deletelead:(id)sender;


@property(readwrite)NSInteger frmplan;
@property(strong,nonatomic)NSString *planorganztn;

/*Arrays*/
@property(strong,nonatomic)NSMutableArray*CommentsArray;
@property(strong,nonatomic)NSMutableArray*leadinfoArray;
@property (strong, nonatomic)NSMutableArray*leadtypeArray;
@property (strong, nonatomic)NSMutableArray*projecttypeArray;
@property (strong, nonatomic)NSMutableArray*industrytypeArray;
@property (strong, nonatomic)NSMutableArray*prjctexcutnArray;
@property(strong,nonatomic)NSMutableArray *leadStatusArray;
@property(strong,nonatomic)NSMutableArray *companylistArray;
@property(strong,nonatomic)NSMutableArray *statearray;
/*dict*/
@property(strong,nonatomic)NSMutableDictionary *companydict;
@property(strong,nonatomic)NSMutableDictionary *statedict;
@property(strong,nonatomic)NSMutableDictionary *reversedict;

@property(strong,nonatomic)NSMutableDictionary *projcttypedict;
@property(strong,nonatomic)NSMutableDictionary *industrytypedict;
@property(strong,nonatomic)NSMutableDictionary *leadStatusdict;
@property(strong,nonatomic)NSMutableDictionary *leadtypedict;


@property(strong,nonatomic)NSMutableString *companystring;
/*models */
@property(strong,nonatomic)Infoleads*infoleads;


/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;

/*Commentsview*/
@property (strong, nonatomic) IBOutlet UIView *commentview;
@property (strong, nonatomic) IBOutlet UINavigationBar *cmtnav;
@property (strong, nonatomic) IBOutlet UITableView *cmttable;
@property (strong, nonatomic) IBOutlet UITextView *cmttxtbox;
@property (strong, nonatomic) IBOutlet UIView *composecmtview;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmtcell;
@property (strong, nonatomic) IBOutlet UILabel *titilelbl;

@property (strong, nonatomic) IBOutlet UITextView *commenttextview;
- (IBAction)Addcmtbtn:(id)sender;

- (IBAction)savecmtbtn:(id)sender;
- (IBAction)cancelcmtbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *ancelbtnlbl;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property (strong, nonatomic) IBOutlet UITextField *cmpnttxtfld;


-(IBAction)toprojecttype:(id)sender;
-(IBAction)toindustrytype:(id)sender;
-(IBAction)toleadtype:(id)sender;
-(IBAction)toleadstatus:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *savebtnlbl;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;


@property(readwrite)NSInteger moduleid;

@property(strong,nonatomic)NSMutableDictionary *empdict;
@property(strong,nonatomic)NSMutableDictionary *revempdict;
@property (strong, nonatomic) IBOutlet UIButton *assignto;
@property(strong,nonatomic)NSArray *namelistarray;

- (IBAction)selectassignto:(id)sender;

@end
