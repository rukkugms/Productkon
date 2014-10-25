//
//  EmplyhrmgntViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EmplyhrmgntViewController.h"

@interface EmplyhrmgntViewController ()

@end

@implementation EmplyhrmgntViewController

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
    _badgeview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
      self.openviewindex=NSNotFound;
    _mgmttableview.layer.borderWidth = 2.0;
    _mgmttableview.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.mgmttableview.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      [self SelectAllJobSites];
    self.openviewindex=NSNotFound;
   // previousindexpath=NSNotFound;
  
   
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closeempmgmt:(id)sender
{
    self.openviewindex=NSNotFound;

    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark-tableview datasources
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_employeelistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"empmgmtcell" owner:self options:nil];
        cell=_mgmtcell;
    }
    
    Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:indexPath.row];
    _ssnlabel=(UILabel *)[cell viewWithTag:1];
    _ssnlabel.text=empmdl.ssn;
    _firstnamelabel=(UILabel *)[cell viewWithTag:2];
    _firstnamelabel.text=empmdl.firstname;
    _lastnamelabel=(UILabel *)[cell viewWithTag:3];
    _lastnamelabel.text=empmdl.lastname;
    _jobsitelabel=(UILabel *)[cell viewWithTag:4];
    _jobsitelabel.text=empmdl.jobsite;
    
    
    /*detailbtn*/
//    butn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [butn setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
//    [butn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
//    //butn.tag=indexPath.row;
//    [butn addTarget:self action:@selector(showaction:) forControlEvents:UIControlEventTouchUpInside];
//    butn.frame = CGRectMake(150.0, 0.0, 50.0, 40.0);
//
//       [cell.contentView addSubview:butn];

    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color)
    
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        
    }
}

#pragma mark-Menu view Animation
-(void)showaction:(UIButton*)sender{
    // [_animatedview removeFromSuperview];
    
    btnclck++;
    
        
    _badgelbl.hidden=YES;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
        .frame =  CGRectMake(200, 10, 0, 0);} completion:nil];
    
    _animatedview.hidden=YES;
    Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:sender.tag];
    
    
    
    
    UIButton*  button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
    NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
//    if(btnclck%2!=0){
//        if (previousindexpath!=NSNotFound) {
//            
//        
//           [button setImage:[UIImage imageNamed:@"carat-open"] forState:UIControlStateNormal];
//               CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
//        NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
//        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//            
//        }
//    }
//   else{
//      
//       [button setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
//
//        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
//        NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
//        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//    }

    
    
    //create uiview
    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(200, 10, 0, 25)];
    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _badgelbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    _badgelbl.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    _badgelbl.textColor=[UIColor blackColor];
    _badgelbl.text=@"Badge Details";
    [self.animatedview addSubview:_badgelbl];
    
    _badgelbl.hidden=YES;
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(badgedetails)];
    [self.animatedview addGestureRecognizer:tap];
    
    [cell addSubview:_animatedview];
    
   _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(200, 10, 90, 25);} completion:nil];
    
    _badgelbl.hidden=NO;
    NSLog(@"%@",empmdl.badgeflag);
    if ([empmdl.badgeflag isEqualToString:@"true"]) {
        _badgelbl.enabled=NO;
        _animatedview.userInteractionEnabled=NO;
        //_animatedview.
        
    }
    
    [self showviewWithUserAction:YES];
}

-(void)showviewWithUserAction:(BOOL)userAction{
    
    // Toggle the disclosure button state.
    
             butn.selected = !butn.selected;

          
       if (userAction) {
        if (butn.selected) {
            _animatedview.hidden=NO;
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
                .frame =  CGRectMake(200, 10, 90, 25);} completion:nil];
             //[butn setImage:[UIImage imageNamed:@"carat-open"] forState:UIControlStateSelected];
            [self viewopened:btnindex];
            _badgelbl.hidden=NO;
            
            
            
        }
        else{
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
                .frame =  CGRectMake(200, 10, 90, 25);} completion:nil];
             // [butn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
            [self viewclosed:btnindex];
            //_venderlbl.hidden=YES;
            
        }
        
        
    }
}
-(void)viewopened:(NSInteger)viewopened{
    
    viewopened=btnindex;
    selectedcell=viewopened;
    NSInteger previousOpenviewIndex = self.openviewindex;
    
    if (previousOpenviewIndex != NSNotFound) {
        ////        Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenviewIndex];
        ////        previousOpenSection.open=NO;
        [self showviewWithUserAction:NO];
        //        NSInteger countOfRowsToDelete = selectedcell;
        //        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
        _badgelbl.hidden=YES;
        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{  _animatedview
            .frame =  CGRectMake(200, 10, 0, 0);} completion:nil];
         //[butn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
        _animatedview.hidden=YES;
        
        
        // }
        
        
    }
    
    self.openviewindex=viewopened;
    
    
    
    
    
    
}
-(void)viewclosed:(NSInteger)viewclosed
{
    
    viewclosed=btnindex;
     //[butn setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateSelected];
    self.openviewindex = NSNotFound;
    
    
}
-(void)badgedetails{
     Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:btnindex];
     [self SelectEmployeeBadge];
    _badgeview.hidden=NO;
    _firsttxtfld.text=empmdl.firstname;
    _lastnametxtfld.text=empmdl.lastname;
    _ssntxtfld.text=empmdl.ssn;
    _jobsitetxtfld.text=empmdl.jobsite;
    
}
#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    //[self SearchServices];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //[self SelectAllServices];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        //[self SelectAllServices];
        
        
    }
    
}
#pragma mark-webservice
-(void)CustEmployeeselect{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustEmployeeselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   
                   "</CustEmployeeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CustEmployeeselect" forHTTPHeaderField:@"Soapaction"];
    
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
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllJobSites xmlns=\"http://testUSA.kontract360.com/\">\n"
                   
                   "</SelectAllJobSites>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SelectAllJobSites" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectEmployeeBadge{

    recordResults = FALSE;
    NSString *soapMessage;
    Empmdl *empmdl1=(Empmdl *)[_employeelistarray objectAtIndex:btnindex];

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectEmployeeBadge xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<cempId>%d</cempId>\n"
                   "</SelectEmployeeBadge>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[empmdl1.cempid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SelectEmployeeBadge" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertEmployeeBadge{
    
    recordResults = FALSE;
    NSString *soapMessage;
    Empmdl *empmdl1=(Empmdl *)[_employeelistarray objectAtIndex:btnindex];
    
    
  soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertEmployeeBadge xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<CempId>%d</CempId>\n"
                   "<BadgeNo>%@</BadgeNo>\n"
                   "</InsertEmployeeBadge>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[empmdl1.cempid integerValue],_badgenumbrtxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/InsertEmployeeBadge" forHTTPHeaderField:@"Soapaction"];
    
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
    if (webtype==1) {
        [self CustEmployeeselect];
        webtype=0;
    }
    [_mgmttableview reloadData];
    
}

