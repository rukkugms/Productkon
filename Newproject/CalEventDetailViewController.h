//
//  CalEventDetailViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 28/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detaileventmanpwr.h"
#import "Eqeventmdl.h"
#import "Eventmdl.h"
#import "OthereventMaodel.h"
#import "ABCViewController.h"

@interface CalEventDetailViewController : UIViewController
{
    NSInteger tooltype;
     double sum;
     double eqsum;
    double matsum;
    BOOL recordResults;
}
@property(strong,nonatomic)NSString *estimationnumber;
@property(strong,nonatomic)NSString *selecteddate;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)Detaileventmanpwr *manpwr;
@property(strong,nonatomic)Eqeventmdl *eqmdl;
@property(strong,nonatomic)OthereventMaodel *othrmdl;
@property(strong,nonatomic)Eventmdl *eventmdl;
@property(strong,nonatomic)IBOutlet UILabel *totallabel;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

@property(strong,nonatomic)IBOutlet UITableView *calmanpwrtable;
@property(strong,nonatomic)IBOutlet UITableView *sumtable;

@property(strong,nonatomic)IBOutlet UITableViewCell *calmanpwrcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *calmaterialcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *caleqcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *calothercell;
@property(strong,nonatomic)IBOutlet UITableViewCell *sumcell;

@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UIView *mantitleview;
@property(strong,nonatomic)IBOutlet UIView *mattitleview;
@property(strong,nonatomic)IBOutlet UIView *eqreviewtitleview;
@property(strong,nonatomic)IBOutlet UIView *matothertitleview;
@property(strong,nonatomic)IBOutlet UIView *summarytitleview;

@property(strong,nonatomic)NSMutableArray *manpwrarray;
@property(strong,nonatomic)NSMutableArray *totalarray;
@property(strong,nonatomic)NSMutableArray *otherarray;
@property(strong,nonatomic)NSMutableArray *eqpmntarray;
@property(strong,nonatomic)NSMutableArray *summaryarray;
@property(strong,nonatomic)NSMutableArray *datearray;
@property(strong,nonatomic)NSMutableArray *reviewsumarray;
@property(strong,nonatomic)NSMutableArray *titlearray;

@property(strong,nonatomic)NSMutableDictionary *titledict;
@property(strong,nonatomic)NSString *datedictstring;


- (IBAction)clsebtn:(id)sender;
- (IBAction)manpoweraction:(id)sender;
- (IBAction)equipmentaction:(id)sender;
- (IBAction)materialaction:(id)sender;
- (IBAction)summaryaction:(id)sender;


/*Labels in Manpwr*/
@property(strong,nonatomic)IBOutlet UILabel *manitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *mandeslabel;
@property(strong,nonatomic)IBOutlet UILabel *manpdatelabel;
@property(strong,nonatomic)IBOutlet UILabel *manqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *manstlabel;
@property(strong,nonatomic)IBOutlet UILabel *manotlabel;
@property(strong,nonatomic)IBOutlet UILabel *manstratelabel;
@property(strong,nonatomic)IBOutlet UILabel *manotratelabel;
@property(strong,nonatomic)IBOutlet UILabel *mantotallabel;
@property(strong,nonatomic)IBOutlet UILabel *typelabel;
@property(strong,nonatomic)IBOutlet UILabel *phaselabel;

@property(strong,nonatomic)IBOutlet UIBarButtonItem *manpwrbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *eqpmntbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *materialbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *summarybtn;


/*Labels in equipment*/
@property(strong,nonatomic)IBOutlet UILabel *Eqitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqdeslabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqdatelabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqtotallabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqphaselabel;
@property(strong,nonatomic)IBOutlet UILabel *Eqhourslabel;
@property(strong,nonatomic)IBOutlet UILabel *EqJobtasklabel;


/*Labels in summary*/
@property(strong,nonatomic)IBOutlet UILabel *summarylabel;
@property(strong,nonatomic)IBOutlet UILabel *costlabel;

/*Labels in other*/
@property(strong,nonatomic)IBOutlet UILabel *Otheritemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Otherdeslabel;
@property(strong,nonatomic)IBOutlet UILabel *otherdatelabel;
@property(strong,nonatomic)IBOutlet UILabel *otherqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *othertotallabel;
@property(strong,nonatomic)IBOutlet UILabel *otherphaselabel;


/*Estimation Review*/
@property(strong,nonatomic)NSString *estimationstring;
@property(strong,nonatomic)NSString *estid;

@property(strong,nonatomic)IBOutlet UIView *view1;
@property(strong,nonatomic)IBOutlet UIView *view2;




@end
