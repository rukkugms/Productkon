//
//  DetailmarkupsectionViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 07/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailmarkupsectionViewController.h"

@interface DetailmarkupsectionViewController ()

@end

@implementation DetailmarkupsectionViewController

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
    

     [self MarkupSubselect];
     _navitem.title=_mainheader;
    self.marktitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    
    _markdetailtable.layer.borderWidth=2;
    _markdetailtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f].CGColor;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self MarkupSubselect];
    _navitem.title=_mainheader;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closedetailpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark-Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return [_subdetailarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"custmarkdetailcell" owner:self options:nil];
        cell=_markcell;
    }
    
    
    
        subheadermarkmodel *headmark=(subheadermarkmodel*)[_subdetailarray objectAtIndex:indexPath.row];
        _subheaderlabel=(UILabel*)[cell viewWithTag:1];
        _subheaderlabel.text=headmark.SubHeader;
        _variablelabel=(UILabel*)[cell viewWithTag:2];
        _variablelabel.text=headmark.VariablePercent;
        _fixedlabel=(UILabel*)[cell viewWithTag:3];
        _fixedlabel.text=headmark.FixedDollar;
    if ([headmark.ST isEqualToString:@"true"]) {
        [_stcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else
    {
        [_stcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }
    if ([headmark.OT isEqualToString:@"true"]) {
        [_otcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else
    {
        [_otcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }
    if ([headmark.RCIP isEqualToString:@"true"]) {
        [_rcipcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else
    {
        [_rcipcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }
    if ([headmark.Selected isEqualToString:@"true"]) {
        [_selectedcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    }
    else
    {
        [_selectedcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    }


    
//        _stlabel=(UILabel*)[cell viewWithTag:4];
//        _stlabel.text=headmark.ST;
//        _otlabel=(UILabel*)[cell viewWithTag:5];
//        _otlabel.text=headmark.OT;
//        _rciplabel=(UILabel*)[cell viewWithTag:6];
//        _rciplabel.text=headmark.RCIP;
//        _selectedlabel=(UILabel*)[cell viewWithTag:7];
//        _selectedlabel.text=headmark.Selected;
    
    
    
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
}

#pragma mark-Webservices
-(void)MarkupSubselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MarkupSubselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>"
                   "</MarkupSubselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_mainid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MarkupSubselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webdata setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webdata appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webdata length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webdata mutableBytes] length:[_webdata length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webdata];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    
    [_markdetailtable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"MarkupSubselectResponse"])
    {
        _subdetailarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EntrySubId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MainId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"SubHeader"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"VariablePercent"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"FixedDollar"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"ST"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OT"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"RCIP"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Selected"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }




}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"MarkupSubselectResponse"])
    {
        recordResults=FALSE;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"EntrySubId"])
    {
        _submodel=[[subheadermarkmodel alloc]init];
        
        recordResults=FALSE;
        _submodel.EntrySubId=[_soapresults integerValue];
        _soapresults=nil;
        
        
    }
    
    if ([elementName isEqualToString:@"MainId"])
    {
        
        recordResults=FALSE;
        _submodel.MainId=[_soapresults integerValue];
        _soapresults=nil;
    }
    
    if ([elementName isEqualToString:@"SubHeader"])
    {
        
        recordResults=FALSE;
        _submodel.SubHeader=_soapresults;
        _soapresults=nil;
        
    }
    
    if ([elementName isEqualToString:@"VariablePercent"])
    {
        
        recordResults=FALSE;
        _submodel.VariablePercent=_soapresults;
        _soapresults=nil;
        
    }
    
    if ([elementName isEqualToString:@"FixedDollar"])
    {
        
        recordResults=FALSE;
        _submodel.FixedDollar=_soapresults;
        _soapresults=nil;    }
    
    if ([elementName isEqualToString:@"ST"])
    {
        recordResults=FALSE;
        _submodel.ST=_soapresults;
        _soapresults=nil;    }
    
    if ([elementName isEqualToString:@"OT"])
    {
        
        recordResults=FALSE;
        _submodel.OT=_soapresults;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"RCIP"])
    {
        
        recordResults=FALSE;
        _submodel.RCIP=_soapresults;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"Selected"])
    {
        
        recordResults=FALSE;
        _submodel.Selected=_soapresults;
        [_subdetailarray addObject:_submodel];
        _soapresults=nil;
        
    }
    

}

@end
