//
//  ConsumbleViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Validation.h"
#import "Rightscheck.h"
#import "RSTViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Base64.h"
@interface ConsumbleViewController : UIViewController<UITextFieldDelegate>
{
    BOOL   recordResults;
    NSInteger butnpath;
    NSInteger path;
    NSInteger butntype;
    UIButton *button;
    NSInteger webtype,checksub,moduleid,saftycheck,createsub,createsfty;
    NSString *msgstrg;
    NSString*skill,*consumblecode;
      NSInteger imagechecker;
    
}

@property(readwrite)NSInteger frmplan;
@property(strong,nonatomic)NSString *itemfromgp;

/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;
@property(strong,nonatomic)NSString*picturelocation;
@property(strong,nonatomic)NSString*uplodpiclctn;
@property(strong,nonatomic)NSString*imgstring;


@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSMutableDictionary *revskilldict;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;




@property (strong, nonatomic) IBOutlet UITextField *stckinhandtxtfld;
@property(strong,nonatomic)Validation *vald;
@property (strong, nonatomic)Manpwr *Consublemdl;

@property (strong, nonatomic)NSMutableArray *cnsumblearray;
@property (strong, nonatomic)NSMutableArray *subtypearray;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
@property(strong,nonatomic)IBOutlet UILabel *resultdisplaylabel;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
//outlets
@property(strong,nonatomic)IBOutlet UITableView *consumbleTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *consumbleCell;
@property(strong,nonatomic)IBOutlet UIView *titleView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIView *addView;
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *destxtfld;

@property (strong, nonatomic) IBOutlet UITextField *subtyptxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;
@property (strong, nonatomic) IBOutlet UIButton *subsearchbtnlbl;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;

- (IBAction)subsearchbtn:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *brimgview;


-(IBAction)closeconsume:(id)sender;
-(IBAction)addconsume:(id)sender;
-(IBAction)editconsume:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)closeimage:(id)sender;
@property (strong, nonatomic)RSTViewController *subtypctrlr;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
- (IBAction)subtypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *subtypebtnlbl;
- (IBAction)checksubtypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *checksubtypebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *checksaftybtn;

- (IBAction)checksfty:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitybtn;

@end
