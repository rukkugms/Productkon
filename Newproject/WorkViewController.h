//
//  WorkViewController.h
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddworkViewController.h"

@interface WorkViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *worktable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic)AddworkViewController*AddWCtrl;

- (IBAction)clsebtn:(id)sender;
- (IBAction)Addbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *workcell;

@end
