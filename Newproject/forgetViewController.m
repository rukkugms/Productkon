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
        [[_passwordview layer] setBorderWidth:1];
        [[_passwordview layer] setCornerRadius:10];
        _logoutview.hidden=YES;
        _navitem.title=@"Reset Your Password";
    }
    else
    {
        _passwordview.hidden=YES;
        _logoutview.hidden=NO;
        _paswordbtn.tintColor=[UIColor whiteColor];
        _logoutbtn.tintColor=[UIColor blackColor];
        _navitem.title=@"Logout From All Devices";
        [[_logoutview layer] setBorderWidth:1];
        [[_logoutview layer] setCornerRadius:10];
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
-(IBAction)questionpopup:(id)sender
{UIViewController* popoverContent = [[UIViewController alloc]
                                     init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 300, 150)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 300, 150)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 32;
    
    
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(300, 150);
    
    //create a popover controller
    self.popovercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    [self.popovercontroller presentPopoverFromRect:_qstnbtn.frame
                                            inView:self.passwordview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    

}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(tableView==_popovertableview)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
       
                //cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
    }
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //  [_statebtn setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
    
        
        
    
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}




@end
