//
//  PhsestViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/14/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PhsestViewController.h"

@interface PhsestViewController ()

@end

@implementation PhsestViewController

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
    [self HourlyResourceSelect];
}
   
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Webservice
-(void)HourlyResourceSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<HourlyResourceSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<LeadId>%d</LeadId>\n"
                   "</HourlyResourceSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_estmtnid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/HourlyResourceSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_phasetable reloadData];

    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"HourlyResourceSelectResponse"])
    {
        _phasearray=[[NSMutableArray alloc]init];
             if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PhaseNameId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
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
    if([elementName isEqualToString:@"PhaseNameId"])
    {_rephasemdl=[[Rephase alloc]init];
        
        recordResults = FALSE;
        _rephasemdl.phaseid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults = FALSE;
        _rephasemdl.phasename=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        recordResults = FALSE;
         _rephasemdl.labour=_soapResults;
    
        [_phasearray addObject:_rephasemdl];
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
        if (tableView==_phasetable) {
      
            return [_phasearray count];
    }
    
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_phasetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Phestcell" owner:self options:nil];
            cell=_phasecell;
            
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
     if (tableView==_phasetable) {
        
        Rephase*rephasemdl=(Rephase *)[_phasearray objectAtIndex:indexPath.row];
        _phaselbl=(UILabel *)[cell viewWithTag:1];
         _phaselbl.text=rephasemdl.phasename;
        _labourlbl=(UILabel *)[cell viewWithTag:2];
         _labourlbl.text=rephasemdl.labour;

         
        
    }
    
    
    
    return cell;
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

- (IBAction)phasebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)equpbtn:(id)sender {
    webtype=1;
    button = (UIButton *)sender;
    CGPoint center= button.center;
  
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
   
   
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"PhasecomponentsViewController" bundle:nil];
   // }
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
      _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
      _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)matbtn:(id)sender
{
    webtype=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
    
    
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"MatPhaseEst" bundle:nil];
    //}
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
    _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];
}

- (IBAction)fleetbtn:(id)sender {
    webtype=3;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
    
    
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"PhasecomponentsViewController" bundle:nil];
    //}
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
    _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)thirdbtn:(id)sender {
    webtype=4;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
    
    
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"PhasecomponentsViewController" bundle:nil];
   // }
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
    _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)consumbtn:(id)sender
{
    webtype=5;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
    
    
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"MatPhaseEst" bundle:nil];
  //  }
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
    _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)othrsbtn:(id)sender
{
    webtype=6;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.phasetable];
    NSIndexPath *textFieldIndexPath = [self.phasetable indexPathForRowAtPoint:rootViewPoint];
    Rephase *rephaemdl=(Rephase *)[_phasearray objectAtIndex:textFieldIndexPath.row];
    
    
//    if (!self.PhasecmpntVCtrl) {
        self.PhasecmpntVCtrl=[[PhasecomponentsViewController alloc]initWithNibName:@"MatPhaseEst" bundle:nil];
    //}
    _PhasecmpntVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _PhasecmpntVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _PhasecmpntVCtrl.estmtnid=_estmtnid;
    _PhasecmpntVCtrl.webtype=webtype;
    _PhasecmpntVCtrl.phaseid=rephaemdl.phaseid;
    [self presentViewController:_PhasecmpntVCtrl
                       animated:YES completion:NULL];

}
@end
