//
//  GpMaterViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Crewmodel.h"
#import "Rightscheck.h"

@interface GpMaterViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSInteger poptype;
    BOOL recordResults;
    
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
     NSString *skill;
    NSInteger webpath;
    NSString * crewid;
    NSInteger crewpath;
    NSInteger Deletepath;
}

@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


-(IBAction)closethepage:(id)sender;
- (IBAction)servicebtn:(id)sender;
- (IBAction)groupbtnselect:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)clearbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)alldeletebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *groupbtn;
@property (strong, nonatomic) IBOutlet UITextField *crewnametxtfld;

@property (strong, nonatomic) IBOutlet UILabel *materialitemlabel;
@property (strong, nonatomic) IBOutlet UILabel *matdesclabel;
@property (strong, nonatomic) IBOutlet UILabel *hourlylabel;

@property (strong, nonatomic) IBOutlet UILabel *crewitemlabel;
@property (strong, nonatomic) IBOutlet UILabel *crewdesclabel;
@property (strong, nonatomic) IBOutlet UILabel *crewnamelabel;


/*array&array*/
@property (strong, nonatomic)NSMutableArray *skillarray;
@property (strong, nonatomic)NSMutableArray *gpnamearray;
@property (strong, nonatomic)NSMutableDictionary *skilldict;
@property (strong, nonatomic)NSMutableArray *materialarray;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
@property (strong, nonatomic)NSMutableArray *crewmembersarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*table&cell*/
@property (strong, nonatomic) IBOutlet UITableView *materailtable;
@property (strong, nonatomic) IBOutlet UITableView *crewnametable;
@property (strong, nonatomic) IBOutlet UITableViewCell *materialcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *crenamecell;


/*draganddrop*/
@property (strong, nonatomic) IBOutlet UIView *touchview;


@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)NSString *deletegpstring;
@property(strong,nonatomic)NSString *deleteitemstring;

@end
