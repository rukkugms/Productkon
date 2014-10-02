//
//  GroupEqupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/23/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Crewmodel.h"
#import "Rightscheck.h"
@interface GroupEqupViewController : UIViewController<UIGestureRecognizerDelegate>{
    
     NSInteger poptype;
    BOOL recordResults;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    //NSInteger path;
    NSInteger Deletepath;
     NSInteger crewpath;
    int webpath;
    NSString *skill;
    NSString * crewid;


    
}

@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;

@property (strong, nonatomic)NSMutableArray *crewmembersarray;
@property (strong, nonatomic)NSMutableArray *equipmentarray;
@property (strong, nonatomic)NSMutableArray *crenamearray;
@property (strong, nonatomic)NSMutableArray *skillarray;
@property (strong, nonatomic)NSMutableDictionary *skilldict;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UITextField *crewnametxtfld;
@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *crewbtnlbl;

@property (strong, nonatomic) IBOutlet UITableView *equpmenttable;
@property (strong, nonatomic) IBOutlet UITableView *crewtable;

@property (strong, nonatomic) IBOutlet UILabel *manpwritmlbl;
@property (strong, nonatomic) IBOutlet UILabel *manpwrdeslbl;
@property (strong, nonatomic) IBOutlet UILabel *hurlyratelbl;
@property (strong, nonatomic) IBOutlet UILabel *crwmanpwrlbl;
@property (strong, nonatomic) IBOutlet UILabel *crwdeslbl1;
@property (strong, nonatomic) IBOutlet UILabel *crwdeslbl2;
@property (strong, nonatomic) IBOutlet UITableViewCell *crewcell;

@property (strong, nonatomic) IBOutlet UITableViewCell *equpcell;
/*buttons*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)clearbtn:(id)sender;

- (IBAction)deletebtn:(id)sender;
- (IBAction)servicebtn:(id)sender;
- (IBAction)savebtn:(id)sender;

- (IBAction)crewbtn:(id)sender;
- (IBAction)alldeletebtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;
@property(strong,nonatomic)NSString *deletegpstring;
@property(strong,nonatomic)NSString *deleteitemstring;
@end
