//
//  CrewsetupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/5/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Manpwr.h"
#import "Crewmodel.h"
#import "Rightscheck.h"
#import "ManViewController.h"

@interface CrewsetupViewController : UIViewController<UIGestureRecognizerDelegate>{
    BOOL recordResults;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    //NSInteger path;
    NSInteger Deletepath;
    int webpath;
    NSString *skill;
    NSInteger poptype;
     NSString * crewid;
    NSInteger crewpath;
    NSInteger setuptype;
    NSInteger clear;

}
@property(strong,nonatomic)ManViewController *manctrl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)Crewmodel *crewmdl1;
@property (strong, nonatomic)NSMutableArray *crewmembersarray;
@property (strong, nonatomic)NSMutableArray *manpwrarray;
@property (strong, nonatomic)NSMutableArray *autocompltearray;
@property (strong, nonatomic)NSMutableArray *crenamearray;
@property (strong, nonatomic)NSMutableArray *skillarray;
@property (strong, nonatomic)NSMutableDictionary *skilldict;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UILabel *manpwritmlbl;
@property (strong, nonatomic) IBOutlet UILabel *manpwrdeslbl;
@property (strong, nonatomic) IBOutlet UITextField *crewnametxtfld;
@property (strong, nonatomic) IBOutlet UILabel *crwmanpwrlbl;
@property (strong, nonatomic) IBOutlet UILabel *crwdeslbl1;
@property (strong, nonatomic) IBOutlet UILabel *crwdeslbl2;


/*table&cell*/
@property (strong, nonatomic) IBOutlet UITableView *manpwrtable;
@property (strong, nonatomic) IBOutlet UITableView *crewnametable;
@property (strong, nonatomic) IBOutlet UITableViewCell *crewnamecell;
@property (strong, nonatomic) IBOutlet UITableViewCell *manpwrcell;
@property (nonatomic, retain) UITableView *autocompleteTableView;

@property (strong, nonatomic) IBOutlet UILabel *hurlyratelbl;
@property (strong, nonatomic) IBOutlet UIButton *savebtnlbl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *crewbtnlbl;

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

@property(strong,nonatomic)NSString *existstring;
@end
