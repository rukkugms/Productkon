//
//  NewCustmrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Custmermdl.h"
#import "ContactInfoViewController.h"
#import "SalesRepInfoViewController.h"
#import "Validation.h"
#import "Rightscheck.h"

@interface NewCustmrViewController : UIViewController{
    BOOL recordResults;
    NSString *stateid;
     NSString *cuntryid;
    NSInteger poptype;
    UIButton *button;
    NSInteger path;
    NSInteger optionidentifier;
    NSInteger webtype;
    NSInteger btnindex;
    NSString *faxnoString;
    NSInteger fmt;
    //phoneno format
    NSString *phnnostring;
    NSInteger deletepath;
    NSString *msgstrg;
   

}
@property(strong,nonatomic)NSString *custmrcode;
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;

@property(strong,nonatomic)ContactInfoViewController *cntctVctrl;

@property(strong,nonatomic)SalesRepInfoViewController *salesVCtrl;
@property(strong,nonatomic)NSString *faxfmtstring;
@property(strong,nonatomic)NSString *phnnofmtstring;


@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;

@property(strong,nonatomic)Custmermdl *custmdl;
@property(strong,nonatomic)NSMutableArray *customerarray;
@property(strong,nonatomic)NSMutableArray *statearray;
@property(strong,nonatomic)NSMutableDictionary *statedict;
@property(strong,nonatomic)NSMutableDictionary *revstatedict;
@property(strong,nonatomic)NSMutableArray *countryarray;
@property(strong,nonatomic)NSMutableDictionary *countrydict;
@property(strong,nonatomic)NSMutableDictionary *revcountrydict;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic)NSMutableArray*popoverArry;



/*outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navgtnbar;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *custmrtable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *nametextfld;
@property (strong, nonatomic) IBOutlet UITextView *addresstxtview;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UIButton *statebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *zipbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *cuntrybtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *faxtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *emailtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *websitetxtfld;

@property (strong, nonatomic) IBOutlet UINavigationBar *addnavbar;



/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *custmrcell;
@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *citylbl;
@property (strong, nonatomic) IBOutlet UILabel *statelbl;
@property (strong, nonatomic) IBOutlet UILabel *cuntrylbl;
@property (strong, nonatomic) IBOutlet UILabel *phonelbl;
@property (strong, nonatomic) IBOutlet UILabel *emaillbl;
@property (strong, nonatomic) IBOutlet UIButton *editbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *disclurebtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;

/*actions*/

- (IBAction)clsebtn:(id)sender;
- (IBAction)addcustmrbtn:(id)sender;
- (IBAction)deletecustmrbtn:(id)sender;
- (IBAction)statebtn:(id)sender;
- (IBAction)cuntrybtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)clseviewbtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)disclurebtn:(id)sender;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;

@property(readwrite)NSInteger frmplan;
@property(strong,nonatomic)NSString *planorganztn;
@end
