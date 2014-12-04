//
//  MPEvntcalViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 03/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPEvntcalViewController : UIViewController
{
    BOOL recordResults;
}


@property(strong,nonatomic)NSString *selecteddate;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableView *mptable;
@property(strong,nonatomic)NSMutableArray *mparray;
@property(strong,nonatomic)NSMutableArray *phasearray;
@property(strong,nonatomic)NSMutableDictionary *phaseDict;
@property(strong,nonatomic)NSString *phasestring;
@property(strong,nonatomic)NSString *comparestring;
@property(strong,nonatomic)NSString *firststring;
@property(strong,nonatomic)NSString *previousstring;
@property(strong,nonatomic)IBOutlet UITableViewCell *mpcell;

@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

@property(strong,nonatomic)IBOutlet UILabel *mplabel;

- (IBAction)clsebtn:(id)sender;
@end
