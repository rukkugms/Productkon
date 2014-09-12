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
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    //_addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _subtypetable.layer.borderWidth=3.0;
    _subtypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 150, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_subtypebutton.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}

-(IBAction)closesubtype:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)updatebtn:(id)sender
{
    if ([_subtypebutton.titleLabel.text isEqualToString:@"Select"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
    }

}
- (IBAction)addclsebtn:(id)sender
{
    _addview.hidden=YES;

}
- (IBAction)subtpebtn:(id)sender
{
    [self createpopover];

}

- (IBAction)addbtn:(id)sender
{
    [_subtypetable setEditing:NO animated:NO];
    _addview.hidden=NO;
}
- (IBAction)deletebtn:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_subtypetable setEditing:NO animated:NO];
        [_subtypetable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_subtypetable setEditing:YES animated:YES];
        [_subtypetable reloadData];
        
        
        
        
    }

}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popOverTableView){
        
        return [_Subtypelistarray count];
        
    }else{
        return [_selectedsubtypearray count];
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_subtypetable){
            
            [[NSBundle mainBundle]loadNibNamed:@"Subcell" owner:self options:nil];
            cell=_subcell;
        }

        
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if(tableView==_popOverTableView){
        cell.textLabel.text=[_Subtypelistarray objectAtIndex:indexPath.row];
        
    }
    else{
//        Craftreqmtmdl*crftreqmdl=(Craftreqmtmdl *)[_brcraftarray objectAtIndex:indexPath.row];
//        _craftlbl=(UILabel *)[cell viewWithTag:1];
//        _craftlbl.text=crftreqmdl.Brdescriptn;
        //cell.textLabel.text=@"Servicename";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        path=indexPath.row;
         [_subtypebutton setTitle:[_Subtypelistarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
    }
    [self.popOverController dismissPopoverAnimated:YES];
}

#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (tableView==_subtypetable) {
        
        
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
        }
        
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deletepath=indexPath.row;
        
//        [self CraftrequirementDelete];
//        [_brcraftarray removeObject:indexPath];
        
        
        
    }
    
}





@end
