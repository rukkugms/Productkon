//
//  AbsentViewController.h
//  Newproject
//
//  Created by Riya on 7/3/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Absentmdl.h"
#import "CKCalendarView.h"
@interface AbsentViewController : UIViewController{
    UIButton*button;
    NSInteger btnclck;
    NSInteger check;
    BOOL recordResults;
    NSString*empdate;
    NSInteger webtype;
    NSInteger btnindex,touchedpath;
    
}
@property(nonatomic, strong) NSString*curntdate;
/*calendar*/
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


@property (strong, nonatomic) Absentmdl*absentmdl;
@property (strong, nonatomic)NSMutableArray*absentarray;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;

@property (strong, nonatomic) IBOutlet UIView *titleview;

@property (strong, nonatomic) IBOutlet UITableView *absenttable;

@property (strong, nonatomic) IBOutlet UITableViewCell *absentcell;
@property (strong, nonatomic) IBOutlet UILabel *jobsitelbl;
@property (strong, nonatomic) IBOutlet UILabel *empnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;

- (IBAction)datebtn:(id)sender;
- (IBAction)checkbtn:(id)sender;
- (IBAction)button:(id)sender;

@end
