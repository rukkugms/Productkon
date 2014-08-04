//
//  forgetViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 01/08/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "forgetViewController.h"

@interface forgetViewController ()

@end

@implementation forgetViewController

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
    // self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _passwordview.hidden=YES;
    _logoutview.hidden=YES;
  //  _passwordview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
   // _logoutview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f /alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_btnindex==0) {
        _passwordview.hidden=NO;
        _logoutview.hidden=YES;
    }
    else
    {
        _passwordview.hidden=YES;
        _logoutview.hidden=NO;
        _paswordbtn.tintColor=[UIColor whiteColor];
        _logoutbtn.tintColor=[UIColor blackColor];
    }
    

   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closeforgetpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)Passwordaction:(id)sender
{
    _logoutview.hidden=YES;
    _passwordview.hidden=NO;
    _paswordbtn.tintColor=[UIColor whiteColor];
    _logoutbtn.tintColor=[UIColor blackColor];

}
-(IBAction)logoutaction:(id)sender
{
    _logoutview.hidden=NO;
    _passwordview.hidden=YES;
    _paswordbtn.tintColor=[UIColor blackColor];
    _logoutbtn.tintColor=[UIColor whiteColor];

}


@end
