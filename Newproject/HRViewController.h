//
//  HRViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "VerificationViewController.h"
#import "UploadDocViewController.h"
#import "Empdetails.h"
#import "SectionHeaderView.h"


@interface HRViewController : UIViewController<SectionHeaderViewDelegate>{
    BOOL recordResults;
    NSString *imgString;
   
    int x;
    SectionHeaderView*prcessectn;
    NSInteger btntouch;
      NSInteger chektouch;
    NSString *jobstring;
    NSInteger selectedsectn;
    NSInteger btnindex;
    UIView*rectview;
    NSInteger poptype;
    

}
/*newcommment*/

@property (strong, nonatomic) IBOutlet UIView *newcellview;
@property(readwrite)NSInteger applicantid;
@property(strong,nonatomic)NSString* empskillid;
@property(strong,nonatomic)NSString*newid;
@property(strong,nonatomic)NSString*teststrng;
@property(strong,nonatomic)Empdetails*empdetl;
@property(strong,nonatomic)NSString*ssnstring;
@property(strong,nonatomic)VerificationViewController*verifctnVCtrl;
@property(strong,nonatomic)UploadDocViewController*uploadVCtrl;
/*Tables*/
@property (strong, nonatomic) IBOutlet UITableView *employeestable;

/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UIView *titleview;

/*cellOutlets*/
@property (strong, nonatomic) IBOutlet UITableViewCell *employeecell;
@property (strong, nonatomic) IBOutlet UIButton *_disclyrebtnlbl;

@property(strong,nonatomic)IBOutlet UIImageView *empImgview;
- (IBAction)disclurebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *adresslbl;
@property (strong, nonatomic) IBOutlet UILabel *citylbl;
@property (strong, nonatomic) IBOutlet UILabel *statelbl;
@property (strong, nonatomic) IBOutlet UILabel *countrylbl;
@property (strong, nonatomic) IBOutlet UILabel *ziplbl;
@property (strong, nonatomic) IBOutlet UILabel *doblbl;
@property (strong, nonatomic) IBOutlet UILabel *phonelbl;
@property (strong, nonatomic) IBOutlet UILabel *emergencylbl;
@property (strong, nonatomic) IBOutlet UILabel *EmrgcyName;
@property (strong, nonatomic) IBOutlet UILabel *maillbl;
@property (strong, nonatomic) IBOutlet UILabel *alternatvelbl;
@property (strong, nonatomic) IBOutlet UIButton *basicchecklbl;
@property (strong, nonatomic) IBOutlet UILabel *basicexpry;
@property (strong, nonatomic) IBOutlet UILabel *licenceno;
@property (strong, nonatomic) IBOutlet UILabel *licencename;
@property (strong, nonatomic) IBOutlet UILabel *licencestate;

@property (strong, nonatomic) IBOutlet UILabel *twiclbl;

- (IBAction)basiccheck:(id)sender;

-(void)popoveractn;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Arrays & Dictionaries*/
@property(strong,nonatomic)NSMutableDictionary*imageArraydict;
@property(strong,nonatomic)NSMutableDictionary*Skilldict;
@property(strong,nonatomic)NSMutableArray*listarray;
@property(strong,nonatomic)NSMutableArray*empnameArray;
@property(strong,nonatomic)NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableArray *JobsiteArray;
@property (nonatomic, strong)NSMutableDictionary *jobsitedict;
@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, assign) NSInteger openviewIndex;



/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UIWebView *uiwebview;


@property (strong, nonatomic) IBOutlet UIView *applicantprocessview;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property(strong,nonatomic)NSMutableArray *sarry;



/*processview*/
@property (strong, nonatomic) IBOutlet UIButton *sitechecklbl;

- (IBAction)sitecheckactn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *officechecklbl;
- (IBAction)officecheckactn:(id)sender;
- (IBAction)jobsitebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *jobsitebtnlbl;

- (IBAction)processbtn:(id)sender;

- (IBAction)clsebtnactn:(id)sender;
- (IBAction)clsehrbtn:(id)sender;


@end
