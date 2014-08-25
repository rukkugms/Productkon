//
//  TimeSheetViewController.h
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCalendarView.h"
#import "jobsitemodel.h"
#import "Timesheetmdl.h"
#import "Rightscheck.h"
@interface TimeSheetViewController : UIViewController{
    
    NSInteger barbtntype;
    UIDatePicker *timePick;
    NSInteger btnclck;
      NSInteger btnclck1;
    BOOL  recordResults;
    NSString*jobnumber;
    NSInteger poptype;
     NSInteger poptype2;
    NSInteger selectedindex,webtype,newbarbutntype;
    
    NSString*formanname,*skillname,*phaseid,*purchseid,*workid,*jobsequceid,*jobdate;
    
}
@property(nonatomic, strong)Timesheetmdl*timesheetmdl;
@property(nonatomic, strong)jobsitemodel*jobmdl;
@property (strong, nonatomic)NSMutableArray*jobarray;
@property (strong, nonatomic)NSMutableArray*newjobarray;
@property (strong, nonatomic)NSMutableArray*skillarray,*timesheetarray,*equmntarray;

@property (strong, nonatomic)NSMutableDictionary *jobdict;
@property (strong, nonatomic)NSMutableDictionary *foremandict, *skilldict,*phasedict,*POdict,*WOdict,*sequcedict,*revphasedict;
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




@property (strong, nonatomic) IBOutlet UILabel *allemployeeslbl;
@property (strong, nonatomic) IBOutlet UILabel *foremanlbl;

- (IBAction)servicebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *timesheettable;
@property (strong, nonatomic) IBOutlet UIView *labortableview;
@property (strong, nonatomic) IBOutlet UIButton *jobnumberbtn;
@property (strong, nonatomic) IBOutlet UIButton *jobnumberbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *datebtnlbl;


@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *equipmnttableview;

@property (strong, nonatomic) IBOutlet UIView *otherstableview;
@property (strong, nonatomic) IBOutlet UIView *materialstableview;



@property (strong, nonatomic) IBOutlet UIButton *allemplyescheckbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *foremancheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *foremanbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *time1checkbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *time2checkbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *time1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *time2txtfld;
@property (strong, nonatomic) IBOutlet UIButton *phase1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequence1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *tagnumber1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *phase2btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequence2btnlbl;

@property (strong, nonatomic) IBOutlet UIButton *tagnumber2btnlbl;

@property (strong, nonatomic) IBOutlet UIButton *wo2btn;
@property (strong, nonatomic) IBOutlet UIButton *po2btnlbl;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *labrbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equpbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fleetbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *thirpfleetbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *tpebarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *materialbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *consumblebarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *othrsbarbtn;
@property (strong, nonatomic) IBOutlet UIButton *po1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *wo1btnlbl;

- (IBAction)wo1btn:(id)sender;

- (IBAction)po1btn:(id)sender;


- (IBAction)allemplysbtn:(id)sender;
- (IBAction)foremanbtn:(id)sender;
- (IBAction)formanselctn:(id)sender;
- (IBAction)time1btn:(id)sender;
- (IBAction)time2btn:(id)sender;
- (IBAction)phase1btn:(id)sender;
- (IBAction)sequence1btn:(id)sender;
- (IBAction)tagnumber1btn:(id)sender;
- (IBAction)phase2btn:(id)sender;
- (IBAction)sequence2btn:(id)sender;
- (IBAction)tagnumber2btn:(id)sender;



- (IBAction)laborbtn:(id)sender;
- (IBAction)equpbtn:(id)sender;
- (IBAction)fleetbtn:(id)sender;
- (IBAction)tpfbtn:(id)sender;

- (IBAction)tpebtn:(id)sender;
- (IBAction)materialsbtn:(id)sender;
- (IBAction)consumblesbtn:(id)sender;
- (IBAction)othrsbtn:(id)sender;
- (IBAction)wobt:(id)sender;

- (IBAction)PO2btn:(id)sender;


- (IBAction)applybtn:(id)sender;

- (IBAction)jobnumbrbtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)datebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;



@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *laborcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *labrequpcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *labrothrcell;



 /*labocell*/
@property (strong, nonatomic) IBOutlet UILabel *lbnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *craftlbl;
@property (strong, nonatomic) IBOutlet UILabel *lbdatelbl;
@property (strong, nonatomic) IBOutlet UILabel *lbtimeinlbl;
@property (strong, nonatomic) IBOutlet UILabel *lbtimeoutlbl;
@property (strong, nonatomic) IBOutlet UILabel *lbphasebtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *lbsewuncebtnlbl;

@property (strong, nonatomic) IBOutlet UILabel *lbtagbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *lbpolbl;
@property (strong, nonatomic) IBOutlet UILabel *lbwolbl;

/*Equpcell*/
@property (strong, nonatomic) IBOutlet UILabel *eqnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *eqdatelbl;
@property (strong, nonatomic) IBOutlet UILabel *eqtimeinlbl;
@property (strong, nonatomic) IBOutlet UILabel *eqtimeoutlbl;

@property (strong, nonatomic) IBOutlet UILabel *eqphaselbl;
@property (strong, nonatomic) IBOutlet UILabel *eqsequcelbl;
@property (strong, nonatomic) IBOutlet UILabel *eqpolbl;
@property (strong, nonatomic) IBOutlet UILabel *eqwolbl;
@property (strong, nonatomic) IBOutlet UILabel *eqtaglbl;

/*otherscell*/
@property (strong, nonatomic) IBOutlet UILabel *onamelbl;
@property (strong, nonatomic) IBOutlet UILabel *oamuntlbl;

@property (strong, nonatomic) IBOutlet UILabel *odate;
@property (strong, nonatomic) IBOutlet UILabel *ophase;
@property (strong, nonatomic) IBOutlet UILabel *osequnce;
@property (strong, nonatomic) IBOutlet UILabel *otag;
@property (strong, nonatomic) IBOutlet UILabel *opolbl;
@property (strong, nonatomic) IBOutlet UILabel *owolbl;


@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@end
