//
//  FleetsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equpmntmdl.h"
#import "Validation.h"
#import "Base64.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Rightscheck.h"
#import "RSTViewController.h"
#import "SubCatViewController.h"

@interface FleetsViewController : UIViewController{


BOOL recordResults ;
NSInteger btntype;
UIButton *button;
NSInteger path;
NSInteger deltepath;
NSInteger webtype;
NSInteger btnpath;
NSInteger popvr;
    NSString *msgstrg;
    NSString*skill;
    NSString *fleetcode;
    NSString *createstring;
      NSString *categorystring;
    NSInteger createcheck;
     NSInteger categorycheck;
    NSInteger imagechecker;
    

    
}
@property(readwrite)NSInteger fleetid;
@property(strong,nonatomic)SubCatViewController *CategryVCtrl;
@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSMutableDictionary *revskilldict;



@property (strong, nonatomic) IBOutlet UILabel *updatelbl;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll1;


@property (strong, nonatomic)Equpmntmdl *Fleetmdl;
@property(strong,nonatomic)Validation *val;
@property (strong, nonatomic) IBOutlet UITextField *stockinhandtxtfld;

@property (strong, nonatomic) IBOutlet UIImageView *picimageview;


@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;

@property(strong,nonatomic)NSString*picturelocation;
@property(strong,nonatomic)NSString*uplodpiclctn;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;


@property (strong, nonatomic) NSMutableArray *fleetarray;
@property (strong, nonatomic)NSMutableArray *subtypearray;
@property (strong, nonatomic)NSMutableArray *Typearray;

/*OUTLETS*/
@property (strong, nonatomic) IBOutlet UITableView *fleetTable;
@property (strong, nonatomic) IBOutlet UIButton *suserachbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *destxtfld;

@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *purchasetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *serialtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *manufattxtfld;
@property (strong, nonatomic) IBOutlet UITextField *insuredtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *hurstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *fueltxtfld;
@property (strong, nonatomic) IBOutlet UITextField *condtntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *hurlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *dailytxtfld;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UITextField *shiftwisetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *weeklytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *monthlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *yearlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *typetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcsttxtfld;

@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UITableViewCell *fleetcell;

@property (strong, nonatomic) IBOutlet UIButton *typesearchlbl;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
- (IBAction)deletebtn:(id)sender;
//- (IBAction)typesearchbtn:(id)sender;
-(IBAction)closeimage:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)Addclosebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)subsearchbtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)editbtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitybtn;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(strong,nonatomic)IBOutlet UIButton *cellsubtypebtn;
-(IBAction)cellsubtypeselection:(id)sender;
@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)RSTViewController *rstctrlr;
- (IBAction)checksubtypebtn:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *subcheckbtn;
@property (strong, nonatomic) IBOutlet UIButton *categrybtnlbl;

- (IBAction)checkcategory:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *catcheck;

@end
