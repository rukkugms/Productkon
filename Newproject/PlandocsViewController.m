//
//  PlandocsViewController.m
//  Newproject
//
//  Created by Riya on 10/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlandocsViewController.h"

@interface PlandocsViewController ()

@end

@implementation PlandocsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
       
    if ( tableView==_documnttable){
        return [_documntarray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_documnttable) {
            [[NSBundle mainBundle]loadNibNamed:@"Plandocuscell" owner:self options:nil];
            cell=_doccell;
        }
        
        
        
        
        
    }
    
    
    if (tableView==_documnttable) {
        _docnamelbl=(UILabel *)[cell viewWithTag:1];
        _docnamelbl.text=[_documntarray objectAtIndex:indexPath.row];
    }
    
    
    
    
    return cell;
    
    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
