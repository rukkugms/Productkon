//
//  SafetyViewController.h
//  Newproject
//
//  Created by Riya on 2/12/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Manpwr.h"
#import "Base64.h"
#import "RSTViewController.h"
#import "Validation.h"

@interface SafetyViewController : UIViewController{
    NSInteger imagechecker,webtype,btninfr;
    UIButton *button;
    BOOL recordResults ;
    NSInteger subtypevalue,editpath,deletepath;
    NSString* safetycode,*msgstrg;
}
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic)RSTViewController *subtypctrlr;
@property(strong,nonatomic)Manpwr *SaftyMdl;
@property(strong,nonatomic)NSMutableArray *SafetyArray;

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *saftytable;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *codedestxtfld;

@property (strong, nonatomic) IBOutlet UIButton *subtypebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitmeasuretxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stocktxtfld;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *itemcodetxtfld;



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;
@property(strong,nonatomic)NSString*picturelocation;
@property(strong,nonatomic)NSString*uplodpiclctn;
@property(strong,nonatomic)NSString*imgstring;

/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *itemcodelbl;
@property (strong, nonatomic) IBOutlet UILabel *codedeslbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
- (IBAction)cellSubtypebtnlbl:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Cellsubbtnlbl;

- (IBAction)editbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityindictor;

- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;
- (IBAction)Deletebtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;
- (IBAction)subtypebtn:(id)sender;
- (IBAction)picclsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *picimgeview;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *saftycell;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;

@end
