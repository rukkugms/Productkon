//
//  DetailplanViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customscaffoldingplan.h"
#import "Scaffoldtypemdl.h"
#import "AllDetailsplandisplayViewController.h"
#import "GeneralViewController.h"
#import "Generalmodel.h"
#import <sqlite3.h>



@interface DetailplanViewController : UIViewController<animatndelegate,newgenralDelgate>
{
    BOOL recordResults;
    NSInteger webtype;
    UIButton *button;
    NSInteger btnindex;
    NSInteger optionidentifier;
    NSInteger scaffoldtypeindex;
    NSInteger poptype;
    NSInteger first;
    NSInteger sec;
    NSInteger third;
    NSInteger searchtype;
   
}
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;

@property(strong,nonatomic)Customscaffoldingplan *scfldmdl;
@property(strong,nonatomic)Scaffoldtypemdl *typemdl;
@property(strong,nonatomic)AllDetailsplandisplayViewController *allctrlr;
@property(strong,nonatomic)GeneralViewController *generalworkctrlr;
@property(strong,nonatomic)Generalmodel *gmodel;
@property(strong,nonatomic)NSString *pscode;
@property (strong, nonatomic) IBOutlet UISearchBar * searchbar;
@property(strong,nonatomic)NSString *searchstring;
@property (strong, nonatomic) IBOutlet UISearchBar * searchbar1;
@property (readwrite)NSInteger skillsid;
/*IBActions*/
-(IBAction)closeplan:(id)sender;
- (IBAction)Scaffoldslection:(id)sender;
- (IBAction)InsulationSelection:(id)sender;
- (IBAction)fireproofingselection:(id)sender;
- (IBAction)generalselection:(id)sender;
-(IBAction)editscaffoldaction:(id)sender;
-(IBAction)addplan:(id)sender;
-(IBAction)closescaffoldview:(id)sender;
-(IBAction)nextbtnaction:(id)sender;
-(IBAction)selectscaffoldtype:(id)sender;
-(IBAction)addnewworkaction:(id)sender;
-(IBAction)editgeneralaction:(id)sender;


/*IBOutlets in main view*/
@property(strong,nonatomic)IBOutlet UIBarButtonItem *scaffoldbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *insulationbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *fireproofingbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *generalbtn;
@property(strong,nonatomic)IBOutlet UIView *genearaltabletitleview;
@property(strong,nonatomic)IBOutlet UITableView *generaltable;
@property(strong,nonatomic)IBOutlet UITableViewCell *generalcell;
@property(strong,nonatomic)IBOutlet UIView *scaffoldview;
@property(strong,nonatomic)IBOutlet UIView *generalview;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIView *addscaffoldrecordview;
//@property(strong,nonatomic)IBOutlet UIView *insulationview;
//@property(strong,nonatomic)IBOutlet UIView *fireproofingview;
@property(strong,nonatomic)IBOutlet UIView *scaffoldtabletitleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *scaffoldcell;
@property(strong,nonatomic)IBOutlet UITableView *scaffoldtable;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
/*popovercontroller*/
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;



/*outlets in generalcell*/
@property(strong,nonatomic)IBOutlet UILabel *generalunitlabel;
@property(strong,nonatomic)IBOutlet UILabel *generalsubunitlabel;
@property(strong,nonatomic)IBOutlet UILabel *generalequiplabel;
@property(strong,nonatomic)IBOutlet UILabel *generalphlabel;
@property(strong,nonatomic)IBOutlet UILabel *generalquanitylabel;
@property(strong,nonatomic)IBOutlet UILabel *generalphaselabel;
@property(strong,nonatomic)IBOutlet UILabel *generalseqlabel;
@property(strong,nonatomic)IBOutlet UILabel *totalmanhourlabel;
@property(strong,nonatomic)IBOutlet UILabel *eqhourlabel;



/*outlets in scaffoldingcell*/
@property(strong,nonatomic)IBOutlet UILabel *unitcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *equipcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *pjctheadercelllabel;
@property(strong,nonatomic)IBOutlet UILabel *scaffoldcellalbel;
@property(strong,nonatomic)IBOutlet UILabel *lengthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *heightcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *widthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *quantitycelllabel;
@property(strong,nonatomic)IBOutlet UILabel *elevationcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *manhourslabel;


/*outlets in addrecordview*/
@property(strong,nonatomic)IBOutlet UITextField *unittextfield;
@property(strong,nonatomic)IBOutlet UITextField *equipmenttextfield;
@property(strong,nonatomic)IBOutlet UITextField *proheadertextfield;
@property(strong,nonatomic)IBOutlet UIButton *scaffoldtyprbtn;
@property(strong,nonatomic)IBOutlet UITextField *lengthtextfield;
@property(strong,nonatomic)IBOutlet UITextField *heighttextfield;
@property(strong,nonatomic)IBOutlet UITextField *widthtextfield;
@property(strong,nonatomic)IBOutlet UITextField *qtytextfield;
@property(strong,nonatomic)IBOutlet UITextField *elevationtextfield;


/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;



/*arrays and Dicts*/
@property(strong,nonatomic)NSMutableArray *scaffoldingplanlistarray;
@property(strong,nonatomic)NSMutableArray *scaffoldtyperesultarray;
@property(strong,nonatomic)NSMutableDictionary *scaffoldtypeDict;
@property(strong,nonatomic)NSMutableDictionary *scaffoldidDict;
@property(strong,nonatomic)NSMutableArray *generallistarray;
@property(strong,nonatomic)NSMutableArray *newworkarray;
@property(strong,nonatomic)NSMutableArray * sequencearray;
@property(strong,nonatomic)NSMutableArray * phasearray;
@property(strong,nonatomic)NSMutableDictionary *sequencedict;
@property(strong,nonatomic)NSString *sequencestring;
@property(strong,nonatomic)NSMutableDictionary *phasedict;
@property(strong,nonatomic)NSString *phasestring;
@property(strong,nonatomic)NSMutableDictionary *phaseiddict;
@property(strong,nonatomic)NSMutableDictionary *sequenceiddict;

/*strings*/
@property(strong,nonatomic)NSString *scaffoldtypestring;
@property(strong,nonatomic)NSString *insertresultvalue;
@property(strong,nonatomic)NSString *planid;

@property (strong, nonatomic) IBOutlet UITextField *subunittextfld;
@property (strong, nonatomic) IBOutlet UIButton *phasebtn;
- (IBAction)SelectPhaseaction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sequencebtn;
- (IBAction)Sequenceselectaction:(id)sender;


-(void)navgteanimtn;
-(void)updatedata;


/*sqlite for sacffold insert*/
@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3 *scaffoldTypeDB;
@property (strong, nonatomic) NSString *scaffoldtypepath;
@property (strong, nonatomic) NSString *Availablityresult;

@property(nonatomic,readwrite) sqlite3 *scaffsequenceDB;
@property (strong, nonatomic) NSString *sequencepath;
@property(strong,nonatomic)NSString *sname;
@property(strong,nonatomic)NSString *sid;

@property(nonatomic,readwrite) sqlite3 *scaffPhaseDB;
@property (strong, nonatomic) NSString *phasepath;
@property(strong,nonatomic)NSString *pname;
@property(strong,nonatomic)NSString *pid;

@property(nonatomic,readwrite) sqlite3 *AllscaffoldDB;
@property (strong, nonatomic) NSString *ScaffoldPath;


@end
