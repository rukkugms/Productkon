//
//  IssuesViewController.h
//  Newproject
//
//  Created by Riya on 6/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Issuemdl.h"
#import "CKCalendarView.h"
#import "RelatedtoViewController.h"
#import "Rightscheck.h"
#import "commentmdl.h"
@interface IssuesViewController : UIViewController{
    
     BOOL  recordResults;
    NSString*jobnumber;
    NSInteger poptype;
    UIButton*button;
    NSInteger btntype;
     NSInteger btnindex;
 UIDatePicker *timePick;
}

@property(strong,nonatomic)RelatedtoViewController*relatedtoVCtrl;
@property(strong,nonatomic)Issuemdl*issuemdl;
@property(strong,nonatomic)NSMutableArray*Issuearray;
@property(strong,nonatomic)NSMutableArray*jobarray;
@property(strong,nonatomic)NSMutableArray*statusarray;
@property(strong,nonatomic)NSMutableArray*Typearray;
@property(strong,nonatomic)NSMutableDictionary*typedict;
@property(strong,nonatomic)NSMutableDictionary*revtypedict;
@property(strong,nonatomic)NSMutableDictionary*jobdict;
@property(strong,nonatomic)NSMutableDictionary*revjobdict;

@property (strong, nonatomic) IBOutlet UIButton *updatebtnlbl;

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

@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic)NSString*searchstring;



/*Outlets*/
@property (strong, nonatomic) IBOutlet UIButton *jobsitebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *typebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *statusbtnlbl;

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;
@property (strong, nonatomic) IBOutlet UITableView *issuetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *issuecell;
@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;

@property (strong, nonatomic) IBOutlet UILabel *numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *cmmtlbl;

@property (strong, nonatomic) IBOutlet UILabel *statuslbl;

@property (strong, nonatomic) IBOutlet UITextView *cmmttxtview;
@property (strong, nonatomic) IBOutlet UITextField *datetxtfld;
- (IBAction)datebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *timebtn;
- (IBAction)tymbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtnlbl;

- (IBAction)jobsitebtn:(id)sender;
- (IBAction)typebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)editbtn:(id)sender;
- (IBAction)addclsebtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)statusbtn:(id)sender;
- (IBAction)relatedtobtn:(id)sender;


@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@property (strong, nonatomic)commentmdl *cmntmdl1;
@property (strong, nonatomic)NSMutableArray*commentarray;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmntcell;
@property (strong, nonatomic) IBOutlet UITextView *cmmntcelltxtview;
@property (strong, nonatomic) IBOutlet UILabel *cmntlbl;

@property(strong,nonatomic)IBOutlet UIButton *savecmntbtn;
@property (strong, nonatomic) IBOutlet UITextView *Cmmntgtextview;
@property (strong, nonatomic) IBOutlet UIView *cmmntview;

@property (strong, nonatomic) IBOutlet UITableView *cmmnttable;


@property (strong, nonatomic) IBOutlet UIView *newcmntview;
- (IBAction)cmntsavebtn:(id)sender;
- (IBAction)cancelcmnt:(id)sender;
- (IBAction)closecmnt:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *cmmntbtn;

- (IBAction)cmntbtn:(id)sender;
- (IBAction)addcmt:(id)sender;


@end
