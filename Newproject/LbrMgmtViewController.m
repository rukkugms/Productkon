//
//  LbrMgmtViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 30/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "LbrMgmtViewController.h"

@interface LbrMgmtViewController ()

@end

@implementation LbrMgmtViewController

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
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _mgmttable.layer.borderWidth=3.0f;
    _mgmttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _checkbtn.enabled=NO;
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
    _checkbtn.enabled=NO;
    check=0;
    _formanbtn.enabled=NO;
    }

- (IBAction)Selectjobsite:(id)sender
{
    [_formanbtn setTitle:@"Select" forState:UIControlStateNormal ];

    btnindex=1;
    [self createpopover];
    [self JobsSelect];
    _formanbtn.enabled=YES;
}

- (IBAction)Selectforman:(id)sender
{
    btnindex=2;
   
    if ([_jobbtn.titleLabel.text isEqualToString:@"Select"]||[_jobbtn.titleLabel.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select a jobsite" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [self createpopover];
    [self LaborForemanSelect];
    }
}
-(IBAction)checkaction:(id)sender
{
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    
    if (rightsmodel.EditModule==0) {
        
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit a record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        
        }
        
    
    else
    {
        if([_formanbtn.titleLabel.text isEqualToString:@"Select"])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Select a Foreman" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
          

    _checkstring=@"clickd";
   
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttable];
    NSIndexPath *textFieldIndexPath = [self.mgmttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
   
    btnclick++;
    
      LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:textFieldIndexPath.row];
      if (![fname isEqualToString:lmdl.ForemanName]) {
        
        
    
        
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        check=1;
        
        
    }
    else
    {
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        check=0;
        
    }
    
  [_mgmttable reloadData];
       [self ForemanUpdate];
   
    }
    }
    
}
-(IBAction)Editaction:(id)sender
{
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttable];
    NSIndexPath *textFieldIndexPath = [self.mgmttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    _checkbtn.enabled=YES;
    
}
- (IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 250, 200)];
    
    _popovertable.delegate=(id)self;
    _popovertable.dataSource=(id)self;
    _popovertable.rowHeight= 32;
    _popovertable.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popovertable];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(250, 200);
    
    //create a popover controller
    self.popover = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popover.popoverContentSize=CGSizeMake(250.0f, 200.0f);
    self.popover=_popover;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    switch (btnindex) {
        case 1:
            [self.popover presentPopoverFromRect:_jobbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 2:
            [self.popover presentPopoverFromRect:_formanbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
                default:
            break;
    }
    
    
    
    
    
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popovertable) {
        switch (btnindex) {
            case 1:
                return [_jobarray count];
                break;
            case 2:
                return [_formanarray count];
                break;
            
                default:
                break;
        }
        
    }
    else
    {
        
        return [_lbrmgmtarray count];
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_mgmttable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Lbmgcell" owner:self options:nil];
            cell=_mgmtcell;
        }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if (tableView==_popovertable) {
        
        if (btnindex==1) {
             jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
        
               
                cell.textLabel.text=[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill];
        }
        
              else if(btnindex==2)
              {
                  formanmdl *formdl=(formanmdl*)[_formanarray objectAtIndex:indexPath.row];
                  
                  cell.textLabel.text=formdl.ForemanName;
              }
        
        
    }
    
    if(tableView==_mgmttable)
    {
        LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:indexPath.row];
        _emplabel=(UILabel*)[cell viewWithTag:1];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        _emplabel.text=lmdl.employeename;
        _formanlabel=(UILabel*)[cell viewWithTag:2];
        
        _formanlabel.text=lmdl.ForemanName;
       
//        if ([fname isEqualToString:lmdl.ForemanName]) {
//            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//            check=1;
//            
//        }
//        else
//        {
//            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            check=0;
//        }

        if ([lmdl.LMCheck isEqualToString:@"true"]) {
            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            check=1;

        }
        else
        {
            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            check=0;
        }

     
        
    }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popovertable) {
        
        
        if (btnindex==1) {
            jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:indexPath.row];
            jobindex=indexPath.row;
            
            [_jobbtn setTitle:[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill]forState:UIControlStateNormal];
            [self LaborInsert];
        }
        else if(btnindex==2)
        {rowindex=indexPath.row;
            formanmdl *formdl=(formanmdl*)[_formanarray objectAtIndex:indexPath.row];
              [_formanbtn setTitle:formdl.ForemanName forState:UIControlStateNormal ];
            fname=formdl.ForemanName;
            
        }
