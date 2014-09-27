//
//  ManViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import"Validation.h"
#import "sqlite3.h"
#import "ServiceViewController.h"
#import "Rightscheck.h"

@interface ManViewController : UIViewController{
    
    BOOL recordResults;
    NSInteger webtype;
    NSInteger path;
    UIButton *button;
    NSInteger btnindex;
    NSInteger btnidtfr;
    NSInteger checkbtnclick;
    NSInteger Newprimarykey;
    NSString*skill;
    NSString*msgstrg;
    NSInteger newtype;
    NSInteger moduleid;
    NSString *userid;
    NSString *checkstring;
    NSInteger x;
    
}
@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)NSMutableDictionary *skilldict;
@property(strong,nonatomic)NSMutableDictionary *revskilldict;

@property(strong,nonatomic)Manpwr *manpwrmdl;
@property(strong,nonatomic)Validation *vald;
- (IBAction)servicebtn:(id)sender;

/*For Sqlite Database*/

@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3*newResourcesListDB;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *Availablityresult;



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Arrays&Dicts*/

@property(strong,nonatomic)NSMutableArray *Allmanpwrarry;
@property(strong,nonatomic)NSMutableArray *subtypearray;
@property(strong,nonatomic)NSMutableArray *Sqlitearry;
@property(strong,nonatomic)NSMutableArray *keyarray;



/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
@property (strong, nonatomic) IBOutlet UILabel *billabel;
@property (strong, nonatomic) IBOutlet UILabel *paylabel;
@property (strong, nonatomic) IBOutlet UILabel *craftlabel;
@property (strong, nonatomic) IBOutlet UIButton *overhdchecklbl;

/*Add button outlets*/
@property (strong, nonatomic) IBOutlet UIButton *searchbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *itemcodetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *itemdestxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stockinhandtxtfld;

@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;
@property(strong,nonatomic)IBOutlet UITextField *craftcodetextfld;
@property(strong,nonatomic)IBOutlet UITextField *billingratetextfield;
@property(strong,nonatomic)IBOutlet UITextField *payratetextfield;
@property(strong,nonatomic)IBOutlet UILabel *resultdisplaylabel;

- (IBAction)overhdcheck:(id)sender;
- (IBAction)searchbtn:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)selectQualificatin:(id)sender;
- (IBAction)closeQualificatin:(id)sender;
- (IBAction)saveQualificatin:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;

- (IBAction)clsebtn:(id)sender;

- (IBAction)deletebtn:(id)sender;
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(strong,nonatomic)IBOutlet UITableView *manpowerTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *manpowecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
-(IBAction)closemanpower:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *addview;
- (IBAction)addmanpwer:(id)sender;
-(IBAction)editmanpower:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;


/*Outlets in Qualifiactionview*/
@property(strong,nonatomic)IBOutlet UIView *qualificationview;
@property(strong,nonatomic)IBOutlet UITextView *trainingtextview;
@property(strong,nonatomic)IBOutlet UITextView *jobtasktextview;
@property(strong,nonatomic)IBOutlet UITextView *experiencetextview;
@property(strong,nonatomic)IBOutlet UITextView *eduactiontextview;
@property(strong,nonatomic)IBOutlet UIScrollView *scrollforqualification;
@property (strong, nonatomic) IBOutlet UIScrollView *addscrollview;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)NSString *result;
@property(strong,nonatomic)IBOutlet UIButton *updatebtn;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;


@end
