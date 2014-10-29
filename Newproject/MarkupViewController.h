//
//  MarkupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mastermarkmodel.h"
#import "Markupmainmodel.h"
#import "Firstmarkmdl.h"
#import "DetailmarkupsectionViewController.h"


@interface MarkupViewController : UIViewController
{
    BOOL recordResults;
    NSString *mark;
    UIButton *carbutton;
    UIButton *button;
    NSInteger btnindex;
    NSInteger selectedcell;
}
@property(strong,nonatomic)Mastermarkmodel *master;
@property(strong,nonatomic)Firstmarkmdl *firstmdl;
@property(strong,nonatomic)Markupmainmodel *mainmarkmodel;
@property(strong,nonatomic)DetailmarkupsectionViewController *markVctrlr;


/*IBActions*/
-(IBAction)closemarkuppage:(id)sender;
-(IBAction)markupselection:(id)sender;
/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIButton *markupbutton;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIPopoverController *popovercontroller;
@property(strong,nonatomic)IBOutlet UITableView *markuptable;
@property(strong,nonatomic)IBOutlet UITableView *recordtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *markupcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *recordcell;
@property(strong,nonatomic)IBOutlet UIView *markuptableviewtitle;
@property(strong,nonatomic)IBOutlet UIView *recordtableviewtitle;

/*section*/
@property(strong,nonatomic)UILabel *sectionheaderlabel;

@property(strong,nonatomic)UITableView *popovertableview;

/*array*/
@property(strong,nonatomic)NSMutableArray *markuparray;
@property(strong,nonatomic)NSMutableArray *listarray;
@property(strong,nonatomic)NSMutableArray *markuptablearray;
@property(strong,nonatomic)NSMutableArray *detailmarkuparray;

/*dict*/
@property(strong,nonatomic)NSMutableDictionary *markupdict;
@property(strong,nonatomic)NSString *markupstring;




/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;

@property(strong,nonatomic)IBOutlet UILabel *markupnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *stpercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *stdollerlabel;
@property(strong,nonatomic)IBOutlet UILabel *otpercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *otdollerlabel;

@property(strong,nonatomic)IBOutlet UILabel *mainheaderlabel;
@property(strong,nonatomic)IBOutlet UILabel *STPERlabel;
@property(strong,nonatomic)IBOutlet UILabel *STDOLLlabel;
@property(strong,nonatomic)IBOutlet UILabel *OTPERlabel;
@property(strong,nonatomic)IBOutlet UILabel *OTDOLLlabel;
@property(strong,nonatomic)IBOutlet UILabel *variablepercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *fixeddollerlabel;
@property (strong, nonatomic) IBOutlet UILabel *defaultlbl;

@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;
@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *detaillabel;


@end
