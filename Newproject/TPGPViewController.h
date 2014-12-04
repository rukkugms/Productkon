//
//  TPGPViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 27/11/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Crewmodel.h"
#import "ThirdPartyViewController.h"
@interface TPGPViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSInteger poptype;
    BOOL recordResults;
    NSString *skill;
    NSString *crewid;
    NSInteger deletepath;
    NSInteger clear;
    NSInteger webpath;
     NSInteger setuptype;
     NSInteger crewpath;
   
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
}
@property(strong,nonatomic)ThirdPartyViewController *thirdVCtrl;
@property(strong,nonatomic)NSString *deletegpstring;
@property(strong,nonatomic)NSString *existingstring;
@property(strong,nonatomic)NSString *deleteitemstring;
@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UITableView *thirdfirsttable;
@property (strong, nonatomic) IBOutlet UITableView *thirdsectable;
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;
@property(strong,nonatomic)IBOutlet UIButton *tpgpbtn;
@property(strong,nonatomic)IBOutlet UITableViewCell *tpfirstcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *tpseccell;
@property(strong,nonatomic)IBOutlet UITextField *tpgpnametextfield;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*firstcell*/
@property(strong,nonatomic)IBOutlet UILabel *firstitemlabel;
@property(strong,nonatomic)IBOutlet UILabel *firstdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *firstunitcostlabel;

/*firstcell*/
@property(strong,nonatomic)IBOutlet UILabel *secitemlabel;
@property(strong,nonatomic)IBOutlet UILabel *secdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *seccrewnamelabel;

/*IBActions*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)deleteallitems:(id)sender;

- (IBAction)deletegpaction:(id)sender;
- (IBAction)serviceselection:(id)sender;
- (IBAction)savebtn:(id)sender;

- (IBAction)tpgpselection:(id)sender;
- (IBAction)Deleterowitem:(id)sender;

/*Arrays *Dictionaries*/
@property(strong,nonatomic)NSMutableArray *thirdfirstarray;
@property(strong,nonatomic)NSMutableArray *thirdsecarray;
@property(strong,nonatomic)NSMutableArray *Servicelistarray;
@property(strong,nonatomic)NSMutableArray *gplistarray;
@property(strong,nonatomic)NSMutableDictionary *servicedict;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;

@end
