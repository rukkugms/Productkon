//
//  IndustrytpeViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 18/09/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "IndustrytpeViewController.h"

@interface IndustrytpeViewController ()

@end

@implementation IndustrytpeViewController

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
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _industrytypetable.layer.borderWidth=3.0;
    _industrytypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updatebtn:(id)sender
{
    
}
- (IBAction)addclsebtn:(id)sender
{
    
}
- (IBAction)industryaction:(id)sender
{
    
}
- (IBAction)addbtn:(id)sender
{
    
}
- (IBAction)deletebtn:(id)sender{
    
}
@end
