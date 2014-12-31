//
//  ThirdPartyViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equpmntmdl.h"
#import "Validation.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Base64.h"
#import "Rightscheck.h"
#import "RSTViewController.h"


@interface ThirdPartyViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate>

{
    BOOL recordResults ;
    NSInteger btntype;
    UIButton *button;
    NSInteger path;
    NSInteger deltepath,moduleid;
    NSInteger webtype,checksub;
    NSInteger btnpath;
    NSInteger popvr;
    NSString *msgstrg;
   
    NSString*skill;
    NSString *thirdpatrycode;
    NSString *checkstring;
      NSInteger imagechecker;
    
    
}

@property(readwrite)NSInteger frmplan;
@property(strong,nonatomic)NSString *itemfromgp;
@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSMutableDictionary *revskilldict;
@property(strong,nonatomic)UIImagePickerController *imagePicker;
    


/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;
@property(strong,nonatomic)NSString*picturelocation;
@property(strong,nonatomic)NSString*uplodpiclctn;
@property(strong,nonatomic)NSString*imgstring;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;


@property (strong, nonatomic)Equpmntmdl *thirdpartymdl;
@property(strong,nonatomic)Validation *vald;
@property (strong, nonatomic) IBOutlet UITextField *stckinhandtxtdfld;

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
@property (strong, nonatomic) IBOutlet UINavigationItem*navitem;

@property (strong, nonatomic) NSMutableArray *thirdprtyarray;
@property (strong, nonatomic)NSMutableArray *subtypearray;
@property (strong, nonatomic)NSMutableArray *Typearray;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, assign) NSInteger openviewIndex;

/*OUTLETS*/
@property(strong,nonatomic)IBOutlet UIImageView *pictureimgvw;
@property (strong, nonatomic) IBOutlet UITableView *thirdprtyTable;
@property (strong, nonatomic) IBOutlet UIButton *suserachbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *destxtfld;

@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *purchasetxtfld;
@property (strong, nonatomic) IBOutlet UILabel *updatelbl;

@property (strong, nonatomic) IBOutlet UITextField *serialtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *manufattxtfld;
@property (strong, nonatomic) IBOutlet UITextField *insuredtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *hurstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *fueltxtfld;
@property (strong, nonatomic) IBOutlet UITextField *condtntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *hurlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *dailytxtfld;

@property (strong, nonatomic) IBOutlet UITextField *shiftwisetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *weeklytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *monthlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *yearlytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *typetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcsttxtfld;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UITableViewCell *thirdpartycell;

@property (strong, nonatomic) IBOutlet UIButton *typesearchlbl;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
- (IBAction)deletebtn:(id)sender;
- (IBAction)typesearchbtn:(id)sender;

- (IBAction)closebtn:(id)sender;
- (IBAction)Addclosebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)subsearchbtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)editbtn:(id)sender;
-(IBAction)closeimage:(id)sender;
- (IBAction)subtypebtn:(id)sender;
- (IBAction)checksubtype:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;


@property (strong, nonatomic) IBOutlet UIButton *subtypebtnlbl;
@property (strong, nonatomic)RSTViewController *subtypctrlr;

@property (strong, nonatomic) IBOutlet UIButton *checksubtypebtnlbl;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitybtn;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@end
