//
//  DequipViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equpmntmdl.h"
#import "Drageqmodel.h"
#import "Validation.h"

@interface DequipViewController : UIViewController<UIGestureRecognizerDelegate>

{
    NSInteger btnindex;
    UIButton *equipbtn;
    NSInteger webtype;
    NSInteger eqdeletepath;
    BOOL recordResults;
    BOOL equipdragFromSource;     // used for reodering
    NSInteger equippath;
    UIView* equipdropArea;
    id  equipdraggedData;
    NSMutableArray* equipsrcData;
    NSMutableArray*equipdstData;
    NSIndexPath*   equippathFromDstTable;
    UITableViewCell*equipdraggedCell;
    /*for check*/
    NSInteger hcheck;
    NSInteger dcheck;
    NSInteger wcheck;
    NSInteger mcheck;
    
     NSString * crewid;
    NSString *planhours;
    
}

- (IBAction)clsbtn:(id)sender;



/*equipment*/
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)Equpmntmdl *eqmdl;
@property(strong,nonatomic)Drageqmodel *dmdl;
@property(strong,nonatomic)NSString *generalid;
@property(strong,nonatomic)NSString *result;
- (IBAction)closeequip:(id)sender;
- (IBAction)deleteequip:(id)sender;
- (IBAction)editequip:(id)sender;
- (IBAction)closeequipeditview:(id)sender;
- (IBAction)updateequip:(id)sender;
- (IBAction)hratecheckaction:(id)sender;
-(IBAction)dratecheckaction:(id)sender;
-(IBAction)wratecheckaction:(id)sender;
-(IBAction)mratecheckaction:(id)sender;
/*checkbtnstring*/
@property(strong,nonatomic)NSString *hratecheck;
@property(strong,nonatomic)NSString *dratecheck;
@property(strong,nonatomic)NSString *wratecheck;
@property(strong,nonatomic)NSString *mratecheck;
@property(strong,nonatomic)IBOutlet UIView *equipsrctitleview;
@property(strong,nonatomic)IBOutlet UIView *equipdesttitleview;


@property(strong,nonatomic)IBOutlet UIView *equipeditview;
@property(strong,nonatomic)IBOutlet UIView *equiptouchview;
@property(strong,nonatomic)IBOutlet UITableView *equipsourcetable;
@property(strong,nonatomic)IBOutlet UITableView *equipdesttable;
@property(strong,nonatomic)IBOutlet UITableViewCell *equipsourcecell;
@property(strong,nonatomic)IBOutlet UITableViewCell *equipdestcell;
@property(strong,nonatomic)IBOutlet UILabel *equipitemlabel;
@property(strong,nonatomic)IBOutlet UILabel *equideslabel;
@property(strong,nonatomic)IBOutlet UILabel *equipitemdestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equipdescdestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equipquantdestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equiphratedestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equipdratedestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equipwratedestlabel;
@property(strong,nonatomic)IBOutlet UILabel *equipmratedestlabel;


@property(strong,nonatomic)IBOutlet UITextField *equipitemcodetextfield;
@property(strong,nonatomic)IBOutlet UITextField *equipitemdesctextfield;
@property(strong,nonatomic)IBOutlet UITextField *equipqtytextfield;
@property(strong,nonatomic)IBOutlet UIButton *hratecheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *dratecheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *wratecheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *mratecheckbutton;

@property(strong,nonatomic)IBOutlet UIButton *hratecellcheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *dratecellcheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *wratecellcheckbutton;
@property(strong,nonatomic)IBOutlet UIButton *mratecellcheckbutton;




@property(strong,nonatomic)NSMutableArray *equipsrcarray;
@property(strong,nonatomic)NSMutableArray *equipdestarray;

@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
@property (strong, nonatomic)NSMutableArray *crenamearray;



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser     *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData   * webData;
@property(strong,nonatomic)IBOutlet UIButton *EQdgupdate;

@end

