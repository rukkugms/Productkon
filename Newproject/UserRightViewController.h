//
//  UserRightViewController.h
//  Newproject
//
//  Created by Riya on 8/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserRightViewController : UIViewController{
     BOOL recordResults;
    NSString*userid;
    NSInteger popover;
    NSString* mainid;
      NSString* subid;
     NSString* subsubid;
  NSInteger path;
    NSInteger userpath;
}


@property(strong,nonatomic)NSMutableDictionary*userdict;
@property(strong,nonatomic)NSMutableArray*userarray;
@property(strong,nonatomic)NSMutableArray*maintilearray;
@property(strong,nonatomic)NSMutableDictionary*maintiledict;
@property(strong,nonatomic)NSMutableArray*subtilearray;
@property(strong,nonatomic)NSMutableDictionary*subtiledict;
@property(strong,nonatomic)NSMutableArray*subsubtilearray;
@property(strong,nonatomic)NSMutableDictionary*subsubtiledict;

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



- (IBAction)clsebtn:(id)sender;
- (IBAction)userbtn:(id)sender;
- (IBAction)masterbtn:(id)sender;
- (IBAction)subbtn:(id)sender;
- (IBAction)subsubbtn:(id)sender;
- (IBAction)allviewcheckbtn:(id)sender;
- (IBAction)alleditcheckbtn:(id)sender;
- (IBAction)Alldeletecheckbtn:(id)sender;
- (IBAction)Allprintcheckbtn:(id)sender;

@end
