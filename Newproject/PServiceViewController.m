//
//  PServiceViewController.m
//  Newproject
//
//  Created by Riya on 9/22/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PServiceViewController.h"

@interface PServiceViewController ()

@end

@implementation PServiceViewController
@synthesize delegate;
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
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self Workentryserviceselect];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Webservices

-(void)Workentryserviceselect{
   // _planID=@"Pl-00001";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Workentryserviceselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</Workentryserviceselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planID];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Workentryserviceselect" forHTTPHeaderField:@"Soapaction"];
    
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
   
    [_servicetable reloadData];
    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"WorkentryserviceselectResponse"])
    {
        _servicearray=[[NSMutableArray alloc]init];
        _servicedict=[[NSMutableDictionary alloc]init];
        _servicemdlarray=[[NSMutableArray alloc]init];
      
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
    if([elementName isEqualToString:@"PlanId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ServiceId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PSItemCode"])
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
    if([elementName isEqualToString:@"manhrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"eqphrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Mathrs"])
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
    if([elementName isEqualToString:@"EntryId"])
    {
        _servicemdl=[[Plaservcemdl alloc]init];
        recordResults = FALSE;
        _servicemdl.entryid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults = FALSE;
            _servicemdl.planid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"ServiceId"])
    {
        
        recordResults = FALSE;
        servicestrg=_soapResults;
            _servicemdl.serviceid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PSItemCode"])
    {
        
        recordResults = FALSE;
        
            _servicemdl.psitemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
        
        recordResults = FALSE;
            _servicemdl.skillname=_soapResults;
       
        [_servicedict setObject:servicestrg forKey:_soapResults];
        
        
        [_servicearray addObject:_soapResults];
         [_servicemdlarray addObject:_servicemdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"manhrs"])
    {
        
        recordResults = FALSE;
        
        _servicemdl.mnhr=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"eqphrs"])
    {
        
        recordResults = FALSE;
        
        _servicemdl.eqhr=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Mathrs"])
    {
        
        recordResults = FALSE;
        
        _servicemdl.mthr=[_soapResults stringByReplacingOccurrencesOfString:@"-" withString:@""];
       
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
    
    return [_servicearray count];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
       
            
           [[NSBundle mainBundle]loadNibNamed:@"PServiccell" owner:self options:nil];
           cell=_servicecell;
        
        
       
    }
    Plaservcemdl *pmdl=(Plaservcemdl*)[_servicemdlarray objectAtIndex:indexPath.row];
    _servicelbl=(UILabel *)[cell viewWithTag:1];
    _servicelbl.text=pmdl.skillname;
    _mnhrlbl=(UILabel *)[cell viewWithTag:2];
    _mnhrlbl.text=[NSString stringWithFormat:@"%.2f",[pmdl.mnhr doubleValue]];
    _eqhrlbl=(UILabel *)[cell viewWithTag:3];
    _eqhrlbl.text=[NSString stringWithFormat:@"%.2f",[pmdl.eqhr doubleValue]];
    _mthrlbl=(UILabel *)[cell viewWithTag:4];
    _mthrlbl.text=[NSString stringWithFormat:@"%d",[pmdl.mthr integerValue]];
    
    return cell;
}
#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
  
        
        
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
        }
        
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (IBAction)wrkbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.servicetable];
    NSIndexPath *textFieldIndexPath = [self.servicetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    Plaservcemdl *planservcemdl=(Plaservcemdl *)[_servicemdlarray objectAtIndex:textFieldIndexPath.row];

    self.detailVCtrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
    // }
    skillid=[[_servicedict objectForKey:[_servicearray objectAtIndex:textFieldIndexPath.row]]integerValue];
    //];
    _detailVCtrl.modalPresentationStyle=UIModalPresentationCustom;
    _detailVCtrl.planid=planservcemdl.planid;
    _detailVCtrl.wrktpid=_wrktypid;
    _detailVCtrl.skillsid=[planservcemdl.serviceid integerValue];
    _detailVCtrl.servicename=[_servicearray objectAtIndex:textFieldIndexPath.row];
    _detailVCtrl.pscode=planservcemdl.psitemcode;
    _detailVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    _detailVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;

    [self presentViewController:_detailVCtrl
                       animated:YES completion:NULL];
    
}

- (IBAction)clsebtn:(id)sender {
    
    
    if ([self.delegate respondsToSelector:@selector(workreload)]) {
        [self.delegate workreload];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
        
    }

    }
@end
