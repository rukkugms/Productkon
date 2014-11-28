//
//  SmallgpViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 28/11/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Crewmodel.h"

@interface SmallgpViewController : UIViewController<UIGestureRecognizerDelegate>
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


@property(strong,nonatomic)NSString *deletegpstring;
@property(strong,nonatomic)NSString *existingstring;
@property(strong,nonatomic)NSString *deleteitemstring;
@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UITableView *smallfirsttable;
@property (strong, nonatomic) IBOutlet UITableView *smallsectable;
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;
@property(strong,nonatomic)IBOutlet UIButton *smallgpbtn;
@property(strong,nonatomic)IBOutlet UITableViewCell *smallfirstcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *smallseccell;
@property(strong,nonatomic)IBOutlet UITextField *smallgpnametextfield;

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

- (IBAction)smallgpselection:(id)sender;
- (IBAction)Deleterowitem:(id)sender;

/*Arrays *Dictionaries*/
@property(strong,nonatomic)NSMutableArray *smallfirstarray;
@property(strong,nonatomic)NSMutableArray *smallsecarray;
@property(strong,nonatomic)NSMutableArray *Servicelistarray;
@property(strong,nonatomic)NSMutableArray *gplistarray;
@property(strong,nonatomic)NSMutableDictionary *servicedict;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;

@end
