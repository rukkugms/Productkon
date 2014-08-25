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

@interface FtileViewController : UIViewController
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *usrview;

@property (strong, nonatomic) IBOutlet UIView *fldrview;
@property (strong, nonatomic)folderrightsViewController*folderVCtrl;
@property(strong,nonatomic)UserRightViewController *userrightsVCtrl;
@end
