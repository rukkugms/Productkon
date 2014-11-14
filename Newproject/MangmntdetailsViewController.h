//
//  MangmntdetailsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/3/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "subcontract.h"
#import "Vlumedismdl.h"
#import "Wagesmdl.h"
#import "fuelmdl.h"
#import "WebViewController.h"
#import "deliverymdl.h"
#import "eqtermsmdl.h"
#import "Thrtrmsmdl.h"

@interface MangmntdetailsViewController : UIViewController{
    
    BOOL recordResults;
    NSInteger tabletype,markuppath;
    NSString *markup;
    NSString *docuname,*diststrg,*markupidnew;
    UIButton *button;
    
}


@property(strong,nonatomic)WebViewController *webctrl;
@property(strong,nonatomic)fuelmdl *fumdl;
@property(strong,nonatomic)deliverymdl*delrymdl;
@property(strong,nonatomic)eqtermsmdl*eqmdl;
@property(strong,nonatomic)Thrtrmsmdl *thrtrmsmdl;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



@property(strong,nonatomic)NSMutableArray *detailsarray;
@property(strong,nonatomic)subcontract *subcntrct;
/*tabbarbuttons*/
- (IBAction)paymntbtn:(id)sender;
- (IBAction)volumebtn:(id)sender;
- (IBAction)laborbtn:(id)sender;
- (IBAction)equpbtn:(id)sender;
- (IBAction)othrtermsbtn:(id)sender;
- (IBAction)markupbtn:(id)sender;
- (IBAction)basebtn:(id)sender;
- (IBAction)fuelbtn:(id)sender;
- (IBAction)nonfuelbtn:(id)sender;
- (IBAction)SMRbtn:(id)sender;
- (IBAction)Orbtn:(id)sender;
- (IBAction)deliveryratebtn:(id)sender;
- (IBAction)srsbtn:(id)sender;
- (IBAction)docubtn:(id)sender;
- (IBAction)notes:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *paymntbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *vlumbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *lbrbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equpbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *othrtrmsbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *markuptablebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *basewagebtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fueledbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nonfuelbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *smrbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *othrratesbtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *deliverybtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *srabtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *docubtnlbl;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *notesbtn;



/*notes*/
@property(strong,nonatomic)IBOutlet UIView *notesview;
@property(strong,nonatomic)IBOutlet UITextView *notestextview;

/*payment*/

@property (strong, nonatomic) IBOutlet UIView *paymentview;
@property (strong, nonatomic) IBOutlet UITextView *clausetxtview;
@property (strong, nonatomic) IBOutlet UITextField *nettextfld;

/*Indeminity*/
@property (strong, nonatomic) IBOutlet UITextView *indeminityclausetxtview;


/*volume*/
@property (strong, nonatomic)NSMutableArray *volumearray;
@property (strong, nonatomic)Vlumedismdl *vlumemdl;
@property (strong, nonatomic) IBOutlet UIView *volumeview;
@property (strong, nonatomic) IBOutlet UITextView *vlumeclautxtview;
@property (strong, nonatomic) IBOutlet UITableView *vlumetable;
@property (strong, nonatomic) IBOutlet UIView *volumetitle;

@property (strong, nonatomic) IBOutlet UITableViewCell *volumecell;
@property (strong, nonatomic) IBOutlet UILabel *amuntfrmlbl;
@property (strong, nonatomic) IBOutlet UILabel *amunttolbl;
@property (strong, nonatomic) IBOutlet UILabel *percentagelbl;





/*labor*/

@property (strong, nonatomic) IBOutlet UIView *labrview;
@property (strong, nonatomic) IBOutlet UITextView *lbrclaustxtview;
@property (strong, nonatomic) IBOutlet UITextField *weekhrstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subcntrctbtn;
@property (strong, nonatomic) IBOutlet UIButton *overtimechecklbl;
@property (strong, nonatomic) IBOutlet UIButton *minimumchecklbl;
@property (strong, nonatomic) IBOutlet UIButton *holidayschecklbl;
@property (strong, nonatomic) IBOutlet UITextField *workermarkuptxtfld;


- (IBAction)overcheckbtn:(id)sender;
- (IBAction)minimumhrsbtn:(id)sender;
- (IBAction)holidaysbtn:(id)sender;

/*Equipment View*/
@property (strong, nonatomic)NSMutableArray *cequarray;
@property (strong, nonatomic)NSMutableArray *tequparray;
@property (strong, nonatomic) IBOutlet UIView *equpview;

@property (strong, nonatomic) IBOutlet UIView *equptitle1;
@property (strong, nonatomic) IBOutlet UIView *equptitle2;

@property (strong, nonatomic) IBOutlet UITextView *equpclause;
@property (strong, nonatomic) IBOutlet UITableView *cfetable;
@property (strong, nonatomic) IBOutlet UITableView *tretable;
@property (strong, nonatomic) IBOutlet UIButton *thirdequbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *conequpbtnlbl;

@property (strong, nonatomic) IBOutlet UITableViewCell *cfecell;
@property (strong, nonatomic) IBOutlet UITableViewCell *trecell;

//eqcell
@property (strong, nonatomic) IBOutlet UILabel *eqname;
@property (strong, nonatomic) IBOutlet UILabel *hurlylbl;
@property (strong, nonatomic) IBOutlet UILabel *dailylbl;
@property (strong, nonatomic) IBOutlet UILabel *weeklylbl;
@property (strong, nonatomic) IBOutlet UILabel *mnthlylbl;
@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;
//tpcell

