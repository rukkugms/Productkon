//
//  SettngsViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 06/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SettngsViewController.h"

@interface SettngsViewController ()

@end

@implementation SettngsViewController

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
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(servicesPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.serviceview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(workphasePage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.workphaseview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(worktypepage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.worktypeview addGestureRecognizer:doubleTap2];
    
    
    
}
-(void)servicesPage
{
    //if (!self.serviceVCtrl) {
        self.serviceVCtrl=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
   // }
    _serviceVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_serviceVCtrl
                       animated:YES completion:NULL];
}
-(void)workphasePage
{
  //  if (!self.workVCtrl) {
        self.workVCtrl=[[workPhasesViewController alloc]initWithNibName:@"workPhasesViewController" bundle:nil];
  //  }
    _workVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_workVCtrl
                       animated:YES completion:NULL];
    
}
-(void)worktypepage{
    
   // if (!self.wrktypeVCtrl) {
        self.wrktypeVCtrl=[[WorktypeViewController alloc]initWithNibName:@"WorktypeViewController" bundle:nil];
  //  }
    _wrktypeVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_wrktypeVCtrl animated:YES completion:nil];
}
-(IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
