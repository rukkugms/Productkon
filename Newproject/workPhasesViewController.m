//
//  workPhasesViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 23/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "workPhasesViewController.h"

@interface workPhasesViewController ()

@end

@implementation workPhasesViewController

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
    _workphasesview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [self WorkTypeSelect];
    _phasetable.layer.borderWidth = 2.0;
    _phasetable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.phasetable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    _result=@"";
    _moduleid=0;
    [super viewWillAppear:animated];
    _phasetable.userInteractionEnabled=YES;
    [self SelectAllPhases];
}
#pragma mark-tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_phasetable)
{
    return [_workphasesarray count];
}
    if (tableView==_popOverTableView) {
        
        switch (poptype) {
            case 1:
                return [_phasesbasedonservicearray count];
                break;
            case 2:
               return [_servicesarray count];
                break;
            default:
                break;
        }
        
    }
    return YES;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(tableView==_phasetable)
        {
        [[NSBundle mainBundle]loadNibNamed:@"customphase" owner:self options:nil];
        cell=_phasecell;
        }
    }
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
        
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_phasesbasedonservicearray objectAtIndex:indexPath.row];

                
                break;
            case 2:
                 cell.textLabel.text=[_servicesarray objectAtIndex:indexPath.row];
                
                
                break;
            default:
                break;
        }
        
    }
    if (tableView==_phasetable)
    {
        phasesmodel*phmdl=(phasesmodel *)[_workphasesarray objectAtIndex:indexPath.row];
        _namelabel=(UILabel *)[cell viewWithTag:1];
        _namelabel.text=phmdl.phasename;
        _servicelabel=(UILabel *)[cell viewWithTag:2];
        _servicelabel.text=phmdl.servicename;
        _underoflabel=(UILabel *)[cell viewWithTag:3];
        _underoflabel.text=phmdl.underof;
        _parentbtncell=(UIButton *)[cell viewWithTag:4];
//        if (phmdl.parent==0) {
//            [_parentbtncell setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            
//        }
//        else if(phmdl.parent==1){
//            [_parentbtncell setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//            
//        }
//        

        
    }

    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                [_phasebtn setTitle:[_phasesbasedonservicearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
              
                
                break;
            case 2:
               [_servicebtn setTitle:[_servicesarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                  [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
                
                
                break;
            default:
                break;
        }

        
    }
     [self.popOverController dismissPopoverAnimated:YES];

    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self DeletePhases];
        [_workphasesarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_phasetable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}

#pragma mark:actions
-(IBAction)closePhases:(id)sender
{
    _workphasesview.hidden=YES;
    _phasetable.userInteractionEnabled=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addworkPhasesview:(id)sender
{

    _phasetable.userInteractionEnabled=NO;
    optionIdentifier=1;
    _workphasesview.hidden=NO;
    _navItem.title=@"Create";
    _phasetextfld.text=@"";
    _cancelbtn.enabled=YES;
    _updatebtn.enabled=YES;
    [_servicebtn setTitle:@"Select" forState:UIControlStateNormal];
    [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
    
}
-(IBAction)editWorkPhasesview:(id)sender
{
 
    _phasetable.userInteractionEnabled=NO;
    _updatebtn.enabled=YES;
    optionIdentifier=2;
    _workphasesview.hidden=NO;
    _cancelbtn.enabled=NO;
    _cancelbtn.titleLabel.textColor=[UIColor grayColor];
    _navItem.title=@"Edit";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    phasesmodel*phmdl=(phasesmodel *)[_workphasesarray objectAtIndex:textFieldIndexPath.row];
    
    _phasetextfld.text=phmdl.phasename;
    [_servicebtn setTitle:phmdl.servicename forState:UIControlStateNormal];
    [_phasebtn setTitle:phmdl.underof forState:UIControlStateNormal];
    if (phmdl.parent==0) {
        [_parentbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    else if(phmdl.parent==1){
        [_parentbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
}
-(IBAction)closeworkphasesview:(id)sender
{
    _result=@"";
    _moduleid=0;
    _phasetable.userInteractionEnabled=YES;
    _workphasesview.hidden=YES;
    _updatelbl.hidden=YES;
    _updatebtn.enabled=YES;
}
-(IBAction)update_phases:(id)sender
{
    _result=@"";
    x=1;
    _moduleid=19;
     _updatebtn.enabled=NO;
    [self UserRightsforparticularmoduleselect];
    
}
-(void)updateaction
{
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.EditModule==0) {
        if (optionIdentifier==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to add a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if(optionIdentifier==2)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    else
    {
        
        if ([_phasetextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phase is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _updatebtn.enabled=YES;
            
        }
        else if([_servicebtn.titleLabel.text isEqualToString:@"Select"]||[_servicebtn.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Work type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _updatebtn.enabled=YES;
            
        }
        else{
            if(optionIdentifier==1)
            {
                
                
               
                
                [self InsertPhases];
            }
            else if(optionIdentifier==2)
            {
               
                [self UpdatePhases];
            }
            
        }
    }

}
-(void)deleteaction
{
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.DeleteModule==0) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You dont have rights to delete a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        
        if (self.editing) {
            [super setEditing:NO animated:NO];
            [_phasetable setEditing:NO animated:NO];
            [_phasetable reloadData];
            
            
            
        }
        
        else{
            [super setEditing:YES animated:YES];
            [_phasetable setEditing:YES animated:YES];
            [_phasetable reloadData];
            
        }
    }

}
-(IBAction)cancel_phases:(id)sender
{
    _phasetextfld.text=@"";
    //[_parentbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     [_servicebtn setTitle:@"Select" forState:UIControlStateNormal];
     [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
    
}

- (IBAction)wrkphasebtn:(id)sender {
    _result=@"";
    _moduleid=18;
    [self UserRightsforparticularmoduleselect];
//    if (!self.worktypeVCtrl) {
//        self.worktypeVCtrl=[[WorktypeViewController alloc]initWithNibName:@"WorktypeViewController" bundle:nil];
//    }
//    _worktypeVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
//    [self presentViewController:_worktypeVCtrl animated:YES completion:nil];
    
}

//-(IBAction)parentbtn:(id)sender
//{ checkstring=@"clicked";
//    if (parentcheck==0) {
//        [_parentbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        _phasebtn.enabled=NO;
//        [_phasebtn setTitle:@"" forState:UIControlStateNormal];
//        parentcheck=1;
//        
//    }
//    
//    else{
//        [_parentbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        _phasebtn.enabled=YES;
//        parentcheck=0;
//        
//    }
//
//}
-(IBAction)deletephases:(id)sender
{ x=2;
    _moduleid=19;
    [self UserRightsforparticularmoduleselect];
    
}

#pragma mark-popover
-(IBAction)selectphases:(id)sender
{  [self SelectPhasesbasedonService];
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_phasebtn.frame
                                            inView:self.workphasesview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

-(IBAction)selectservice:(id)sender
{
    [self WorkTypeSelect];
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
   
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_servicebtn.frame
                                            inView:self.workphasesview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}

#pragma mark- WebService
-(void)SelectAllPhases{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllPhases xmlns=\"http://testUSA.kontract360.com/\">\n"
                   
                   "</SelectAllPhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SelectAllPhases" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)SelectAllServices{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllServices xmlns=\"http://testUSA.kontract360.com/\">\n"
                  
                   "</SelectAllServices>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SelectAllServices" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}

-(void)SelectPhasesbasedonService{
    
    NSString *serid=[_servicedict objectForKey:_servicebtn.titleLabel.text];
    
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectPhasesbasedonService xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<serviceid>%d</serviceid>\n"
                   "</SelectPhasesbasedonService>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[serid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SelectPhasesbasedonService" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)InsertPhases

{
    webtype=1;
    NSString *serid=[_servicedict objectForKey:_servicebtn.titleLabel.text];
    NSString *phid=@"0";
    NSInteger parnt;
    
          parnt=0;
   
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertPhases xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<phasename>%@</phasename>\n"
                   "<serviceid>%d</serviceid>\n"
                   "<parent>%d</parent>\n"
                   "<phaseid>%d</phaseid>\n"
                   "</InsertPhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_phasetextfld.text,[serid integerValue],parnt,[phid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     //NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/InsertPhases" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)UpdatePhases
{
    webtype=1;

   // NSString *serid=[_servicedict objectForKey:_servicebtn.titleLabel.text];
  NSString *phid=@"0";
    NSInteger parnt;
    phasesmodel*phmdl=(phasesmodel *)[_workphasesarray objectAtIndex:btnindex];

      NSString *serid=[_servicedict objectForKey:_servicebtn.titleLabel.text];
   // NSLog(@"ser%@",phmdl.servicename);
   // NSLog(@"ser%@",_servicedict);

    
//    if([checkstring isEqualToString:@"clicked"])
//    {
//        if (parentcheck==0) {
//            parnt=0;
//        }
//        else{
//            parnt=1;
//            phid=0;
//        }
//        checkstring=@"";
//        
//        
//    }
//    
//    else
//    {
//        parnt=phmdl.parent;
//    }
//    if([phid isEqualToString:@"0"])
//    {
//        parnt=0;
//    }
//    else
//    {
//        parnt=1;
//    }
     parnt=0;
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdatePhases xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<id>%d</id>\n"
                   "<phasename>%@</phasename>\n"
                   "<serviceid>%d</serviceid>\n"
                   "<parent>%d</parent>\n"
                   "<phaseid>%d</phaseid>\n"
                   "</UpdatePhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",phmdl.idvalue,_phasetextfld.text,[serid integerValue],parnt,[phid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/UpdatePhases" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)DeletePhases{
    webtype=2;
    recordresults = FALSE;
    NSString *soapMessage;
     phasesmodel*phmdl=(phasesmodel *)[_workphasesarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeletePhases xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<id>%d</id>\n"
                   "</DeletePhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",phmdl.idvalue];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/DeletePhases" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)SearchPhases
{
    
    recordresults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchPhases xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</SearchPhases>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SearchPhases" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)WorkTypeSelect{
    
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypeSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "</WorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/WorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}
-(void)UserRightsforparticularmoduleselect{
    //_moduleid=19;
    webtype=5;
    recordresults = FALSE;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    userid = [defaults objectForKey:@"Userid"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmoduleselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[userid integerValue],_moduleid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/UserRightsforparticularmoduleselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
}



#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    if(webtype==1||webtype==2)
    {
        [self SelectAllPhases];
        _searchbar.text=@"";
        webtype=0;
    }
    if (webtype==0) {
        [self SelectAllPhases];
        webtype=10;
    }
    if(webtype==5)
    {
        if ([_result isEqualToString:@"Not yet set"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Your rights are not yet set" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
        else
        {
            
                       if (_moduleid==18) {
                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
                if (rightsmodel.ViewModule==1) {
                    
                    
                    // if (!self.wrktypeVCtrl) {
                    self.worktypeVCtrl=[[WorktypeViewController alloc]initWithNibName:@"WorktypeViewController" bundle:nil];
                    //  }
                    _worktypeVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
                    _worktypeVCtrl.userrightsarray=_userrightsarray;
                    [self presentViewController:_worktypeVCtrl animated:YES completion:nil];        }
                else
                {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"You don’t have right to view this form" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            if (_moduleid==19) {
                if (x==1) {
                    [self updateaction];
                    webtype=1;
                    
                }
                else
                {
                    [self deleteaction];
                    webtype=2;
                }
                
            }

    }
        webtype=0;
    }
    [_phasetable reloadData];
    [_popOverTableView reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllPhasesResult"])
    {
        _workphasesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ServicesId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
   
    if([elementName isEqualToString:@"servicename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Parent"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"PhaseId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"PhaseId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    
    if([elementName isEqualToString:@"underof"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"WorkTypeSelectResult"])
    {
        _servicesarray=[[NSMutableArray alloc]init];
        _servicedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"WorkType"])
    {
                if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SelectPhasesbasedonServiceResponse"])
    {
        _phasesbasedonservicearray=[[NSMutableArray alloc]init];
        [_phasesbasedonservicearray addObject:@"Select Phase"];
        _phasedict=[[NSMutableDictionary alloc]init];
        [_phasedict setObject:@"0" forKey:@"Select Phase"];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"phasename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }

    if([elementName isEqualToString:@"SearchPhasesResponse"])
    {
        _workphasesarray=[[NSMutableArray alloc]init];

        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    


    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserRightsforparticularmoduleselectResponse"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
//    if([elementName isEqualToString:@"result"])
//    {
//        
//        
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordresults = TRUE;
//    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        _userrightsarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    


    


    






}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordresults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"Id"])
    {
        _phasemdl=[[phasesmodel alloc]init];
        
        recordresults = FALSE;
        
        _phasemdl.idvalue=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordresults = FALSE;
        //[_phasesbasedonservicearray addObject:_soapResults];
        
        _phasemdl.phasename=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ServicesId"])
    {
        
        recordresults = FALSE;
        
        _phasemdl.servideid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"servicename"])
    {
        
        recordresults = FALSE;
        
        _phasemdl.servicename=_soapResults;
         [_workphasesarray addObject:_phasemdl];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Parent"])
    {
        
        recordresults = FALSE;
        
        if ([_soapResults isEqualToString:@"false"]) {
            _phasemdl.parent=0;
            parentcheck=0;
            
        }
        else{
            _phasemdl.parent=1;
            parentcheck=1;
        }
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PhaseId"])
    {
        
        recordresults = FALSE;
        
        _phasemdl.phaseid=[_soapResults integerValue];
        //[_workphasesarray addObject:_phasemdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"underof"])
    {
        
        recordresults = FALSE;
        
        _phasemdl.underof=_soapResults;
       
        _soapResults = nil;
    }
        if([elementName isEqualToString:@"ID"])
    {
        
        
        recordresults = FALSE;
        _unitstring=_soapResults;
        //_phasemdl.idvalue=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        
        recordresults = FALSE;
        [_servicedict setObject:_unitstring forKey:_soapResults];
        [_servicesarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        _phasestring=_soapResults;
        
        recordresults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"phasename"])
    {
        
        
        recordresults = FALSE;
        [_phasesbasedonservicearray addObject:_soapResults];
        [_phasedict setObject:_phasestring forKey:_soapResults];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
        
        recordresults = FALSE;
        if (webtype==1||webtype==0) {
            
            _soapstring=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
        if ([_soapResults isEqualToString:@"Already Used"]) {
            _soapstring=_soapResults;
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapstring delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        

        if (webtype==5) {
            _result=@"Not yet set";
        }
         _soapResults = nil;

    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        
        recordresults = FALSE;
        _rights=[[Rightscheck alloc]init];
        _rights.entryid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        
        recordresults = FALSE;
        
        _rights.userid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        
        recordresults = FALSE;
        
        _rights.moduleid=[_soapResults integerValue];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordresults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.ViewModule=1;
            
            
        }
        else{
            _rights.ViewModule=0;
            
        }
        
        
        
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.EditModule=1;
            
            
        }
        else{
            _rights.EditModule=0;
            
        }
        _soapResults=nil;
        
        
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.DeleteModule=1;
            
            
        }
        else{
            _rights.DeleteModule=0;
            
        }
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        recordresults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _rights.PrintModule=1;
            
            
        }
        else{
            _rights.PrintModule=0;
            
        }
        
        
        
        [_userrightsarray addObject:_rights];
        _soapResults=nil;
        
    }









}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView.message isEqualToString:_soapstring])
    {
        if (optionIdentifier==1) {
            _phasetextfld.text=@"";
            //[_parentbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_servicebtn setTitle:@"Select" forState:UIControlStateNormal];
            [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
            _result=@"";
            _updatebtn.enabled=YES;
            _searchbar.text=@"";
        }
        else if(optionIdentifier==2)
        {
            _phasetextfld.text=@"";
            //[_parentbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_servicebtn setTitle:@"Select" forState:UIControlStateNormal];
            [_phasebtn setTitle:@"Select" forState:UIControlStateNormal];
            _workphasesview.hidden=YES;
            _phasetable.userInteractionEnabled=YES;
            _result=@"";
            _updatebtn.enabled=YES;
            _searchbar.text=@"";

        }
       
        
    }
    if([alertView.message isEqualToString:@"Phase is required"])
    {
        _phasetextfld.text=@"";
        _updatebtn.enabled=YES;
    }
    

    
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchPhases];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllPhases];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllPhases];
        // [searchBar resignFirstResponder];
        
        
    }
         //[searchBar resignFirstResponder];
    
    
}
#pragma mark-textfld delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_phasetextfld)
    {
        NSUInteger newLength = [_phasetextfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    return YES;
    
}




@end