//        switch (btnindex) {
//            case 1:
//                rowindex=indexPath.row;
//                
//                [_jobbtn setTitle:[NSString stringWithFormat:@"%@-%@-%@",jobsmdl.jobname,jobsmdl.jobno,jobsmdl.skill]forState:UIControlStateNormal];
//                [self LaborInsert];
//               // [self LaborForemanSelect];
//                break;
//            case 2:
//                
//                [_formanbtn setTitle:formdl.ForemanName forState:UIControlStateNormal ];
//                f=[_formandict objectForKey:[_formanarray objectAtIndex:indexPath.row]];
//                fname=[_formanarray objectAtIndex:indexPath.row];
//               //[self ForemanEmployeenameSelect];
//                
//                break;
//                
//
//                
//            default:
//                break;
//        }
        
        //   [_optionbtnlbl setTitle:[_Optionarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
    }
    [self.popover dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_mgmttable)
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
-(void)JobsSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobsSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   
                   "</JobsSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/JobsSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)LaborInsert{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
     jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LaborInsert xmlns=\"http://ios.kontract360.com/\">\n"
                    "<jobsite>%@</jobsite>\n"
                   
                   "</LaborInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/LaborInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)LaborForemanSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobindex];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LaborForemanSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<jobsite>%@</jobsite>\n"
                   
                   "</LaborForemanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobsmdl.jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/LaborForemanSelect" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)ForemanSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    
   // NSArray*array=[_jobbtn.titleLabel.text componentsSeparatedByString:@"-"];
 //   NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
