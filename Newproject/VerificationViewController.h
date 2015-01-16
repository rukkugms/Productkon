//
//  VerificationViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Verfymdl.h"
#import "Coursemdl.h"
#import "Base64.h"
#import "WebViewController.h"
#import "Validation.h"

@protocol myDelegate <NSObject>

-(void)newaction;

@end

@interface VerificationViewController : UIViewController<UITabBarDelegate>{
     BOOL recordResults;
    NSInteger testint;
    UIButton *button;
    UIButton *yearbutton;
    NSInteger poptype;
     NSInteger cmpreid;
    NSString *docsstring,*verifytype;
    NSInteger ssnclck;
    NSInteger i9clck;
    NSInteger bgclck;
    NSInteger webtype;
    NSInteger path,Segmntcheck,ssnsegmentcheck,bgsegmentcheck,I9segmentcheck;
    
    
}
@property(nonatomic,weak)id<myDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIView *verifctnview;


@property(strong,nonatomic)NSMutableDictionary *userdict;
@property (strong, nonatomic)Coursemdl*coursemdl;

@property (strong, nonatomic)Verfymdl*verfymdl;
@property(readwrite)NSInteger applicantid;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *ssnview;

@property (strong, nonatomic) IBOutlet UILabel *namelbltext;
@property (strong, nonatomic) IBOutlet UILabel *ssnlbltext;

@property (strong, nonatomic) IBOutlet UITabBar *tabbar;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *result;
- (IBAction)requrmntactn:(id)sender;
- (IBAction)i9action:(id)sender;
- (IBAction)bgaction:(id)sender;
- (IBAction)ssnaction:(id)sender;

@property(strong,nonatomic)NSMutableArray *monthArray;
@property(strong,nonatomic)NSMutableArray *monthdictArray;

@property(strong,nonatomic)NSMutableArray *requirementArray;
@property(strong,nonatomic)NSMutableDictionary *monthDictionary;

@property(strong,nonatomic)NSMutableDictionary *remonthDictionary;
@property(strong,nonatomic)NSMutableArray *yearArray;
@property(strong,nonatomic)NSMutableArray*Fetchdetailsarray;
@property (strong, nonatomic) IBOutlet UITabBarItem *I9item;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/*I9view*/
@property (strong, nonatomic) IBOutlet UIView *I9view;
@property (strong, nonatomic) IBOutlet UITextField *suffixtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *lastnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *firstnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *middlenametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *Addresstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptextfld;
@property (strong, nonatomic) IBOutlet UITextField *datetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *verifiedbytxtfld;
@property (strong, nonatomic) IBOutlet UIImageView *profileimg;


- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)uploadbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

/*RequirementView*/

@property (strong, nonatomic) IBOutlet UIView *_requirmentview;
@property (strong, nonatomic) IBOutlet UITableView *requirementtable;
- (IBAction)Rsavebtn:(id)sender;

- (IBAction)Rcancelbtn:(id)sender;

/*RequirementView cell*/
@property (strong, nonatomic) IBOutlet UILabel *reqiuremntnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *monthbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *yearbtnlbl;

@property (strong, nonatomic) IBOutlet UITableViewCell *verifctncell;

@property (strong, nonatomic) IBOutlet UIButton *uploadbtnlbl;
- (IBAction)monthbtn:(id)sender;

- (IBAction)yearbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *ssnbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *i9btnlbl;

@property (strong, nonatomic) IBOutlet UIButton *bgbtnlbl;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)NSMutableArray *docsarray;
@property(strong,nonatomic)NSMutableDictionary *docspathDict;

@property(strong,nonatomic)NSString *doc;
@property(strong,nonatomic)WebViewController *webctrl;

@property (strong, nonatomic) IBOutlet UILabel *verfylbl;

@property (strong, nonatomic) IBOutlet UITextView *cmmnttextview;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic)NSString *photostring;

@property (strong, nonatomic)NSString *useridname;
/*sendtojob*/
@property (strong, nonatomic)NSString *crftid;
@property (strong, nonatomic)NSString *skillid;
@property (strong, nonatomic)NSString *jobsiteid;
@property (strong, nonatomic)NSMutableDictionary *jobsitedict;
@property (strong, nonatomic)NSMutableArray *jobsitearray;

@property (strong, nonatomic)NSMutableDictionary *craftdict;
@property (strong, nonatomic)NSMutableArray *craftarray;
@property (strong, nonatomic)NSMutableDictionary *skilldict;
@property (strong, nonatomic)NSMutableArray *skillarray;


/*outlts*/
 
@property (strong, nonatomic) IBOutlet UITextField *namefirsttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *namelasttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *jobssntxtfld;
@property (strong, nonatomic) IBOutlet UIButton *dobbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *skilltxtfld;
@property (strong, nonatomic) IBOutlet UIButton *craftbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *payratetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *jobdobtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *jobsitebtnlbl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmntbtn;


- (IBAction)dobbtn:(id)sender;

- (IBAction)craftbtn:(id)sender;

- (IBAction)jobsitebtn:(id)sender;

- (IBAction)movebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *verifybtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *movebtnlbl;

- (IBAction)segmntbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *veryimgevw;
@property (strong, nonatomic) IBOutlet UILabel *verifiedcmpldlbl;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityview;


@end
