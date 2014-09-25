//
//  PServiceViewController.h
//  Newproject
//
//  Created by Riya on 9/22/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailplanViewController.h"
#import "Plaservcemdl.h"

@interface PServiceViewController : UIViewController{
    BOOL recordResults;
    NSString*servicestrg;
    UIButton *button;
    NSInteger skillid;
}
@property (strong, nonatomic) IBOutlet UITableView *servicetable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic)NSMutableDictionary*servicedict;
@property (strong, nonatomic)NSMutableArray*servicearray;
@property (strong, nonatomic)DetailplanViewController*detailVCtrl;

@property (strong, nonatomic)NSString*planID;
@property (strong, nonatomic)Plaservcemdl *servicemdl;
@property (strong, nonatomic)NSMutableArray*servicemdlarray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UITableViewCell *servicecell;
@property (strong, nonatomic) IBOutlet UIButton *addwrkbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *servicelbl;
- (IBAction)wrkbtn:(id)sender;

- (IBAction)clsebtn:(id)sender;

@end
