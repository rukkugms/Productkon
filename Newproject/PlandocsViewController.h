//
//  PlandocsViewController.h
//  Newproject
//
//  Created by Riya on 10/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
@interface PlandocsViewController : UIViewController{
    BOOL recordResults;
    NSString *docname;
    UIButton *button;
}
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic)WebViewController *webVCtrl;

- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic)NSString *planid;
@property (strong, nonatomic) IBOutlet UITableViewCell *doccell;
@property (strong, nonatomic) IBOutlet UILabel *docnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *viewbtn;

@property (strong, nonatomic) IBOutlet UITableView *documnttable;
@property (strong, nonatomic)NSMutableArray *documntarray;
@property (strong, nonatomic)NSMutableDictionary *docmntdict;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
- (IBAction)viewbtn:(id)sender;

@end
