//
//  GPsafetyViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 14/02/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Crewmodel.h"
#import "SafetyViewController.h"

@interface SDPViewController : UIViewController<UIGestureRecognizerDelegate>
{
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    
    BOOL recordResults;
    NSInteger poptype;
    NSInteger webpath;
    NSString *skill;
    NSInteger deletepath;
    NSInteger crewpath;
    NSInteger setuptype;
    NSString *crewid;
      NSInteger clear;
}
@property (strong, nonatomic)NSString *existingstring;
@property (strong, nonatomic)NSString *deletegpstring;
@property (strong, nonatomic)NSString *deleteitemstring;
@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;
@property (strong, nonatomic)SafetyViewController *safetyctrl;

- (IBAction)safetygpselection:(id)sender;
- (IBAction)deletesafetygpaction:(id)sender;
- (IBAction)deleteallsafetyitems:(id)sender;
- (IBAction)deletesafetysingleitem:(id)sender;
- (IBAction)closesafetyform:(id)sender;
- (IBAction)createsafetygp:(id)sender;
- (IBAction)serviceselection:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *saftygpbtn;
@property (strong, nonatomic) IBOutlet UIButton *servicebtn;
@property (strong, nonatomic) IBOutlet UITextField *saftygptextfield;
@property (strong, nonatomic) IBOutlet UITableView *Secondsafetyttable;
@property (strong, nonatomic) IBOutlet UITableView *firstsafetytable;
@property(strong,nonatomic)IBOutlet UITableViewCell *firstcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *seccell;
@property (strong, nonatomic) IBOutlet UIView *touchview;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Arrays *Dictionaries*/
@property(strong,nonatomic)NSMutableArray *firstsafetyarray;
@property(strong,nonatomic)NSMutableArray *secsafetyarray;
@property(strong,nonatomic)NSMutableArray *Servicelistarray;
@property(strong,nonatomic)NSMutableArray *gplistarray;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
@property(strong,nonatomic)NSMutableDictionary *servicedict;

/*firstcell*/
@property(strong,nonatomic)IBOutlet UILabel *firstitemlabel;
@property(strong,nonatomic)IBOutlet UILabel *firstdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *firstunitcostlabel;

/*firstcell*/
@property(strong,nonatomic)IBOutlet UILabel *secitemlabel;
@property(strong,nonatomic)IBOutlet UILabel *secdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *seccrewnamelabel;



@end