#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CustEmployeeselectResult"])
    {
        _employeelistarray=[[NSMutableArray alloc]init];
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"cemp_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"vf_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"vl_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"vss_no"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"vaddress1"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BadgeFlag"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"job_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SelectAllJobSitesResult"])
    {
        _jobsitearray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"SelectEmployeeBadgeResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"BadgeNo"])
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
    if([elementName isEqualToString:@"cemp_id"])
    {
        _empmdl=[[Empmdl alloc]init];
                recordResults = FALSE;
        _empmdl.cempid=_soapResults;
        
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"vf_name"])
    {
        recordResults = FALSE;
       // _empmdl=[[Empmdl alloc]init];

        _empmdl.firstname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"vl_name"])
    {
        recordResults = FALSE;
        _empmdl.lastname=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"vss_no"])
    {
        recordResults = FALSE;
           _empmdl.ssn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"not_rate"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    

    if([elementName isEqualToString:@"BadgeFlag"])
    {
        recordResults = FALSE;
        _empmdl.badgeflag=_soapResults;
       
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"job_id"])
    {
        recordResults = FALSE;
      NSString*trimstrg= [_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _empmdl.jobsite=[_jobsitedict objectForKey:trimstrg];
        NSLog(@"%@",[_jobsitedict objectForKey:trimstrg]);
        [_employeelistarray addObject:_empmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        recordResults=FALSE;
        _jobsiteid=_soapResults;
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"JobSiteName"])
    {
        recordResults=FALSE;
        [_jobsitearray addObject:_soapResults];
        [_jobsitedict setObject:_soapResults forKey:_jobsiteid];
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"BadgeNo"])
    {
          recordResults=FALSE;
        _badgenumbrtxtfld.text=_soapResults;
         _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"result"])
    {
        recordResults=FALSE;
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

 _soapResults=nil;
        
    }
    



}

- (IBAction)savebtn:(id)sender {
    
    if (_badgenumbrtxtfld.text.length==0) {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Badge number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    [self InsertEmployeeBadge];
    }
}

- (IBAction)badgeclsebtn:(id)sender {
    _badgeview.hidden=YES;
    self.openviewindex=NSNotFound;
    [self CustEmployeeselect];

}
- (IBAction)disclbtn:(id)sender {
    
    _badgelbl.hidden=YES;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
        .frame =  CGRectMake(200, 10, 0, 0);} completion:nil];
    
    _animatedview.hidden=YES;
  
    
    
    
    
    UIButton*  button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
    NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
      Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:textFieldIndexPath.row];
    btnindex=textFieldIndexPath.row;
    //    if(btnclck%2!=0){
    //           [button setImage:[UIImage imageNamed:@"carat-open"] forState:UIControlStateNormal];
    //               CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
    //        NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
    //        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    //    }
    //   else{
    //
    //       [button setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
    //
    //        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttableview];
    //        NSIndexPath *textFieldIndexPath = [self.mgmttableview indexPathForRowAtPoint:rootViewPoint];
    //        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    //    }
    
    
    
    //create uiview
    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(200, 10, 0, 25)];
    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
    _badgelbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
    _badgelbl.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    _badgelbl.textColor=[UIColor blackColor];
    _badgelbl.text=@"Badge Details";
    [self.animatedview addSubview:_badgelbl];
    
    _badgelbl.hidden=YES;
    
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(badgedetails)];
    [self.animatedview addGestureRecognizer:tap];
    
    [cell addSubview:_animatedview];
    
    _animatedview.hidden=NO;
    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
        .frame =  CGRectMake(200, 10, 90, 25);} completion:nil];
    
    _badgelbl.hidden=NO;
    NSLog(@"%@",empmdl.badgeflag);
    if ([empmdl.badgeflag isEqualToString:@"true"]) {
        _badgelbl.enabled=NO;
        _animatedview.userInteractionEnabled=NO;
        //_animatedview.
        
    }
    
    [self showviewWithUserAction:YES];

}
@end
