//
//  SitevisitViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SitevisitViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

/*uitabbaritems*/
@property (strong, nonatomic) IBOutlet UITabBar *firsttabbar;
@property (strong, nonatomic) IBOutlet UITabBar *secondtabbar;

@property (strong, nonatomic) IBOutlet UITabBarItem *genralitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *rateitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *docuitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *accesblity;

@property (strong, nonatomic) IBOutlet UITabBarItem *Estagareaitm;

@property (strong, nonatomic) IBOutlet UITabBarItem *meetgnotsitm;

@property (strong, nonatomic) IBOutlet UITabBarItem *equpmntiem;

@property (strong, nonatomic) IBOutlet UITabBarItem *wrkshedule;
@property (strong, nonatomic) IBOutlet UITabBarItem *biddersitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *weatheritm;

@property (strong, nonatomic) IBOutlet UITabBarItem *noteitm;

/*General View outlet*/
@property (strong, nonatomic) IBOutlet UIView *gernalview;
@property (strong, nonatomic) IBOutlet UITextField *companynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *loctntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptxtfld;
@property (strong, nonatomic) IBOutlet UIButton *complextyofwrkbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *facilitytxtview;
@property (strong, nonatomic) IBOutlet UITextView *scpeofwrktxtview;
- (IBAction)cmpxtyofwrkbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

/*productn Rate*/

@property (strong, nonatomic) IBOutlet UIView *rateview;

@property (strong, nonatomic) IBOutlet UITableViewCell *ratecell;
@property (strong, nonatomic) IBOutlet UILabel *ratelbl;
@property (strong, nonatomic) IBOutlet UILabel *ratedeslbl;
@property (strong, nonatomic) IBOutlet UITableView *prdunratetble;
@property (strong, nonatomic) IBOutlet UILabel *ratevaluelbl;
- (IBAction)ratedeletebtn:(id)sender;
- (IBAction)Rateaddbtn:(id)sender;
- (IBAction)celleditbtn:(id)sender;

/*Document view*/
@property (strong, nonatomic) IBOutlet UIView *docmntview;
@property (strong, nonatomic) IBOutlet UIButton *docutypebtnlbl;
@property (strong, nonatomic) IBOutlet UIImageView *picturepreviewimg;
- (IBAction)takepicturebtn:(id)sender;
- (IBAction)upadtepicturebtn:(id)sender;
- (IBAction)docutypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;

@property (strong, nonatomic) IBOutlet UITableView *documenttable;

/*Accebility view*/

@property (strong, nonatomic) IBOutlet UIView *accessview;
@property (strong, nonatomic) IBOutlet UITextView *accblitytxtview;
- (IBAction)accebilityupdate:(id)sender;


/*Equipment Staging area Views*/

@property (strong, nonatomic) IBOutlet UIView *equipmentview;

@property (strong, nonatomic) IBOutlet UITextView *equipmnttxtview;
- (IBAction)equpmntupdatebtn:(id)sender;

/*Jobsite Views*/
@property (strong, nonatomic) IBOutlet UIView *jobsiteview;
@property (strong, nonatomic) IBOutlet UITableView *jobsitetable;
@property (strong, nonatomic) IBOutlet UIView *jobsitetitleview;
- (IBAction)addnewjobsite:(id)sender;


/*safety views*/

@property (strong, nonatomic) IBOutlet UIView *safetyview;
@property (strong, nonatomic) IBOutlet UIView *safteytitleview;

@property (strong, nonatomic) IBOutlet UITableView *safetytableview;
- (IBAction)addsafetyrules:(id)sender;



/*Equipments views*/
@property (strong, nonatomic) IBOutlet UIView *neweqmntview;
@property (strong, nonatomic) IBOutlet UIView *neweqmnttitile;

@property (strong, nonatomic) IBOutlet UITableView *newequipmenttable;


- (IBAction)addnewequipment:(id)sender;


/*IBAction*/
-(IBAction)closesitevisit:(id)sender;
- (IBAction)generalbtn:(id)sender;

- (IBAction)prductnbtn:(id)sender;
- (IBAction)documntbtn:(id)sender;
- (IBAction)acceblitybtn:(id)sender;
- (IBAction)Equmntstgareabtn:(id)sender;
- (IBAction)jobsitebtn:(id)sender;
- (IBAction)safetybtn:(id)sender;
- (IBAction)newequipmentbtn:(id)sender;
- (IBAction)workschedulebtn:(id)sender;
- (IBAction)meetingnotesbtn:(id)sender;
- (IBAction)otherbiddersbtn:(id)sender;


@end
