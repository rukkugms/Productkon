//
//  PhasecomponentsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/15/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PhasecomponentsViewController.h"

@interface PhasecomponentsViewController ()

@end

@implementation PhasecomponentsViewController

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
    self.titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    switch (_webtype) {
        case 1:
             _navabar.title=@"Equipments";
            [self EstimationDetailSelect];

            break;
        case 2:
            _navabar.title=@"Materials";
            [self materialdetailselect];
            
            break;
        case 3:
             _navabar.title=@"Fleets";
            [self FleetDetailSelect];
            
            break;
            
        case 4:
            _navabar.title=@"ThirdParty";
            [self ThirdpartyDetailSelect];
            
            break;

        case 5:
             _navabar.title=@"Consumables";
            [self Consumabledetailselect];
            
            break;
            case 6:
            _navabar.title=@"Others";
            [self OtherDetailSelect];
            
            break;
            
        default:
            break;
    }
  }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Webservice
-(void)EstimationDetailSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Equipments",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetDetailSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Fleet",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ThirdpartyDetailSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Third Party",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)materialdetailselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Materials",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Consumabledetailselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Consumbales",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)OtherDetailSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationDetailSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Name>%@</Name>\n"
                   "<Phase>%d</Phase>\n"
                   "</EstimationDetailSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue],@"Others",[_phaseid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationDetailSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_cmpntstable reloadData];
    [_materialtable reloadData];

    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"EstimationDetailSelectResponse"])
    {
        _Componetsarry=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Manpower"])
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
    if([elementName isEqualToString:@"Qty"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Hourly"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Daily"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Weekly"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Monthly"])
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
    if([elementName isEqualToString:@"Manpower"])
    {
    
        _equpmntmdl=[[Drageqmodel alloc]init];
        recordResults = FALSE;
        _equpmntmdl.eqitemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
       _equpmntmdl.eqdesc=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Qty"])
    {
        
        recordResults = FALSE;
        _equpmntmdl.qty=_soapResults;
        
      
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Hourly"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
             _equpmntmdl.hrate=1;
        }
        else{
              _equpmntmdl.hrate=0;
        }
 
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Daily"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _equpmntmdl.drate=1;
        }
        else{
            _equpmntmdl.drate=0;
        }
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Weekly"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _equpmntmdl.wrate=1;
        }
        else{
            _equpmntmdl.wrate=0;
        }

        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Monthly"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _equpmntmdl.mrate=1;
        }
        else{
            _equpmntmdl.mrate=0;
        }

        [_Componetsarry addObject:_equpmntmdl];
        _soapResults = nil;
    }
    

    
    
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_cmpntstable) {
        
        return [_Componetsarry count];
        
    }
     if (tableView==_materialtable)
     {
         return [_Componetsarry count];
     }
    
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_cmpntstable) {
            [[NSBundle mainBundle]loadNibNamed:@"Componentcell" owner:self options:nil];
            cell=_cmpntcell;
            
        }
        if (tableView==_materialtable) {
            [[NSBundle mainBundle]loadNibNamed:@"Thirdmatothcell" owner:self options:nil];
            cell=_materailcell;
            
        }

        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    if (tableView==_cmpntstable) {
        
        Drageqmodel *eqmdl1=(Drageqmodel *)[_Componetsarry objectAtIndex:indexPath.row];

         _itmcodelbl=(UILabel *)[cell viewWithTag:1];
        _itmcodelbl.text=eqmdl1.eqitemcode;
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=eqmdl1.eqdesc;
        _quantylbl=(UILabel *)[cell viewWithTag:3];
         _quantylbl.text=eqmdl1.qty;
        _ratetxtfld=(UITextField *)[cell viewWithTag:4];
        
        if (eqmdl1.hrate==1) {
            
            _ratetxtfld.text=@"Hourly Rate";
            
        }
        
       else if (eqmdl1.drate==1) {
            
            _ratetxtfld.text=@"Daily Rate";
            
        }
        else if (eqmdl1.wrate==1) {
            
            _ratetxtfld.text=@"Weekly Rate";
            
        }
        else if (eqmdl1.mrate==1) {
            
            _ratetxtfld.text=@"Monthly Rate";
            
        }

    }
    if (tableView==_materialtable) {
        Drageqmodel *eqmdl1=(Drageqmodel *)[_Componetsarry objectAtIndex:indexPath.row];
        
        _matitemcodelabel=(UILabel *)[cell viewWithTag:1];
        _matitemcodelabel.text=eqmdl1.eqitemcode;
        _matdeslabel=(UILabel *)[cell viewWithTag:2];
        _matdeslabel.text=eqmdl1.eqdesc;
        _matquantylabel=(UILabel *)[cell viewWithTag:3];
        _matquantylabel.text=eqmdl1.qty;
        
        
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_cmpntstable||tableView==_materialtable)
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

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
