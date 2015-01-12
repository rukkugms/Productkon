//
//  PurchaseViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Purchsemdl.h"
#import "CKCalendarView.h"
@interface PurchaseViewController : UIViewController{
    
 BOOL  recordResults;
    UIButton *button;
    NSInteger btnindex,optnidnfr,path;




}
@property (strong, nonatomic)NSString *jobid;
@property (strong, nonatomic)Purchsemdl *purchsemdl;
@property (strong, nonatomic)NSMutableArray *purchsearray;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
/*calendar*/
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*Outlets*/
@property (strong, nonatomic) IBOutlet UITableView *purchsetable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableViewCell *puchsecell;
@property (strong, nonatomic) IBOutlet UILabel *numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *numbrtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *datetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *addclsebtn;

- (IBAction)updatebtn:(id)sender;
- (IBAction)addclose:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletbtn:(id)sender;
- (IBAction)clsebtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)datebtn:(id)sender;

@end
