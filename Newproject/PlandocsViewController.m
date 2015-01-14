//
//  PlandocsViewController.m
//  Newproject
//
//  Created by Riya on 10/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlandocsViewController.h"

@interface PlandocsViewController ()

@end

@implementation PlandocsViewController

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
    self.titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    [self PlanDocumentsSelect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-webservice
-(void)PlanDocumentsSelect
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanDocumentsSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</PlanDocumentsSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PlanDocumentsSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [_documnttable reloadData];
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"PlanDocumentsSelectResponse"])
    {
        //_brcraftarray=[[NSMutableArray alloc]init];
        _docmntdict=[[NSMutableDictionary alloc]init];
        
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
    
    if([elementName isEqualToString:@"DocumentType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FilePath"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
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
        
        recordResults = FALSE;
        //jobtypeitm=_soapResults;
        
        
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"DocumentType"])
    {
        recordResults = FALSE;
       docname=_soapResults;
    _soapResults = nil;
    }
    if([elementName isEqualToString:@"FilePath"])
    {
        recordResults = FALSE;
        [_docmntdict setObject:_soapResults forKey:docname];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        recordResults = FALSE;
        
        _soapResults = nil;
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
    
    // Return the number of rows in the section.
       
    if ( tableView==_documnttable){
        return [_docmntdict count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_documnttable) {
            [[NSBundle mainBundle]loadNibNamed:@"Plandocuscell" owner:self options:nil];
            cell=_doccell;
        }
        
        
        
        
        
    }
    
    
    if (tableView==_documnttable) {
       // NSArray*array=[_docmntdict allKeys];
        _documntarray=[[_docmntdict allKeys]mutableCopy];
        _docnamelbl=(UILabel *)[cell viewWithTag:1];
        _docnamelbl.text=[_documntarray objectAtIndex:indexPath.row];
    }
    
    
    
    
    return cell;
    
    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)viewbtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.documnttable];
    NSIndexPath *textFieldIndexPath = [self.documnttable indexPathForRowAtPoint:rootViewPoint];
    
    
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    //USerdocid=[[_fileiddict objectForKey:[_documntarray objectAtIndex:textFieldIndexPath.row]]integerValue];
    
   
    NSString *fullURL =[NSString stringWithFormat:@"http://ios.kontract360.com%@",[_docmntdict objectForKey:[_documntarray objectAtIndex:textFieldIndexPath.row]]];
    NSLog(@"fullurl%@",fullURL);
    self.webVCtrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
   
    _webVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    _webVCtrl.urlstring=fullURL;
    
    [self presentViewController:_webVCtrl
                       animated:YES completion:NULL];

}
@end
