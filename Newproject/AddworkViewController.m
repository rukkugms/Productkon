//
//  AddworkViewController.m
//  KontractWorkOrder
//
//  Created by Riya on 1/23/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "AddworkViewController.h"

@interface AddworkViewController ()

@end

@implementation AddworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
      self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     //self.scro.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    [[self.destxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.destxtview layer] setBorderWidth:2];
    [[self.destxtview layer] setCornerRadius:10];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
