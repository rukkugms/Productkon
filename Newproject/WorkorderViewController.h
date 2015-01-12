//
//  WorkorderViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workordrmdl.h"
#import "CKCalendarView.h"
#import "Purchsemdl.h"

@interface WorkorderViewController : UIViewController{
     BOOL  recordResults;
    NSInteger btnindex,webtype,optnidnfr;
    
}
@property (strong, nonatomic)Purchsemdl *purchsemdl;
@property (strong, nonatomic)NSString *jobid;
@property (strong, nonatomic)NSMutableArray*Workarray;
@property (strong, nonatomic)NSMutableArray*purchasearray;
@property (strong, nonatomic) Workordrmdl *Workmdl;
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

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UILabel *numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *polbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *workcell;

- (IBAction)editbtnlbl:(id)sender;
- (IBAction)clsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *addview;

@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *numbrtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *pobtnlbl;
- (IBAction)datebtn:(id)sender;
- (IBAction)pobtn:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;
- (IBAction)addclsebtn:(id)sender;

- (IBAction)updatebtn:(id)sender;

@end
