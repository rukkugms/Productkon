//
//  MasterHrViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 09/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MasterHrViewController.h"

@interface MasterHrViewController ()

@end

@implementation MasterHrViewController

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
    _disclosurearray=[[NSMutableArray alloc]initWithObjects:@"Process Applicant", nil];
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _applicantprocessview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _hrtable.layer.borderWidth = 2.0;
    _hrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //searchBar.tintColor=[UIColor cyanColor];
    self.hrtable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
   _processbtn.userInteractionEnabled=YES;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _searchbar.text=@"";
    [self AllSkills];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)CloseThisPAge:(id)sender
{_searchbar.text=@"";
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)selectdisclosure:(id)sender
{   _processbtn.userInteractionEnabled=YES;
    _jobsitebtnlbl.enabled=NO;
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 130, 42)];
    popoverView.backgroundColor = [UIColor whiteColor];
    _povertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 130, 42)];
    _povertableview.delegate=(id)self;
    _povertableview.dataSource=(id)self;
    _povertableview.rowHeight= 42;
    _povertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    //_popovertableview.separatorColor=[UIColor blackColor];
    [popoverView addSubview:_povertableview];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(130, 42);

    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.hrtable];
    NSIndexPath *textFieldIndexPath = [self.hrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
     Empdetails*empdetls1=(Empdetails *)[_hrlistarray objectAtIndex:btnindex];
if ([empdetls1.Inproceesstatus isEqualToString:@"true"])
{

}else
{
    ssn=empdetls1.ssn;
    //UITableView *table = (UITableView *)[cell superview];
    self.povercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    self.povercontroller.popoverContentSize=CGSizeMake(130.0f, 42.0f);
    self.povercontroller=_povercontroller;
    [self.povercontroller presentPopoverFromRect:_disclosurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}
}
-(IBAction)indetailviewselection:(id)sender
{
    button = (UIButton *)sender;
    //UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.hrtable];
    NSIndexPath *textFieldIndexPath = [self.hrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Empdetails*emdl=(Empdetails *)[_hrlistarray objectAtIndex:btnindex];
    NSMutableArray *garray=[[NSMutableArray alloc]initWithObjects:emdl, nil];
    _indetailctrl=[[InDetailhrviewViewController alloc]initWithNibName:@"InDetailhrviewViewController" bundle:nil];
    _indetailctrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _indetailctrl.detailarray=garray;
    [self presentViewController:_indetailctrl animated:YES completion:nil];
    _searchbar.text=@"";
    [self ListAllApplicants];
}
-(void)jobsitepopover{
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 240, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _povertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 240, 200)];
    
    _povertableview.delegate=(id)self;
    _povertableview.dataSource=(id)self;
    _povertableview.rowHeight= 32;
    _povertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_povertableview];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(240, 200);
    
    //create a popover controller
    
    self.povercontroller = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.povercontroller.popoverContentSize=CGSizeMake(240.0f, 200.0f);
    self.povercontroller=_povercontroller;

    
    [self.povercontroller presentPopoverFromRect:_jobsitebtnlbl.frame
                                            inView:self.applicantprocessview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

- (IBAction)clsebtnactn:(id)sender {
    _searchbar.text=@"";
    _applicantprocessview.hidden=YES;
    [self ListAllApplicants];
}
- (IBAction)sitecheckactn:(id)sender {
   //  [self SelectAllJobSites];
    [self JobsSelect];
    btntouch++;
    
    if (btntouch%2) {
        
        [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _jobsitebtnlbl.enabled=YES;
        jobsite=1;
        office=0;
        //_sitechecklbl.enabled=NO;
        
    }
    
    else{
        [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _jobsitebtnlbl.enabled=NO;
        jobsite=0;
        //_sitechecklbl.enabled=YES;
        
    }
    
}
- (IBAction)officecheckactn:(id)sender {
    chektouch++;
    
    if (chektouch%2) {
        
        [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _jobsitebtnlbl.enabled=NO;
        office=1;
        jobsite=0;
        //_officechecklbl.enabled=NO;
        
    }
    
    else{
        [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _jobsitebtnlbl.enabled=YES;
        office=0;
        //_officechecklbl.enabled=YES;
        
    }
    
}

- (IBAction)jobsitebtn:(id)sender {
    poptype=2;
    [self jobsitepopover];
   
    
}
- (IBAction)processbtn:(id)sender {
    if (office==0&&jobsite==0) {
        UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select an option to process the applicant" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [Alert show];
    }
  else if (jobsite==1) {
        if ([_jobsitebtnlbl.titleLabel.text isEqualToString:@"Select Job Site"]) {
            UIAlertView *Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select a Job Site" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [Alert show];
        }
        else
        {
             [self MoveApplicanttoInprocess];
             _processbtn.userInteractionEnabled=NO;
        }
    }
    else if (office==1)
    {
            [self MoveApplicanttoInprocess];
         _processbtn.userInteractionEnabled=NO;
    }
    
   
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_searchbar.text;
    [self SearchApplicants];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self ListAllApplicants];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        
        //[searchBar resignFirstResponder];
        [self ListAllApplicants];
        
    }
//    else  if ([_searchbar.text length]>0) {
//        
//        
//        
//        
//        _searchstring=_searchbar.text;
//        
//        
//    }
    
}




#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   if(tableView==_hrtable)
{
    return [_hrlistarray count];
}
    else if(tableView==_povertableview)
    {
        if(poptype==1)
    {
        return [_disclosurearray count];
    }
        else
        {
            return [_JobsiteArray count];
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
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_hrtable){
            
            [[NSBundle mainBundle]loadNibNamed:@"Customhrcell" owner:self options:nil];
            cell=_hrtblecell;
        }
        if (tableView==_povertableview) {
            if (poptype==1) {
                
                
                cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
                
                
                
                cell.textLabel.text=[_disclosurearray objectAtIndex:indexPath.row];
            }
            else
            {
                cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
                
                
                
                cell.textLabel.text=[_JobsiteArray objectAtIndex:indexPath.row];
            }
        }

        
        
        //        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (tableView==_hrtable) {
            Empdetails*empdetls1=(Empdetails *)[_hrlistarray objectAtIndex:indexPath.row];

        
        _ssnlabel=(UILabel*)[cell viewWithTag:1];
        _ssnlabel.text=empdetls1.ssn;
        _firstnamelbl=(UILabel*)[cell viewWithTag:2];
        _firstnamelbl.text=empdetls1.firstname;
        _lastnamelabel=(UILabel*)[cell viewWithTag:3];
        _lastnamelabel.text=empdetls1.lastname;
        _cellphnlbl=(UILabel*)[cell viewWithTag:4];
        _cellphnlbl.text=empdetls1.Phonenumber;
        _skilllbl=(UILabel*)[cell viewWithTag:5];
        _skilllbl.text=empdetls1.skillid;
        _craftlbl=(UILabel*)[cell viewWithTag:6];
        _craftlbl.text=empdetls1.othercraft;
        _jobsitelbl=(UILabel*)[cell viewWithTag:7];
       _jobsitelbl.text=empdetls1.jobsitename;
    }
        return cell;
}


#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (tableView==_hrtable) {
        Empdetails*empdetls1=(Empdetails *)[_hrlistarray objectAtIndex:indexPath.row];
       
        
        if (indexPath.row%2 == 0) {
            if ([empdetls1.Inproceesstatus isEqualToString:@"true"]) {
                
                
                
                
                //[cell setBackgroundColor:[UIColor colorWithRed:255.0/255.0f green:174.0/255.0f blue:185.0/255.0f alpha:1.0f]];
                [cell setBackgroundColor:[UIColor colorWithRed:121.0/255.0f green:205.0/255.0f blue:205.0/255.0f alpha:1.0f]];
                
            }
            else
            {
                [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }
        }
        else
        {
            if ([empdetls1.Inproceesstatus isEqualToString:@"true"]) {
                
                
                
                
               // [cell setBackgroundColor:[UIColor colorWithRed:255.0/255.0f green:174.0/255.0f blue:185.0/255.0f alpha:1.0f]];
               [cell setBackgroundColor:[UIColor colorWithRed:121.0/255.0f green:205.0/255.0f blue:205.0/255.0f alpha:1.0f]];
                
                
            }
            else
            {

            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
            }
        }
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"sectn%d",indexPath.section);
       if (tableView==_povertableview) {
        if (poptype==1) {
            [_jobsitebtnlbl setTitle:@"Select Job Site" forState:UIControlStateNormal];
            [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];

        
            [self.povercontroller dismissPopoverAnimated:YES];
        _applicantprocessview.hidden=NO;
            _navitem.title=[NSString stringWithFormat:@"Process Applicant-%@",ssn];
        }
        else
        {
             [_jobsitebtnlbl setTitle:[_JobsiteArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            [self.povercontroller dismissPopoverAnimated:YES];
        }
    }
}
#pragma mark-Webservices
-(void)AllSkills{
    webstring=@"skill";
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ListAllApplicants{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListAllApplicants xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ListAllApplicants>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ListAllApplicants" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MoveApplicanttoInprocess{
    recordResults = FALSE;
    NSString *soapMessage;
    Empdetails*empdetls1=(Empdetails *)[_hrlistarray objectAtIndex:btnindex];
    NSInteger  admin;
    NSInteger jobsiteno;
    
    
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate: localDate];
    
    
    
    if (btntouch%2) {
        admin=0;
        NSLog(@"%@",_jobsitebtnlbl.titleLabel.text);
      
        NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
     NSString*job=[NSString stringWithFormat:@"%@", [array objectAtIndex:0]];
        jobsiteno=[[_jobsitedict objectForKey:job]integerValue];
        
    }
    
    else {
        //        admin=0;
        //        jobsiteno=0;
    }
    if (chektouch%2) {
        admin=1;
        jobsiteno=0;
    }
    else{
        
    }
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<MoveApplicanttoInprocess xmlns=\"http://ios.kontract360.com/\">\n"
                   "<appid>%d</appid>\n"
                   "<jobsite>%d</jobsite>\n"
                   "<admin>%d</admin>\n"
                   "<pdate>%@</pdate>\n"
                   "</MoveApplicanttoInprocess>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdetls1.applicantid,jobsiteno,admin,dateString];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MoveApplicanttoInprocess" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllJobSites{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllJobSites xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllJobSites>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllJobSites" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SearchApplicants{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchApplicants xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchApplicants>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchApplicants" forHTTPHeaderField:@"Soapaction"];
    
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
    [_hrtable reloadData];
    if ([webstring isEqualToString:@"skill"]) {
        [self ListAllApplicants];
        webstring=@"app";
    }
    [_povertableview reloadData];
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListAllApplicantsResult"])
    {
        _hrlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_CellPhone"])
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
    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"jobsitename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"applicant_City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"BasicPlus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"InProcess"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_photo"])
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
    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"SelectAllJobSitesResult"])
    {
        _JobsiteArray=[[NSMutableArray alloc]init];
        _jobsitedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
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
    if([elementName isEqualToString:@"SearchApplicantsResponse"])
    {
        webstring=@"Fetchapp";
        _hrlistarray=[[NSMutableArray alloc]init];
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MoveApplicanttoInprocessResponse"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobsitedict=[[NSMutableDictionary alloc]init];
        _JobsiteArray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"]){
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
    if([elementName isEqualToString:@"JobDescDetail"])
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
    
    
    if([elementName isEqualToString:@"JobSiteName"])
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
    if([elementName isEqualToString:@"applicant_Id"])
    {
        _empdetl=[[Empdetails alloc]init];
        recordResults = FALSE;
        _empdetl.applicantid=[_soapResults integerValue];
        
        //[self FetchImage];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
       
        _empdetl.firstname=_soapResults;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
       
        _empdetl.lastname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        recordResults = FALSE;
        _empdetl.ssn=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
        _empdetl.Phonenumber=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SkillName"])
    {
        recordResults = FALSE;
        
          _empdetl.skillid=_soapResults;
        [_JobsiteArray addObject:[NSString stringWithFormat:@"%@-%@-%@",jobsitename,jobstring,_soapResults]];
        //[_skilldict setObject:_soapResults forKey:jobnumber];

        
        _soapResults = nil;
    }
   
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _empdetl.othercraft=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"jobsitename"])
    {
        recordResults = FALSE;
        _empdetl.jobsitename=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"EmployeeStatus"])
    {
        recordResults = FALSE;
        _empdetl.empstatus=_soapResults;
        if ([_empdetl.empstatus isEqualToString:@"true"]) {
            _empdetl.emp=1;
            
        }
        else{
            _empdetl.emp=0;
        }
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContactNo"])
    {
        recordResults = FALSE;
        _empdetl.emergencycontact=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_DOB"])
    {
        recordResults = FALSE;
        _empdetl.dob=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        recordResults = FALSE;
        _empdetl.zip=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        recordResults = FALSE;
        _empdetl.state=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Address"])
    {
        recordResults = FALSE;
        _empdetl.address=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        recordResults = FALSE;
        _empdetl.city=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_DrivingLicense"])
    {
        recordResults = FALSE;
        _empdetl.drivinglicenceno=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_NameinLicense"])
    {
        recordResults = FALSE;
        _empdetl.nameinlicence=_soapResults;
        _soapResults = nil;
    }
    
    
    
    
    if([elementName isEqualToString:@"applicant_EmergencyContact"])
    {
        recordResults = FALSE;
        _empdetl.emergencycontactname=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_Gender"])
    {
        recordResults = FALSE;
        _empdetl.gender=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"applicant_AlternateNo"])
    {
        recordResults = FALSE;
        _empdetl.alternativeno=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"BasicPlusExpiry"])
    {
        recordResults = FALSE;
        _empdetl.basicplusexp=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_TWIC"])
    {
        recordResults = FALSE;
        _empdetl.twiccardno=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"BasicPlus"])
    {
        recordResults = FALSE;
        _empdetl.basicplus=_soapResults;
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_Email"])
    {
        recordResults = FALSE;
        _empdetl.email=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"applicant_phone"])
    {
        recordResults = FALSE;
        _empdetl.phone=_soapResults;
        _soapResults = nil;
        
    }
    
    
    if([elementName isEqualToString:@"applicant_LicenseState"])
    {
        recordResults = FALSE;
        _empdetl.stateissuinglicence=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"country_name"])
    {
        recordResults = FALSE;
        _empdetl.country=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_photo"])
    {
        recordResults = FALSE;
        _empdetl.photo=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"InProcess"])
    {
        recordResults = FALSE;
        _empdetl.Inproceesstatus=_soapResults;
        [_hrlistarray addObject:_empdetl];
        _soapResults = nil;
        
    }
//       if([elementName isEqualToString:@"Id"])
//    {
//        
//        recordResults = FALSE;
//        
//        jobstring=_soapResults;
//        _soapResults = nil;
//    }
//    if([elementName isEqualToString:@"JobSiteName"])
//    {
//        
//        recordResults = FALSE;
//        
//        
//        [_JobsiteArray addObject:_soapResults];
//        [_jobsitedict setObject:jobstring forKey:_soapResults];
//        
//        _soapResults = nil;
//    }
    if([elementName isEqualToString:@"result"])
    {
        
        
        
        recordResults = FALSE;
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
       
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"id"])
    {
        
        
        recordResults = FALSE;
        jobid=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        // [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",jobnumber,_soapResults]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults = FALSE;
        jobsitename=_soapResults;
        [_jobsitedict setObject:jobid forKey:_soapResults];
        //[_revjobdict setObject:_soapResults forKey:jobstring];
        
        // [_jobarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSkillId"])
    {
        recordResults = FALSE;
        _soapResults = nil;
    }
 


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Applicant Processed Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            
            
            [_jobsitebtnlbl setTitle:@"Select Job Site" forState:UIControlStateNormal];
            [_sitechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_officechecklbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            _applicantprocessview.hidden=YES;
            _processbtn.userInteractionEnabled=YES;
            _searchbar.text=@"";
            [self ListAllApplicants];
            
            
        }
    }
}

@end
