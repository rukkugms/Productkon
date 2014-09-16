//
//  SmalltoolsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Base64.h"
#import "Validation.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Rightscheck.h"
#import "RSTViewController.h"


@interface SmalltoolsViewController : UIViewController{
     BOOL recordResults;
    NSInteger butnpath;
    NSInteger path;
    NSInteger butntype,checksub,createsub,moduleid;
    UIButton *button;
    NSInteger webtype;
    NSString *msgstrg;
    NSString*skill;
    NSString*smallcode,*picturelocation;

      
}
@property (strong, nonatomic) IBOutlet UIImageView *picimageview;
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;


@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSMutableDictionary *revskilldict;


@property (strong, nonatomic)Manpwr *Toolmdl;

@property(strong,nonatomic)Validation *val;
@property (strong, nonatomic) IBOutlet UITextField *stockinhandtxtfld;

@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic)NSMutableArray *toolarray;
@property (strong, nonatomic)NSMutableArray*subtypearray;



@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *Tooltable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *destxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *costtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *subsearchbtnlbl;

@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;


@property (strong, nonatomic)NSString*searchstring;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *toolcell;

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
@property(strong,nonatomic)IBOutlet UILabel *resultdisplaylabel;


- (IBAction)addtoolbtn:(id)sender;
- (IBAction)deletetoolbtn:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

- (IBAction)cancelbtn:(id)sender;
- (IBAction)subsearchbtn:(id)sender;
- (IBAction)closeaddbtn:(id)sender;

- (IBAction)editbtn:(id)sender;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
- (IBAction)subtypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *subtypebtnlbl;
@property (strong, nonatomic)RSTViewController *subtypctrlr;
@property (strong, nonatomic) IBOutlet UIButton *checksubbtnlbl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitybtn;

- (IBAction)checksubtypebtn:(id)sender;
@end
