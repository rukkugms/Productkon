//
//  SubtypViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SubtypViewController.h"

@interface SubtypViewController ()

@end

@implementation SubtypViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closesubtype:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
