//
//  UserRightViewController.h
//  Newproject
//
//  Created by Riya on 8/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserRightsmdl.h"
#import "Rightscheck.h"

@interface UserRightViewController : UIViewController{
     BOOL recordResults;
    int j;
    NSString*userid;
    NSInteger popover;
    NSString* mainid;
      NSString* subid;
     NSString* subsubid;
     NSInteger path,subsubpath,subpath,mastrpath;
    NSInteger userpath;
    UIButton *button;
    NSInteger btnclck,btnclck1,btnclck2,btnclck3;
    NSInteger btnindex;
    NSInteger viewcheck,editcheck,deletecheck,printcheck;
    NSInteger viewclck,editclck,deleteclck,printclck;
    
    NSInteger checkviewstrg,checkeditstrg,checkdeletestrg,checkprintstrg;
    NSInteger Allviewclckd,Alleditclckd,Alldeleteclckd,Allprintclckd;
    
    NSString*subbtnstrg,*masterbtnstrg,*subsubbtnstrg;
    
    NSInteger webtype,optnidntfr;
    NSInteger activate,msgcount,tileschecking;
  
}

@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)NSMutableDictionary*userdict;
@property(strong,nonatomic)NSMutableArray*userarray;
@property(strong,nonatomic)NSMutableDictionary*revuserdict;

@property(strong,nonatomic)NSMutableArray*maintilearray;
@property(strong,nonatomic)NSMutableDictionary*maintiledict;
@property(strong,nonatomic)NSMutableDictionary*revmaintiledict;
@property(strong,nonatomic)NSMutableArray*subtilearray;
@property(strong,nonatomic)NSMutableDictionary*subtiledict;
@property(strong,nonatomic)NSMutableDictionary*revsubtiledict;
@property(strong,nonatomic)NSMutableArray*subsubtilearray;
@property(strong,nonatomic)NSMutableDictionary*subsubtiledict;
@property(strong,nonatomic)NSMutableDictionary*revsubsubtiledict;
@property(strong,nonatomic)NSMutableArray*usertablearray;


@property(strong,nonatomic)UserRightsmdl*usermdl;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;

@property(strong,nonatomic)UITableView *popOverTableView;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*Outlets*/
@property (strong, nonatomic) IBOutlet UIButton *userbtn;
@property (strong, nonatomic) IBOutlet UIButton *masterbtn;

@property (strong, nonatomic) IBOutlet UIButton *subbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *subsubbtnlbl;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *usertable;
@property (strong, nonatomic) IBOutlet UITableViewCell *usercell;
@property (strong, nonatomic) IBOutlet UIButton *Allviewbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *Alleditbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *Alldeletebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *Allprintbtnlbl;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *namelbl;
@property (strong, nonatomic) IBOutlet UILabel *companylbl;

@property (strong, nonatomic) IBOutlet UIButton *viewbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *editbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *deletebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *printbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *activatebtnlbl;



- (IBAction)activatebtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)userbtn:(id)sender;
- (IBAction)masterbtn:(id)sender;
- (IBAction)subbtn:(id)sender;
- (IBAction)subsubbtn:(id)sender;
- (IBAction)allviewcheckbtn:(id)sender;
- (IBAction)alleditcheckbtn:(id)sender;
- (IBAction)Alldeletecheckbtn:(id)sender;
- (IBAction)Allprintcheckbtn:(id)sender;

- (IBAction)viewbtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)printbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *newbtn;

- (IBAction)newbtn:(id)sender;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@property (strong, nonatomic) IBOutlet UIView *editview;

- (IBAction)updatebtn:(id)sender;


//@property (strong, nonatomic) IBOutlet UIButton *editbtn;
- (IBAction)celleditbtn:(id)sender;

- (IBAction)editclsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *editnamelbl;

@property (strong, nonatomic) IBOutlet UIButton *editviewbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *editeditbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *editdeletebtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *editprintbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *editupdatebtnlbl;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actvtybtn;

@end
