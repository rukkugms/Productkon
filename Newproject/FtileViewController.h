//
//  FtileViewController.h
//  Newproject
//
//  Created by Riya on 8/25/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "folderrightsViewController.h"
#import "UserRightViewController.h"
#import "Rightscheck.h"

@interface FtileViewController : UIViewController
{
    BOOL recordResults;
    NSString *userid;
    NSInteger CheckWS;
}
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *usrview;

@property (strong, nonatomic) IBOutlet UIView *fldrview;
@property (strong, nonatomic)folderrightsViewController*folderVCtrl;
@property(strong,nonatomic)UserRightViewController *userrightsVCtrl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)Rightscheck *rights;
@property(readwrite)NSInteger Moduleid;
@property(strong,nonatomic)NSMutableArray *userrightsarray;
@property(strong,nonatomic)NSString *result;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *frightsindicator;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Urightsindicator;
@end
