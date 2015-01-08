//
//  PurchaseViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *purchsetable;
@property (strong, nonatomic) IBOutlet UIView *titleview;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletbtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

@end
