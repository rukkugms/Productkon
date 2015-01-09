//
//  WorkorderViewController.h
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workordrmdl.h"

@interface WorkorderViewController : UIViewController{
    
}



@property (strong, nonatomic) Workordrmdl *Workmdl;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *worktable;


- (IBAction)clsebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@end
