//
//  DocmntViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "DocmntViewController.h"

@interface DocmntViewController ()

@end

@implementation DocmntViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethedocument:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(valuePhilosophyPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.valuesphilosophyview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(qualityassurancepage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.qualityAssuranceview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(safetymanualpage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.saftymanualview addGestureRecognizer:doubleTap2];
    
    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(emphandbookpage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.EmpHandbkview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(fleetmgmtpage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.fleetmgmtpgmview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(msdsDBpage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.msdsdbview addGestureRecognizer:doubleTap5];
    
    
    
    
}
-(void)valuePhilosophyPage
{
   
}
-(void)qualityassurancepage
{
    
}
-(void)safetymanualpage
{
    
}
-(void)emphandbookpage
{
    
}
-(void)fleetmgmtpage
{
    
}
-(void)msdsDBpage
{
    
}


@end
