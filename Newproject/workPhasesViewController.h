//
//  workPhasesViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "phasesmodel.h"
#import "WorktypeViewController.h"
#import "Rightscheck.h"
@interface workPhasesViewController : UIViewController<UITextFieldDelegate>
{
    NSInteger webtype;
    NSInteger poptype;
    NSInteger parentcheck;
    NSInteger path;
    BOOL recordresults;
    NSInteger optionIdentifier;
    UIButton *button;
    NSInteger btnindex;
    NSString *checkstring;
    NSString *userid;
    NSInteger x;
}
@property (strong, nonatomic)WorktypeViewController *worktypeVCtrl;

@property (strong, nonatomic) IBOutlet UILabel *updatelbl;
@property(strong,nonatomic)NSString *soapstring;
@property(strong,nonatomic)NSString *unitstring;
@property(strong,nonatomic)NSString *phasestring;
@property(strong,nonatomic)phasesmodel *phasemdl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Outlets*/
@property(strong,nonatomic)IBOutlet UITableView *phasetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *phasecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *workphasesview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;

@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;

/*IBActions*/
-(IBAction)closePhases:(id)sender;
-(IBAction)addworkPhasesview:(id)sender;
-(IBAction)editWorkPhasesview:(id)sender;
-(IBAction)closeworkphasesview:(id)sender;
-(IBAction)deletephases:(id)sender;

/*IBAction in view*/
-(IBAction)selectphases:(id)sender;
-(IBAction)selectservice:(id)sender;
//-(IBAction)parentbtn:(id)sender;
-(IBAction)update_phases:(id)sender;
-(IBAction)cancel_phases:(id)sender;

- (IBAction)wrkphasebtn:(id)sender;


/*outlet in view*/
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;
@property(strong,nonatomic)IBOutlet UIButton *phasebtn;
@property(strong,nonatomic)IBOutlet UIButton *parentbtn;
@property(strong,nonatomic)IBOutlet UITextField *phasetextfld;
@property(strong,nonatomic)IBOutlet UIButton *cancelbtn;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UILabel *servicelabel;
@property(strong,nonatomic)IBOutlet UILabel *underoflabel;
@property(strong,nonatomic)IBOutlet UIButton *parentbtncell;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*arrays &arrays*/
@property(strong,nonatomic)NSMutableArray *workphasesarray;
@property(strong,nonatomic)NSMutableArray *servicesarray;
@property(strong,nonatomic)NSMutableDictionary *servicedict;
@property(strong,nonatomic)NSMutableArray *phasesbasedonservicearray;
@property(strong,nonatomic)NSMutableDictionary *phasedict;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)NSString *result;

@end
