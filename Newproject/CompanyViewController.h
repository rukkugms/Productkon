//
//  CompanyViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 19/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validation.h"
#import "AddressViewController.h"
#import "Rightscheck.h"
@interface CompanyViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
      BOOL recordResults;
    //fax format
     NSString *faxnoString;
     NSInteger fmt;
    //phoneno format
    NSString *phnnostring;
    NSString *stateid;
    NSString *cuntryid;
    NSInteger poptype;
  
    
}
@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)UIViewController*popoverContent;
@property(strong,nonatomic)AddressViewController *addrsVCtrl;
@property(strong,nonatomic)Validation*validate;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic)NSMutableArray*popoverArry;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)NSMutableArray *customerarray;
@property(strong,nonatomic)NSMutableArray *statearray;
@property(strong,nonatomic)NSMutableDictionary *statedict;
@property(strong,nonatomic)NSMutableArray *countryarray;
@property(strong,nonatomic)NSMutableDictionary *countrydict;

/*outlets*/
@property (strong, nonatomic) IBOutlet UITextField *companynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetextfld;

@property (strong, nonatomic) IBOutlet UITextField *ziptextfld;
@property (strong, nonatomic) IBOutlet UITextField *countrytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *faxtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *fedraltxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stateempIdtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *addresstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;

@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *mailtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *webtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stateunempidtxtfld;
@property(strong,nonatomic)IBOutlet UIButton *coutryBtn;
@property (strong, nonatomic) IBOutlet UIButton *statebtn;
@property (strong, nonatomic) IBOutlet UIButton *addressbtn;
@property (strong, nonatomic) IBOutlet UIButton *savebtn;
- (IBAction)statebtn:(id)sender;
- (IBAction)cuntrybtn:(id)sender;

- (IBAction)savebtn:(id)sender;
-(IBAction)closethecompany:(id)sender;
-(IBAction)cancel:(id)sender;
/*faxfmt*/
@property(strong,nonatomic)NSString *faxfmtstring;
@property(strong,nonatomic)NSString *phnnofmtstring;

@property (strong, nonatomic) IBOutlet UILabel *updatelbl;

- (IBAction)Addadressbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *logoimg;

@property (strong, nonatomic) IBOutlet UIWebView *logoweb;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activitybtn;


@end
