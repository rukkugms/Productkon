//
//  GpFleetViewController.h
//  Newproject
//
//  Created by Riya on 11/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equpmntmdl.h"
#import "Crewmodel.h"
#import "FleetsViewController.h"


@interface GpFleetViewController : UIViewController{
    
    
    NSInteger poptype,webtype,setuptype;
     BOOL recordResults;
    NSString*skill,*crewid,*msgstrg,*msgstrg1,*existstring;
   NSInteger Deletepath,clear,crewpath;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
   
    
}
@property(strong,nonatomic)FleetsViewController *fleetVCtrl;
@property(strong,nonatomic) Equpmntmdl*eqmdl;

@property(strong,nonatomic)Crewmodel*crewmdl1;
/*Arrays*/
@property(strong,nonatomic)NSMutableArray*skillarray;
@property(strong,nonatomic)NSMutableArray*fleetarray;
@property(strong,nonatomic)NSMutableArray*crewnamearray;
@property(strong,nonatomic)NSMutableArray*crewmembersarray;

/*Dicts*/

@property(strong,nonatomic)NSMutableDictionary*skilldict;
@property(strong,nonatomic)NSMutableDictionary*crewdict;
@property(strong,nonatomic)NSMutableDictionary*revcrewdict;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*Outlets*/
@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;
@property (strong, nonatomic) IBOutlet UITableView *fleettable;
@property (strong, nonatomic) IBOutlet UITextField *crewtextfld;
@property (strong, nonatomic) IBOutlet UIButton *crewbtnlbl;
@property (strong, nonatomic) IBOutlet UITableView *groupfleettable;

@property (strong, nonatomic) IBOutlet UIView *touchview;

/*cell1outlets*/

@property (strong, nonatomic) IBOutlet UILabel *itemcodelbl;
@property (strong, nonatomic) IBOutlet UILabel *fdeslbl;
@property (strong, nonatomic) IBOutlet UILabel *fhourslbl;


@property (strong, nonatomic) IBOutlet UITableViewCell *fleetcell;

/*cell2outlets*/


@property (strong, nonatomic) IBOutlet UITableViewCell *Gpfleetcell;

@property (strong, nonatomic) IBOutlet UILabel *Gpitemlbl;

@property (strong, nonatomic) IBOutlet UILabel *Gpdeslbl;

@property (strong, nonatomic) IBOutlet UILabel *crewnamelbl;

/*Actions*/
- (IBAction)servicebtn:(UIButton *)sender;
- (IBAction)crewbtn:(id)sender;
- (IBAction)detetegpbtn:(UIButton *)sender;
- (IBAction)savecrewbtn:(UIButton *)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)deleteallbtn:(id)sender;

@end
