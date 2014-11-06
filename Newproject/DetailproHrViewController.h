//
//  DetailproHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"
#import "CKCalendarView.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Base64.h"
#import "WebViewController.h"
#import "Validation.h"
#import "Appreqmdl.h"
#import "payementmdl.h"

@interface DetailproHrViewController : UIViewController<UIImagePickerControllerDelegate>
{
    NSInteger poptype;
    BOOL   recordResults;
    NSString *dateString ;
    UIButton *button;
    NSString *urlstring;
    NSString*statusstring;
    NSInteger webtype;
 NSString*vendorstrg,*stateidstr;
    NSInteger check;
    NSInteger dateselctor;
    NSInteger btnindex;
    NSInteger newwebtype;
    NSInteger imagechecker;
    
}
@property (readwrite)NSInteger path;
@property (strong, nonatomic)Appreqmdl*appreqmdl;
@property (strong, nonatomic)payementmdl*paymntmdl;
@property (strong, nonatomic)NSMutableArray*payementarray;
@property (strong, nonatomic)NSMutableArray*requirmntarray;
@property (strong, nonatomic)NSMutableDictionary*vendordict;
@property (strong, nonatomic)NSMutableDictionary*revendordict;
@property (strong, nonatomic)NSMutableDictionary *statedict;
@property (strong, nonatomic)NSMutableDictionary *revpaymnttypedict;
@property (strong, nonatomic)NSMutableDictionary *revmaritaldict;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *detailbtnlbl;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *docubtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *w4btnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *paymntbtnlbl;



@property(nonatomic, strong)WebViewController *webVCtrl;

@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;
/*webservice*/

@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSMutableArray *detailarray;
@property(strong,nonatomic)NSMutableArray *montharray;
@property(strong,nonatomic)NSMutableArray *remontharray;
@property(strong,nonatomic)NSMutableDictionary *remonthdict;
/*button*/
- (IBAction)DetailsBtnAction:(id)sender;
- (IBAction)DcmntBtnAction:(id)sender;
- (IBAction)w4BtnAction:(id)sender;
- (IBAction)paymentbtnaction:(id)sender;

/*Detailsview*/
@property(strong,nonatomic)IBOutlet UIView *detailsaddview;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITableView *detailstablview;
@property(strong,nonatomic)IBOutlet UIView *detailstabletitleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *detailscell;
@property (strong, nonatomic) IBOutlet UIButton *vendrnamebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *verfictnbtnlbl;
@property(strong,nonatomic)UIImagePickerController *imagePicker;
//celldetail labels
@property (strong, nonatomic) IBOutlet UILabel *reqnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *statuslbl;
@property (strong, nonatomic) IBOutlet UIButton *detalexpbtnlbl;

@property(strong,nonatomic)IBOutlet UIButton *editbtn;
@property(strong,nonatomic)IBOutlet UIView *editview;
-(IBAction)editdetails:(id)sender;
-(IBAction)closeeditview:(id)sender;
-(IBAction)updaterequirement:(id)sender;
-(IBAction)cancelrequirement:(id)sender;
-(IBAction)selectstatus:(id)sender;
-(IBAction)verifiedaction:(id)sender;

- (IBAction)detailexpbtn:(id)sender;
- (IBAction)vendorbtn:(id)sender;


/*W4 view*/
@property(strong,nonatomic)IBOutlet UIView *w4detailview;
@property(strong,nonatomic)IBOutlet UIButton *maritalbtn;
@property(strong,nonatomic)IBOutlet UITextField *Dependentstexffld;


-(IBAction)selectmaritalstatus:(id)sender;

- (IBAction)w4savebtn:(id)sender;


/*Paymentypeview*/
@property(strong,nonatomic)IBOutlet UIView *paymentdetailview;
@property(strong,nonatomic)IBOutlet UIButton *paymenttypebtn;

@property (strong, nonatomic) IBOutlet UITextField *instnname;
@property (strong, nonatomic) IBOutlet UITextField *Accuntnumbr;
@property (strong, nonatomic) IBOutlet UITextField *rontgnumbr;
@property (strong, nonatomic) IBOutlet UITextField *citytxt;

@property (strong, nonatomic) IBOutlet UIButton *expbtn;

@property (strong, nonatomic) IBOutlet UIButton *statelbl;
@property (strong, nonatomic) IBOutlet UITextField *cardnumbtxtfld;
//@property (strong, nonatomic) IBOutlet UITextField *expbtn;

@property (strong, nonatomic) IBOutlet UITextField *cardroutdno;
@property (strong, nonatomic) IBOutlet UISegmentedControl *typesegmntlbl;
- (IBAction)expbtn:(id)sender;

- (IBAction)statebtn:(id)sender;
- (IBAction)typesegmnt:(id)sender;

-(IBAction)selectpaymenttype:(id)sender;
- (IBAction)savebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *docnamelbl;
- (IBAction)showbtn:(id)sender;

@property (strong, nonatomic)NSMutableDictionary*statusdict;
@property (strong, nonatomic)NSMutableDictionary*restatusdict;

/*document View*/
@property(strong,nonatomic)IBOutlet UIView *dcmntdetailview;
@property(strong,nonatomic)IBOutlet UITextField *documentnametextfld;

@property(strong,nonatomic)IBOutlet UITableView *documentlisttable;
@property(strong,nonatomic)IBOutlet UITableViewCell *doccell;
@property(strong,nonatomic)IBOutlet UIView *doctabletitleview;
@property(strong,nonatomic)NSMutableDictionary *docmntdict;
@property(strong,nonatomic)NSString *docname;
@property (strong, nonatomic) IBOutlet UIImageView *previewimg;
-(IBAction)selectfileaction:(id)sender;
-(IBAction)updatedoc:(id)sender;
- (IBAction)detailclsebtn:(id)sender;




/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *maritalarray;
@property(strong,nonatomic)NSMutableArray *maritalkeyarray;
@property(strong,nonatomic)NSMutableArray *Applicantarray;
@property(strong,nonatomic)NSMutableDictionary *maritaldict;
@property(strong,nonatomic)NSMutableDictionary *paymenttypedict;
@property(strong,nonatomic)NSMutableArray  *payementtypearray;
@property(strong,nonatomic)NSMutableArray  *payementtypekey;

@property(strong,nonatomic)IBOutlet UILabel *requirementlabel;
@property(strong,nonatomic)IBOutlet UILabel *statuslabel;
@property(strong,nonatomic)IBOutlet UILabel *expirylabel;
@property(strong,nonatomic)IBOutlet UILabel *verificationlabel;
@property (strong, nonatomic) IBOutlet UILabel *vendrnamelbl;

@property (strong, nonatomic) IBOutlet UILabel *namevendorlbl;

@property (strong, nonatomic) IBOutlet UIImageView *imgview;

- (IBAction)editbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *uplddocbtnlbl;
@property(strong,nonatomic)NSString*resultstring;

@end