//    NSInteger job=[jobno integerValue];
//    jobno=[NSString stringWithFormat:@"%d",job];
     jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:jobindex];
    NSString *job=[NSString stringWithFormat:@"%d",jobsmdl.jobid];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<job_id>%@</job_id>\n"
                   
                   "</ForemanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ForemanSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanEmployeenameSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
   // NSArray*array=[_jobbtn.titleLabel.text componentsSeparatedByString:@"-"];
      jobsitemodel *jobsmdl=(jobsitemodel *)[_jobmdlarray objectAtIndex:rowindex];
   // NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    NSString*jobno=jobsmdl.jobno;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanEmployeenameSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<foremanid>%d</foremanid>\n"
                   "<foremanname>%@</foremanname>\n"
                   "<jobsite>%@</jobsite>\n"
                   "</ForemanEmployeenameSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[f integerValue],fname,jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ForemanEmployeenameSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanUpdate
{
    webtype=1;
    recordResults=FALSE;
    NSString *soapMessage;
     LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:btnindex];
     formanmdl*fmdl=(formanmdl *)[_formanarray objectAtIndex:rowindex];
    NSInteger lid=[lmdl.LMEntryId integerValue];
    NSInteger tick;
    
        if (check==0) {
            tick=0;
        }
        else{
           tick=[fmdl.fEmployeeId integerValue];
        }
        _checkstring=@"";
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LMEntryId>%d</LMEntryId>\n"
                   "<LMForemanId>%d</LMForemanId>\n"
                   "<checkin>%d</checkin>\n"
                   "</ForemanUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",lid,tick,check];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ForemanUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_mgmttable reloadData];
    [_popovertable reloadData];
    if (webtype==1) {
        
        [self LaborInsert];
        webtype=0;
    }
    
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobmdlarray=[[NSMutableArray alloc]init];
        _jobarray=[[NSMutableArray alloc]init];
        _jobiddict=[[NSMutableDictionary alloc]init];
        _jobsitedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobSiteName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"LaborInsertResponse"])
    {
        _lbrmgmtarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMJobSite"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMEmployeeId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"LMForemanId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMCheck"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"employeename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ForemanName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"LaborForemanSelectResponse"])
    {
        _formanarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"fLMEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"fLMItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"fLMJobSite"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"fEmployeeId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"fLMCheck"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"fForemanName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }



    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if([elementName isEqualToString:@"id"])
    {
        _jobmdl=[[jobsitemodel alloc]init];
        recordResults = FALSE;
        _jobmdl.jobid=[_soapResults integerValue];
        _jobid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        _jobnumber=_soapResults;
        _jobmdl.jobno=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
    
     
        _soapResults = nil;
    }
        if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults = FALSE;
        _jobmdl.jobname=_soapResults;
        //[_jobarray addObject:[NSString stringWithFormat:@"%@-%@",_jobnumber,_soapResults]];
        [_jobarray addObject:_soapResults];
             [_jobiddict setObject:_jobid forKey:_soapResults];
        [_jobsitedict setObject:_jobnumber forKey:_soapResults];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
        _skillname=_soapResults;
        _jobmdl.skill=_soapResults;
        [_jobmdlarray addObject:_jobmdl];
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"name"])
    {
        recordResults = FALSE;
        [_formanarray addObject:_soapResults];
        _forman=_soapResults;
        _soapResults = nil;
    }


       if([elementName isEqualToString:@"LMEntryId"])
    {
        _lbmdl=[[LbmgModel alloc]init];
        recordResults = FALSE;
        _lbmdl.LMEntryId=_soapResults;
       
        _soapResults = nil;
     
    }
    if([elementName isEqualToString:@"LMItemCode"])
    {
        
        recordResults = FALSE;
        _lbmdl.LMItemCode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LMJobSite"])
    {
        recordResults = FALSE;
        _lbmdl.LMJobSite=_soapResults;
        
        _soapResults = nil;
      
    }
    if([elementName isEqualToString:@"LMEmployeeId"])
    {
        recordResults = FALSE;
        _lbmdl.LMEmployeeId=_soapResults;
        
        _soapResults = nil;
          }
    
    if([elementName isEqualToString:@"LMForemanId"])
    {
        recordResults = FALSE;
        _lbmdl.LMForemanId=_soapResults;
        
        _soapResults = nil;
          }
    if([elementName isEqualToString:@"LMCheck"])
    {
        recordResults = FALSE;
        _lbmdl.LMCheck=_soapResults;
        
        _soapResults = nil;
            }
    if([elementName isEqualToString:@"employeename"])
    {
        recordResults = FALSE;
        _lbmdl.employeename=_soapResults;
        [_lbrmgmtarray addObject:_lbmdl];
        _soapResults = nil;
           }
    
    if([elementName isEqualToString:@"ForemanName"])
    {
        recordResults = FALSE;
        _lbmdl.ForemanName=_soapResults;
        
        _soapResults = nil;
        
    }
    

    if([elementName isEqualToString:@"fLMEntryId"])
    {
        _formanmdl=[[formanmdl alloc]init];
        recordResults = FALSE;
        _formanmdl.fLMEntryId=_soapResults;
        
        _soapResults = nil;
          }
    
    if([elementName isEqualToString:@"fLMItemCode"])
    {
        recordResults = FALSE;
        _formanmdl.fLMItemCode=_soapResults;
        
        _soapResults = nil;
          }
    if([elementName isEqualToString:@"fLMJobSite"])
    {
        recordResults = FALSE;
        _formanmdl.fLMJobSite=_soapResults;
        
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"fEmployeeId"])
    {
        recordResults = FALSE;
        _formanmdl.fEmployeeId=_soapResults;
        
        _soapResults = nil;
           }
    if([elementName isEqualToString:@"fLMCheck"])
    {
        recordResults = FALSE;
        _formanmdl.fLMCheck=_soapResults;
        
        _soapResults = nil;
            }
    if([elementName isEqualToString:@"fForemanName"])
    {recordResults = FALSE;
        _formanmdl.ForemanName=_soapResults;
        [_formanarray addObject:_formanmdl];
        _soapResults = nil;
        
         }

}




@end
