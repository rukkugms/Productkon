//
//  PMJobViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMJobViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *jobtable;

- (IBAction)clsebtn:(id)sender;
@end
