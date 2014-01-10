//
//  FleetsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "FleetsViewController.h"

@interface FleetsViewController ()

@end

@implementation FleetsViewController

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
    _fleetTable.layer.borderWidth = 2.0;
    _fleetTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _view1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.fleetTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self SelectAllfleet];
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_suserachbtnlbl.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}


#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self Searchfleet];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    // [self Allmanpwrarry];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllfleet];
        // [searchBar resignFirstResponder];
        
        
    }
   // [searchBar resignFirstResponder];
    
    
}

#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_subtypearray count];
    }
    else if(tableView==_fleetTable){
        
        return [_fleetarray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
           cell.textLabel.font=[UIFont systemFontOfSize:12];
        if(tableView==_fleetTable){
            [[NSBundle mainBundle]loadNibNamed:@"FleetCell" owner:self options:nil];
            cell=_fleetcell;
        }
    }
    if (tableView==_popOverTableView){
        cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
    }
    if(tableView==_fleetTable){
       Equpmntmdl*eqmdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
        _codelbl=(UILabel *)[cell viewWithTag:1];
        _codelbl.text=eqmdl.itemcode;
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=eqmdl.itemdescptn;
        _typelbl=(UILabel *)[cell viewWithTag:3];
        _typelbl.text=eqmdl.subtype;
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        
        _subtypetxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
    }
    
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deltepath=indexPath.row;
        
        [self Deletefleet];
        [_fleetarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

#pragma mark- WebService
-(void)SelectAllfleet{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllfleet xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllfleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllfleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllSubtypefleet{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypefleet xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllSubtypefleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllSubtypefleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Insertfleet{
    webtype=1;
    recordResults = FALSE;
    NSString*picturelocatn=@"";
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Insertfleet xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<Description>%@</Description>\n"
                   "<SubType>%@</SubType>\n"
                   "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "</Insertfleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_codetxtfld.text,_destxtfld.text,_subtypetxtfld.text,[_purchasetxtfld.text doubleValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],picturelocatn,[_insuredtxtfld.text doubleValue],[_hurstxtfld.text doubleValue],[_fueltxtfld.text doubleValue],_condtntxtfld.text,[_hurlytxtfld.text doubleValue],[_dailytxtfld.text doubleValue],[_shiftwisetxtfld.text doubleValue],[_weeklytxtfld.text doubleValue],[_monthlytxtfld.text doubleValue],[_yearlytxtfld.text doubleValue],[_stockinhandtxtfld.text doubleValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Insertfleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Updatefleet{
    webtype=2;
    recordResults = FALSE;
    NSString*picturelocatn=@"";
    NSString *soapMessage;
  Equpmntmdl*eqmdl=(Equpmntmdl *)[_fleetarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Updatefleet xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<Description>%@</Description>\n"
                   "<SubType>%@</SubType>\n"
                   "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                   "<entryid>%d</entryid>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "</Updatefleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_codetxtfld.text,_destxtfld.text,_subtypetxtfld.text,[_purchasetxtfld.text doubleValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],picturelocatn,[_insuredtxtfld.text doubleValue],[_hurstxtfld.text doubleValue],[_fueltxtfld.text doubleValue],_condtntxtfld.text,[_hurlytxtfld.text doubleValue],[_dailytxtfld.text doubleValue],[_shiftwisetxtfld.text doubleValue],[_weeklytxtfld.text doubleValue],[_monthlytxtfld.text doubleValue],[_yearlytxtfld.text doubleValue],eqmdl.entryid,[_stockinhandtxtfld.text doubleValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Updatefleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Deletefleet{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
  Equpmntmdl*eqmdl=(Equpmntmdl *)[_fleetarray objectAtIndex:deltepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Deletefleet xmlns=\"http://ios.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "</Deletefleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eqmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Deletefleet" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Searchfleet{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Searchfleet xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</Searchfleet>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Searchfleet" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConenction" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
    if (webtype==1||webtype==2||webtype==3) {
        [self SelectAllfleet];
        webtype=0;
    }
    [_fleetTable reloadData];
    [_popOverTableView reloadData];
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    
    if([elementName isEqualToString:@"SelectAllSubtypefleetResult"])
    {
        _subtypearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subtype"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SelectAllfleetResult"])
    {
        _fleetarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ItemCode"])
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
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SearchfleetResponse"])
    {
        _fleetarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
            
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"InsertfleetResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"UpdatefleetResult"])
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
    if([elementName isEqualToString:@"subtype"])
    {
        
        
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        _Fleetmdl=[[Equpmntmdl alloc]init];
        recordResults = FALSE;
        
        _Fleetmdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.itemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.subtype=_soapResults;
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.PurchaseValue=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.SerialNo=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.ManufacturedYear=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.PictureLocation=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.InsuredValue=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.HoursUsed=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.FuelConsumptionPerHour=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.Condition=_soapResults;
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.HourlyRate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.DailyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.ShiftwiseRate=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.WeeklyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.MonthlyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        recordResults = FALSE;
        _Fleetmdl.YearlyRate=_soapResults;
        [_fleetarray addObject:_Fleetmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        _codetxtfld.text=@"";
        _destxtfld.text=@"";
        _subtypetxtfld.text=@"";
        _purchasetxtfld.text=@"";
        _serialtxtfld.text=@"";
        _manufattxtfld.text =@"";
        _insuredtxtfld.text=@"";
        _hurstxtfld.text=@"";
        _fueltxtfld.text=@"";
        _condtntxtfld.text=@"";
        _hurlytxtfld.text=@"";
        _dailytxtfld.text=@"";
        _shiftwisetxtfld.text=@"";
        _weeklytxtfld.text=@"";
        _monthlytxtfld.text=@"";
        _yearlytxtfld.text=@"";
        _stockinhandtxtfld.text=@"";

        _soapResults = nil;

    }
}

#pragma mark-IBActions







- (IBAction)subsearchbtn:(id)sender; {
    [self createpopover];
    [self SelectAllSubtypefleet
     ];
}

- (IBAction)deletebtn:(id)sender {
    btntype=3;
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_fleetTable setEditing:NO animated:NO];
        [_fleetTable  reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_fleetTable  setEditing:YES animated:YES];
        [_fleetTable  reloadData];
        
        
        
        
    }
    
    
}

- (IBAction)closebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)addbtn:(id)sender{
    _codetxtfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
      _stockinhandtxtfld.text=@"";
    
    btntype=1;
    _addview.hidden=NO;
    _navitem.title=@"ADD";
}




- (IBAction)Addclosebtn:(id)sender


{
    _addview.hidden=YES;
    
}
- (IBAction)editbtn:(id)sender

{
    btntype=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.fleetTable];
    NSIndexPath *textFieldIndexPath = [self.fleetTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    path=textFieldIndexPath.row;
 Equpmntmdl*eqmdl=(Equpmntmdl *)[_fleetarray objectAtIndex:textFieldIndexPath.row];
    _codetxtfld.text=eqmdl.itemcode;
    _destxtfld.text=eqmdl.itemdescptn;
    _subtypetxtfld.text=eqmdl.subtype;
    _purchasetxtfld.text=eqmdl.PurchaseValue;
    _serialtxtfld.text=eqmdl.SerialNo;
    _manufattxtfld.text =eqmdl.ManufacturedYear;
    _insuredtxtfld.text=eqmdl.InsuredValue;
    _hurstxtfld.text=eqmdl.HoursUsed;
    _fueltxtfld.text=eqmdl.FuelConsumptionPerHour;
    _condtntxtfld.text=eqmdl.Condition;
    _hurlytxtfld.text=eqmdl.HourlyRate;
    _dailytxtfld.text=eqmdl.DailyRate;
    _shiftwisetxtfld.text=eqmdl.ShiftwiseRate;
    _weeklytxtfld.text=eqmdl.WeeklyRate;
    _monthlytxtfld.text=eqmdl.MonthlyRate;
    _yearlytxtfld.text=eqmdl.YearlyRate;
      _stockinhandtxtfld.text=eqmdl.stockinhand;
    
    _addview.hidden=NO;
    _navitem.title=@"EDIT";
    
}




- (IBAction)updatebtn:(id)sender {
    if (btntype==1) {
        [self Insertfleet];
    }
    if (btntype==2) {
        [self Updatefleet];
    }
}

- (IBAction)cancelbtn:(id)sender {
    _codetxtfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
    _stockinhandtxtfld.text=@"";

}






@end
