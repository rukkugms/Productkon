//
//  BasicReqViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "basicreqmdl.h"
#import "Validation.h"
#import "venderViewController.h"
#import "Rightscheck.h"

@interface BasicReqViewController : UIViewController<myDelegate>
{
    BOOL recordresults;
    NSInteger poptype;
    NSInteger webtype;
    /*value for checkbtn*/
    NSInteger expiry;
    NSInteger defaultcheck;
    NSInteger inhouse;
    NSInteger craft;
    NSString *expirystring;
    NSString *defaultstring;
    NSString *inhousestring;
    NSString *craftsrings;
    NSInteger optionidentifier;
    NSInteger path;
    UIButton *button;
    NSInteger btnindex;
    NSString *checkstring;
    UIButton *butt;
    NSInteger selectedcell;
    
     
}
-(void)newaction;
@property(strong,nonatomic)NSString *soapstring;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIView *craftview;
@property(strong,nonatomic)IBOutlet UIView *seperatorview;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)basicreqmdl *basicmdl;
@property(strong,nonatomic)venderViewController *venderVCtrl;
@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)IBOutlet UITableView *basicreqtable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addreqview;
@property(strong,nonatomic)IBOutlet UITableViewCell *reqcell;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *venderlbl;

@property(strong,nonatomic)UISearchBar *searchbar;

//IBActions
-(IBAction)closetheBASicreqview:(id)sender;
-(IBAction)addbasicreq:(id)sender;
-(IBAction)editBasicreq:(id)sender;
-(IBAction)deleterequirements:(id)sender;

/*IBAction in editview*/
-(IBAction)closeeditBasicreqview:(id)sender;
-(IBAction)selectjobs:(id)sender;
-(IBAction)expirycheckaction:(id)sender;
-(IBAction)defaultcheckaction:(id)sender;
-(IBAction)inhousecheckaction:(id)sender;
-(IBAction)craftcheckaction:(id)sender;
-(IBAction)selectcraft:(id)sender;
-(IBAction)selecttype:(id)sender;
//-(IBAction)selectallvender:(id)sender;
-(IBAction)updateaction:(id)sender;
-(IBAction)selectreqvender:(id)sender;

/*outlets in addview*/
@property(strong,nonatomic)IBOutlet UIButton *jobbtn;
@property(strong,nonatomic)IBOutlet UIButton *expirycheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *defaultcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *inhousecheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *craftcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *craftbtn;
@property(strong,nonatomic)IBOutlet UIButton *typebtn;
@property(strong,nonatomic)IBOutlet UIButton *venderbtn;
@property(strong,nonatomic)IBOutlet UITextField *itemnametextfield;
@property(strong,nonatomic)IBOutlet UITextField *codetextfield;
@property(strong,nonatomic)IBOutlet UITextField *ratetextfield;
@property(strong,nonatomic)IBOutlet UITextField *hourstextfield;
@property(strong,nonatomic)IBOutlet UITextField *vendertextfield;
@property(strong,nonatomic)UITableView *autotable;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays & dictionarys*/
@property(strong,nonatomic)NSString *typestring;
@property(strong,nonatomic)NSString *jobstring;
@property(strong,nonatomic)NSString *craftstring;
@property(strong,nonatomic)NSMutableArray *typelistarray;
@property(strong,nonatomic)NSMutableArray *joblistarray;
@property(strong,nonatomic)NSMutableArray *craftlistarray;
@property(strong,nonatomic)NSMutableDictionary *typelistdictionary;
@property(strong,nonatomic)NSMutableDictionary *joblistdictionary;
@property(strong,nonatomic)NSMutableDictionary *craftlistdictionary;
@property(strong,nonatomic)NSMutableArray *venderlistarray;
@property(strong,nonatomic)NSMutableArray *autocompletearray;
@property(strong,nonatomic)NSMutableArray *allrequirementarray;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *itemnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *codelabel;
@property(strong,nonatomic)IBOutlet UILabel *ratelabel;
@property(strong,nonatomic)IBOutlet UILabel *typelabel;
@property(strong,nonatomic)IBOutlet UILabel *expirylbl;
@property(strong,nonatomic)IBOutlet UIButton *defbtn;
@property(strong,nonatomic)IBOutlet UIButton *allcrftbtn;
@property(strong,nonatomic)IBOutlet UIButton *inhousebtn;
@property(strong,nonatomic)IBOutlet UILabel *crftlabel;
@property(strong,nonatomic)IBOutlet UILabel *joblabel;
@property(strong,nonatomic)IBOutlet UILabel *venderlabel;
@property(strong,nonatomic)IBOutlet UILabel *resultdisplaylabel;
- (IBAction)addcancelbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;


@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;


@end