@property (strong, nonatomic) IBOutlet UILabel *teqnamelbl;

@property (strong, nonatomic) IBOutlet UILabel *thurslbl;

@property (strong, nonatomic) IBOutlet UILabel *tdailylbl;
@property (strong, nonatomic) IBOutlet UILabel *tweeklylbl;
@property (strong, nonatomic) IBOutlet UILabel *tmntlylbl;
@property (strong, nonatomic) IBOutlet UIButton *tcheckbtnlbl;



- (IBAction)conequpbtn:(id)sender;
- (IBAction)thirdequpbtn:(id)sender;

/*Otherterms view*/
@property (strong, nonatomic) IBOutlet UIView *othrtrmsview;
@property (strong, nonatomic) IBOutlet UITextView *othrtermsclause;

@property (strong, nonatomic) IBOutlet UIButton *swpbtn;
@property (strong, nonatomic) IBOutlet UIButton *consumblebtn;
@property (strong, nonatomic) IBOutlet UIButton *smalltoolbillingbtn;

- (IBAction)shopcheckbtn:(id)sender;
- (IBAction)consublebtn:(id)sender;
- (IBAction)smalltoolbtn:(id)sender;


/*markup view*/
@property (strong, nonatomic)NSMutableArray *markupnamearray;
@property (strong, nonatomic)NSMutableDictionary *markupdict;
@property (strong, nonatomic)NSMutableDictionary *revmarkupdict;

@property(strong,nonatomic)IBOutlet UIPopoverController *popovercontroller;
@property(strong,nonatomic)UITableView *popovertableview;
@property (strong, nonatomic) IBOutlet UIView *markupview;
@property (strong, nonatomic) IBOutlet UIButton *markupbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *overtimetextfield;
@property (strong, nonatomic) IBOutlet UITextField *premiumtimetxtfld;
- (IBAction)selectmarkupbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *markuptextfld;



/*base view */
@property (strong, nonatomic) IBOutlet UIView *baseview;
@property (strong, nonatomic) IBOutlet UIView *basetitle;
@property (strong, nonatomic) IBOutlet UITableView *basetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *basecell;
@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *baseratelbl;
@property (strong, nonatomic) IBOutlet UILabel *prediemlbl;
@property (strong, nonatomic) IBOutlet UILabel *travellbl;
@property (strong, nonatomic) IBOutlet UILabel *oneorbthlbl;
@property (strong, nonatomic)Wagesmdl*wagemdl;
@property (strong, nonatomic)NSMutableArray *basewagesarray;

/*fuel view*/
@property (strong, nonatomic)NSMutableArray *fuelarray;
@property (strong, nonatomic) IBOutlet UIView *fuelview;
@property (strong, nonatomic) IBOutlet UIView *fueltitle;
@property (strong, nonatomic) IBOutlet UITableView *fueltable;
@property (strong, nonatomic) IBOutlet UITableViewCell *fuelcell;
@property (strong, nonatomic) IBOutlet UILabel *itmcdelbl;
@property (strong, nonatomic) IBOutlet UILabel *itmdeslbl;
@property (strong, nonatomic) IBOutlet UILabel *itmratlbl;



/*non fuel view*/
@property (strong, nonatomic)NSMutableArray *nonfuelarray;

@property (strong, nonatomic) IBOutlet UIView *nonfuelview;

@property (strong, nonatomic) IBOutlet UIView *nonfueltitle;

@property (strong, nonatomic) IBOutlet UITableView *nonfueltable;

/*smrview */
@property (strong, nonatomic)NSMutableArray *smrarray;
@property (strong, nonatomic) IBOutlet UIView *smrview;
@property (strong, nonatomic) IBOutlet UIView *smrtitle;

@property (strong, nonatomic) IBOutlet UITableView *smrtable;

/*other rates */

@property (strong, nonatomic) IBOutlet UIView *othrratesview;
@property (strong, nonatomic) IBOutlet UITextField *temtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *leasemarkuptxtfld;
@property (strong, nonatomic) IBOutlet UITextField *rentalmarkuptxtfld;
@property (strong, nonatomic) IBOutlet UITextField *materialpurchasetxtfld;

/*delivery rate*/
@property (strong, nonatomic) IBOutlet UIView *deliveryview;
@property (strong, nonatomic) IBOutlet UITextView *deliveryclausetxtview;
@property (strong, nonatomic) IBOutlet UITableView *deliverytable;
@property (strong, nonatomic)NSMutableArray *deliveryratearray;
@property (strong, nonatomic) IBOutlet UIView *deliverytitle;

/*srs view*/
@property (strong, nonatomic) IBOutlet UIView *srsview;
@property (strong, nonatomic) IBOutlet UITextView *srstxtview;
/*documnt view */
@property (strong, nonatomic)NSMutableDictionary *documntdict;
@property (strong, nonatomic)NSMutableArray *documentarray;
@property (strong, nonatomic) IBOutlet UIView *doctitle;
@property (strong, nonatomic) IBOutlet UITableView *docutable;

@property (strong, nonatomic) IBOutlet UIView *docuview;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *documntcell;

@property (strong, nonatomic) IBOutlet UILabel *docunamelbl;
- (IBAction)viewbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *tempwrker;

@end
