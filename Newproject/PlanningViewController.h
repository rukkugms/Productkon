//
//  PlanningViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AddserviceViewController.h"
#import "SitevisitViewController.h"
#import "DetailplanViewController.h"
#import "planmodel.h"
#import "Validation.h"
#import "Rightscheck.h"
#import "PServiceViewController.h"
#import "PlandocsViewController.h"
@interface PlanningViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger leadcheck;
    NSInteger customercheck;
    NSInteger poptype;
    UIButton *button;
    BOOL recordResults;
    NSInteger optionidentifier;
    NSInteger path;
    NSInteger webtype;
    NSInteger btnindex;
    NSString *customerclicked;
    NSString *leadclicked;
    NSString *typestrg;
    NSInteger newpoptype;
    
    
    
    
}

/* newcomment*/
@property(strong,nonatomic)PlandocsViewController *PlandocsVCtrl;
@property(strong,nonatomic)PServiceViewController *psctrlr;
@property(readwrite)NSInteger plntype;

@property(strong,nonatomic)NSString *result;
@property(strong,nonatomic)planmodel *plnmdl;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)AddserviceViewController *servVctrl;
@property(strong,nonatomic)SitevisitViewController *sitevisitVctrl;
@property(strong,nonatomic)DetailplanViewController *DetailplanVctrl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



/*views*/
@property (strong, nonatomic) IBOutlet UINavigationBar *titleview;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property (strong, nonatomic) IBOutlet UITableView *plangtable;
@property(strong,nonatomic)IBOutlet UIView *addplanview;

/*Buttons*/
@property(strong,nonatomic)IBOutlet UIButton *leadcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *custcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *planselectionbtn;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;

@property(strong,nonatomic)IBOutlet UITableViewCell *planingcell;
@property(strong,nonatomic)IBOutlet UILabel *organizationname;
@property(strong,nonatomic)IBOutlet UILabel *leadlabel;
@property(strong,nonatomic)IBOutlet UILabel *planidlabel;
@property(strong,nonatomic)IBOutlet UILabel *wrktypelabel;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)IBOutlet UILabel *selectionlabel;
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;
@property(strong,nonatomic)IBOutlet UINavigationItem *plnnavitem;;



/*IBAction*/
- (IBAction)clseVCtrlbtn:(id)sender;
- (IBAction)addplan:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)checkleadaction:(id)sender;
-(IBAction)checkcustomeraction:(id)sender;
//-(IBAction)selectcustomer:(id)sender;
-(IBAction)planselection:(id)sender;
-(IBAction)selectdisclosure:(id)sender;
-(IBAction)updateplanning:(id)sender;
-(IBAction)cancelplanning:(id)sender;
-(IBAction)Editaction:(id)sender;
-(IBAction)deleteplan:(id)sender;

/*array*/
//@property(strong,nonatomic)NSMutableArray *leadlistarray;
//@property(strong,nonatomic)NSMutableArray *customerlistarray;
@property(strong,nonatomic)NSMutableArray *planslectionarray;
@property(strong,nonatomic)NSMutableArray *disclosurearry;
@property(strong,nonatomic)NSMutableArray *planlistarray;
@property(strong,nonatomic)NSMutableArray *typelistarray;
@property(strong,nonatomic)NSMutableArray *cmpxtyofwrk;


/*Dict*/
@property(strong,nonatomic)NSMutableDictionary *leaddict;
@property(strong,nonatomic)NSMutableDictionary *customerdict;
@property(strong,nonatomic)NSMutableDictionary *typelistdict;
@property(strong,nonatomic)NSMutableDictionary *revtypelistdict;


@property(strong,nonatomic)NSString *leadstring;
@property(strong,nonatomic)NSString *customerstring;

@property (strong, nonatomic) IBOutlet UIButton *typebtnlbl;

- (IBAction)typebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *sitefactortxtfld;

@property (strong, nonatomic) IBOutlet UITextField *loctntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptxtfld;
@property (strong, nonatomic) IBOutlet UIButton *cmplexitybtnlbl;

- (IBAction)cmplxitywrkbtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@property(strong,nonatomic)IBOutlet UIButton *addbtn;
@property(strong,nonatomic)IBOutlet UIButton *deletebtn;
@property(strong,nonatomic)IBOutlet UIButton *editbtn;
@property(strong,nonatomic)IBOutlet UIView *seperatorview;

@property(strong,nonatomic)IBOutlet UIButton *updatebtn;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *locationlbl;
@property (strong, nonatomic) IBOutlet UILabel *complexitywrklbl;

@property (strong, nonatomic) IBOutlet UILabel *sitefactrlbl;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview2;


@property (strong, nonatomic) IBOutlet UILabel *wplanlbl;
@property (strong, nonatomic) IBOutlet UILabel *worgnztnlbl;
@property (strong, nonatomic) IBOutlet UILabel *wmanhrslbl;
@property (strong, nonatomic) IBOutlet UILabel *weqhrslbl;

@property (strong, nonatomic) IBOutlet UITableViewCell *wrkentrycell;

@property (strong, nonatomic) IBOutlet UIButton *wdisbtn;
- (IBAction)wsdisclre:(id)sender;

@end
