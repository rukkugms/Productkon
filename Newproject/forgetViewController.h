//
//  forgetViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 01/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgetViewController : UIViewController
-(IBAction)closeforgetpage:(id)sender;
-(IBAction)Passwordaction:(id)sender;
-(IBAction)logoutaction:(id)sender;
@property(strong,nonatomic)IBOutlet UIView *passwordview;
@property(strong,nonatomic)IBOutlet UIView *logoutview;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *paswordbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *logoutbtn;
@property(readwrite)NSInteger btnindex;
@end
