//
//  ProjecttypeViewController.m
//  Newproject
//
//  Created by Riya on 9/18/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ProjecttypeViewController.h"

@interface ProjecttypeViewController ()

@end

@implementation ProjecttypeViewController

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
   _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
//        if(tableView==_subtypetable){
//            
//            [[NSBundle mainBundle]loadNibNamed:@"Subcell" owner:self options:nil];
//            cell=_subcell;
//        }
        
        
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
        return cell;
}
#pragma mark-Tableview UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
 
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (tableView==_typetable) {
        
        
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
        }
        
    }
}


- (IBAction)addclsebtn:(id)sender {
}

- (IBAction)addbtn:(id)sender {
}

- (IBAction)deltebtn:(id)sender {
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)clsebtn:(id)sender {
}
@end
