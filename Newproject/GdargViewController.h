//
//  GdargViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/22/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
#import "Gmandrgmdl.h"
#import <QuartzCore/QuartzCore.h>
#import "Metgenmdl.h"
#import "Validation.h"

@interface GdargViewController : UIViewController<UIGestureRecognizerDelegate>{
     BOOL recordResults;
    
 /*MANPOWR DRAG*/
    UITableViewCell*   mandraggedCell;
    UIView*              mandropArea;
    id                   mandraggedData;
    
    BOOL             mandragFromSource;     // used for reodering
    NSIndexPath*     manpathFromDstTable;
    
    /*MATERIAL DRAG*/
    UITableViewCell*   materldraggedCell;
    UIView*              materldropArea;
    id                   materldraggedData;
    
    BOOL             materldragFromSource;     // used for reodering
    NSIndexPath*     materlpathFromDstTable;


    NSInteger deletepath;
    NSInteger path;
      NSInteger materialpath;
    NSInteger editpath;
  NSInteger meteditpath;
    UIButton *button;
    
    NSInteger metdeletepath;
    NSString *crewid;
    NSInteger hourtype;
    
}

@property (strong, nonatomic) IBOutlet UIView *mantabletitle;
@property (strong, nonatomic) IBOutlet UIView *genraltabletitle;

@property (strong, nonatomic) IBOutlet UIView *matrltabletitle;
@property (strong, nonatomic) IBOutlet UIView *resurcetabletitle;

@property (strong, nonatomic) IBOutlet UIView *materialview;
@property (strong, nonatomic) IBOutlet UIView *manpowerview;

@property (strong, nonatomic) IBOutlet UIView *editview;

@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;

@property(readwrite)NSInteger dragbtnindx;
@property(readwrite)NSInteger  generalid;
@property(strong,nonatomic)Manpwr *manpwr1;
@property(strong,nonatomic)Gmandrgmdl *gmdl;
@property(strong,nonatomic)Metgenmdl*matrlmdl;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser     *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData   * webData;

/*arrays*/
@property(strong,nonatomic)NSMutableDictionary *matrlcrewdict;
@property(strong,nonatomic)NSMutableArray *manpowerarray;
@property(strong,nonatomic)NSMutableArray *generaldetailarray;
@property(strong,nonatomic)NSMutableArray *materialarray;
@property(strong,nonatomic)NSMutableArray *resourcearray;
@property(strong,nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
@property(strong,nonatomic)NSMutableArray *crewnamearray;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UITableView *manpwrtable;
@property (strong, nonatomic) IBOutlet UITableViewCell *firstcell;
@property (strong, nonatomic) IBOutlet UILabel *manpwr1lbl;
@property (strong, nonatomic) IBOutlet UILabel *mandesc1lbl;

@property (strong, nonatomic) IBOutlet UITableView *generaltable;
@property (strong, nonatomic) IBOutlet UITableViewCell *secondcell;


@property (strong, nonatomic) IBOutlet UILabel *manpwr2lbl;
@property (strong, nonatomic) IBOutlet UILabel *mandesptn2lbl;
@property (strong, nonatomic) IBOutlet UILabel *numberlbl;
@property (strong, nonatomic) IBOutlet UILabel *hurslbl;


@property (strong, nonatomic) IBOutlet UIView *manpwrdragview;
@property (strong, nonatomic) IBOutlet UITextField *manpwrtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *descptntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *numbertxtfld;
@property (strong, nonatomic) IBOutlet UITextField *hourstxtfld;



- (IBAction)clsbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)editclsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)editbtn:(id)sender;


@property (strong, nonatomic) IBOutlet UITableView *materialtable;

@property (strong, nonatomic) IBOutlet UITableView *resourcegenraltable;


@property (strong, nonatomic) IBOutlet UIView *matraltouchview;
@property (strong, nonatomic) IBOutlet UILabel *codelbl1;
@property (strong, nonatomic) IBOutlet UILabel *matrldesc1lbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *materialcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *resurcecell;
@property (strong, nonatomic) IBOutlet UILabel *code2lbl2;

@property (strong, nonatomic) IBOutlet UILabel *matraldes2lbl;


@property (strong, nonatomic) IBOutlet UILabel *quantylbl;



@property (strong, nonatomic) IBOutlet UIView *materleditview;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *quantitytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *matrldesctxtfld;


- (IBAction)matrlupdatebtn:(id)sender;

- (IBAction)editmatrlbtn:(id)sender;


- (IBAction)mateditbtn:(id)sender;
- (IBAction)metdeltebtn:(id)sender;

@property(strong,nonatomic)IBOutlet UIButton *MPdgUpdate;
@property(strong,nonatomic)IBOutlet UIButton *MTdgupdate;



@end
