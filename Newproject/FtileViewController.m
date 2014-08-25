//
//  FtileViewController.m
//  Newproject
//
//  Created by Riya on 8/25/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "FtileViewController.h"

@interface FtileViewController ()

@end

@implementation FtileViewController

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
       self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(folderpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.fldrview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(userpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.usrview addGestureRecognizer:doubleTap1];

}

-(void)folderpage
{
   // if (!self.folderVCtrl) {
    self.folderVCtrl=[[folderrightsViewController alloc]initWithNibName:@"folderrightsViewController" bundle:nil];
//}
    _folderVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
   // _folderVCtrl.userrightsarray=_userrightsarray;
    [self presentViewController:_folderVCtrl
                       animated:YES completion:NULL];

    
}
-(void)userpage{
    self.userrightsVCtrl=[[UserRightViewController alloc]initWithNibName:@"UserRightViewController" bundle:nil];
    //  }
    _userrightsVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_userrightsVCtrl animated:YES completion:nil];

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clsebtn:(id)sender {
      [self dismissViewControllerAnimated:YES completion:nil];
}
@end
