//
//  CmpnydocsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/13/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "commentmdl.h"
#import "Rightscheck.h"
@interface CmpnydocsViewController : UIViewController{
    BOOL recordResults;
    NSString *type;
    NSString *filename;
    UIButton *button;
    NSString *fileid;
    NSString *newfieldid;
    NSInteger poptype;

    NSInteger USerdocid;

}
@property(strong,nonatomic)NSString *searchstring;
@property(readwrite)NSInteger moduleid;
@property(strong,nonatomic)NSString *msgstring;
@property (strong, nonatomic)commentmdl *cmntmdl1;
@property (strong, nonatomic)NSMutableArray*commentarray;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmntcell;
@property (strong, nonatomic) IBOutlet UILabel *cmntlbl;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UILabel *cmttype;


@property (strong, nonatomic) IBOutlet UIView *cmmntview;

@property (strong, nonatomic) IBOutlet UITableView *cmmnttable;
@property (strong, nonatomic) IBOutlet UITextView *cmmnttxtview;

@property (strong, nonatomic) IBOutlet UIView *newcmntview;
- (IBAction)cmntsavebtn:(id)sender;

- (IBAction)cancelbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cmmntbtn;
- (IBAction)cmntbtn:(id)sender;
- (IBAction)addcmt:(id)sender;
- (IBAction)closebtn:(id)sender;


@property (strong, nonatomic)NSString *urlstring;
@property (strong, nonatomic)WebViewController *webVCtrl;
@property (strong, nonatomic) IBOutlet UILabel *docunamelbl;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *titleview;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *docutable;
@property (strong, nonatomic) IBOutlet UIButton *docutyebtn;
- (IBAction)docutypebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmpnydoccell;
- (IBAction)viewweb:(id)sender;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;

@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic)NSMutableArray*popoverArry;
@property (strong, nonatomic)NSMutableDictionary *popovrdict;
@property (strong, nonatomic)NSMutableArray*documntarray;
@property (strong, nonatomic)NSMutableDictionary *docdict;
@property (strong, nonatomic)NSMutableDictionary *fileiddict;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)Rightscheck *rights;

@property(strong,nonatomic)IBOutlet UIButton *savecmntbtn;
@property (strong, nonatomic) IBOutlet UITextView *Cmmntgtextview;



@end
