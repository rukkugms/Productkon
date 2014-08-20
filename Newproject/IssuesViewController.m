//
//  IssuesViewController.m
//  Newproject
//
//  Created by Riya on 6/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "IssuesViewController.h"

@interface IssuesViewController ()

@end

@implementation IssuesViewController

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
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _issuetable.rowHeight=60;
    _issuetable.layer.borderWidth=3.0;
    _issuetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
//    _addview.layer.borderWidth=3.0;
//    _addview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _statusarray=[[NSMutableArray alloc]initWithObjects:@"Open",@"In Process",@"Closed" ,nil];
    _Typearray=[[NSMutableArray alloc]initWithObjects:@"Man Power",@"Equipment",@"Materials",@"Fleet",@"Third Party",@"Consumables",@"Small Tools",@"Other Company Assets" ,nil];
    [[self.cmmttxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.cmmttxtview layer] setBorderWidth:2];
    [[self.cmmttxtview layer] setCornerRadius:10];
    _typedict=[[NSMutableDictionary alloc]init];
    [_typedict setObject:@"MP" forKey:@"Man Power"];
     [_typedict setObject:@"EQ" forKey:@"Equipment"];
      [_typedict setObject:@"MT" forKey:@"Materials"];
      [_typedict setObject:@"FL" forKey:@"Fleet"];
    [_typedict setObject:@"TP" forKey:@"Third Party"];
     [_typedict setObject:@"CO" forKey:@"Consumables"];
       [_typedict setObject:@"ST" forKey:@"Small Tools"];
      [_typedict setObject:@"OC" forKey:@"Other Company Assets"];
    
    NSArray*keyarray=[_typedict allKeys];
    NSArray*valuearray=[_typedict allValues];
    
    _revtypedict=[[NSMutableDictionary alloc]initWithObjects:keyarray forKeys:valuearray];
    
    
 

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self IssueManagementSelect];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if(tableView==_popOverTableView){
        switch (poptype) {
            case 1:
                 return [_jobarray count];
                break;
            case 2:
                return [_statusarray count];
                break;
            case 3:
                return [_Typearray count];
                break;


            default:
                break;
        }
       
    }
    else{
    return [_Issuearray count];
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

         if(tableView==_issuetable){
         [[NSBundle mainBundle]loadNibNamed:@"IssueCell" owner:self options:nil];
         cell=_issuecell;
         }
    }
     if(tableView==_popOverTableView){
         switch (poptype) {
             case 1:
                   cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
                 break;
             case 2:
                   cell.textLabel.text=[_statusarray objectAtIndex:indexPath.row];
                 break;
             case 3:
                  cell.textLabel.text=[_Typearray objectAtIndex:indexPath.row];
            
                 break;

             default:
                 break;
         }


       
     }
     if(tableView==_issuetable){
    Issuemdl*issues=(Issuemdl *)[_Issuearray objectAtIndex:indexPath.row];
    _numbrlbl=(UILabel *)[cell viewWithTag:1];
    
    _numbrlbl.text=issues.jobnumbr;
  
    _datelbl=(UILabel *)[cell viewWithTag:2];
    _datelbl.text=issues.datetime;
    _typelbl=(UILabel *)[cell viewWithTag:3];
    _typelbl.text=issues.type;
    _cmmtlbl=(UILabel *)[cell viewWithTag:4];
    _cmmtlbl.text=issues.comments;
         _statuslbl=(UILabel *)[cell viewWithTag:5];
         _statuslbl.text=issues.status;

     }
    return cell;
    
    
}
#pragma mark-Tableview datasouce
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if(tableView==_popOverTableView){
         switch (poptype) {
             case 1:
                 [_jobsitebtnlbl setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 break;
             case 2:
                [_statusbtnlbl setTitle:[_statusarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 break;
             case 3:
                 [_typebtnlbl setTitle:[_Typearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               
                 
                 break;

             default:
                 break;
         }

        
     }
    [self.popOverController dismissPopoverAnimated:YES];
  
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_issuetable)
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


#pragma mark-Web Service
-(void)IssueManagementSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</IssueManagementSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementSelect" forHTTPHeaderField:@"Soapaction"];
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
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
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
-(void)IssueManagementInsert{
    recordResults = FALSE;
//    NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
//    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
//  
    
    NSString*type=[_typedict objectForKey:_typebtnlbl.titleLabel.text];
    NSString*datetime=[NSString stringWithFormat:@"%@ %@",_datebtnlbl.titleLabel.text,_timebtn.titleLabel.text];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<IMJobNumber>%@</IMJobNumber>\n"
                   "<IMDateTime>%@</IMDateTime>\n"
                   "<IMType>%@</IMType>\n"
                   "<IMRelatedTo>%d</IMRelatedTo>\n"
                   "<IMComments>%@</IMComments>\n"
                   "<IMStatus>%@</IMStatus>\n"
                   "</IssueManagementInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_jobsitebtnlbl.titleLabel.text,datetime,type,0,_cmmttxtview.text,_statusbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)IssueManagementUpdate{
    recordResults = FALSE;
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:btnindex];
   // NSArray*array=[_jobsitebtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
   // NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
      NSString*datetime=[NSString stringWithFormat:@"%@ %@",_datebtnlbl.titleLabel.text,_timebtn.titleLabel.text];
    NSString*type=[_typedict objectForKey:_typebtnlbl.titleLabel.text];
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                    "<IMEntryId>%d</IMEntryId>\n"
                   "<IMJobNumber>%@</IMJobNumber>\n"
                   "<IMDateTime>%@</IMDateTime>\n"
                   "<IMType>%@</IMType>\n"
                   "<IMRelatedTo>%d</IMRelatedTo>\n"
                   "<IMComments>%@</IMComments>\n"
                   "<IMStatus>%@</IMStatus>\n"
                   "</IssueManagementUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[ismdl.entryid integerValue],_jobsitebtnlbl.titleLabel.text,datetime,type,0,_cmmttxtview.text,_statusbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementUpdate" forHTTPHeaderField:@"Soapaction"];
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
  
	[_xmlParser parse];
      [_issuetable reloadData];
    [_popOverTableView reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"IssueManagementSelectResponse"])
    {
        _Issuearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMComments"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        _issuemdl=[[Issuemdl alloc]init];
        recordResults = FALSE;
        _issuemdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.jobnumbr=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        recordResults = FALSE;
//        NSArray *dateArray=[[NSArray alloc]init];
//        dateArray=[_soapResults componentsSeparatedByString:@" "];
//        NSString *date1 =[dateArray objectAtIndex:0];
//        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//        [dateFormat setDateFormat:@"yyyy-MM-dd"];
//        NSDate *dates = [dateFormat dateFromString:date1];
//        [dateFormat setDateFormat:@"MM-dd-yyy"];
//        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

         _issuemdl.datetime=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        recordResults = FALSE;
        
        
       _issuemdl.relatedto=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMComments"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.comments=_soapResults;
        

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMStatus"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.status=_soapResults;
        [_Issuearray addObject:_issuemdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        
        
        recordResults = FALSE;
       _soapResults = nil;
    }

    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",jobnumber,_soapResults]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
         recordResults = FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self IssueManagementSelect];
         _soapResults = nil;
    }

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
    
    
    switch (poptype) {

    case 1:
                [self.popOverController presentPopoverFromRect:_jobsitebtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
            
            
    
        case 2:
            [self.popOverController presentPopoverFromRect:_statusbtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;

        case 3:
            [self.popOverController presentPopoverFromRect:_typebtnlbl.frame
                                                    inView:self.addview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
            

    }
    
}
#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2050"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
[_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
   // _datetxtfld.text=dateString;
}


#pragma mark-picker method
-(void)dateChanged1{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
   
    [_timebtn setTitle:currentTime forState:UIControlStateNormal];
    
}

#pragma mark-Button Action
- (IBAction)datebtn:(id)sender {
    [self createCalenderPopover];
}

- (IBAction)tymbtn:(id)sender {
    // _datepicker.hidden=NO;
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged1) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_timebtn.frame
                                        inView:self.addview
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];

}

- (IBAction)jobsitebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)typebtn:(id)sender {
    poptype=3;
    [self createpopover];
    [_popOverTableView reloadData];
  }

- (IBAction)addbtn:(id)sender {
    btntype=1;
    _addview.hidden=NO;
      _cancelbtnlbl.enabled=YES;
}

- (IBAction)deletebtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
    _navtitle.title=@"Edit";
    _cancelbtnlbl.enabled=NO;
    _cancelbtnlbl.titleLabel.textColor=[UIColor grayColor];
     btntype=2;
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.issuetable];
    NSIndexPath *textFieldIndexPath = [self.issuetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:textFieldIndexPath.row];
    [_jobsitebtnlbl setTitle:ismdl.jobnumbr forState:UIControlStateNormal];
    
    [_typebtnlbl setTitle:[_revtypedict objectForKey:ismdl.type]forState:UIControlStateNormal];
    
  
     [_statusbtnlbl setTitle:ismdl.status forState:UIControlStateNormal];
    _cmmttxtview.text=ismdl.comments;
    
    NSArray*arry=[ismdl.datetime componentsSeparatedByString:@" "];
     [_datebtnlbl setTitle:[arry objectAtIndex:0] forState:UIControlStateNormal];
  
    [_timebtn setTitle:  [NSString stringWithFormat:@"%@ %@",[arry objectAtIndex:1],[arry objectAtIndex:2]] forState:UIControlStateNormal];

    _datetxtfld.text=ismdl.datetime;
    
  

}

- (IBAction)addclsebtn:(id)sender {
       _navtitle.title=@"Create";
    _cancelbtnlbl.enabled=YES;
    _cancelbtnlbl.titleLabel.textColor=[UIColor colorWithRed:0/255.0f green:122.0/255.0f blue:255.0/255.0f alpha:1.0f];
     _addview.hidden=YES;
    [_jobsitebtnlbl setTitle:@"Select Jobsite" forState:UIControlStateNormal];
    [_typebtnlbl setTitle:@"Select Type" forState:UIControlStateNormal];
    [_statusbtnlbl setTitle:@"Select Status" forState:UIControlStateNormal];
    [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];

    [_timebtn setTitle:@"Select" forState:UIControlStateNormal];

    
    _cmmttxtview.text=@"";
    _datetxtfld.text=@"";
   }

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savebtn:(id)sender {
    if ([_jobsitebtnlbl.titleLabel.text isEqualToString:@"Select Jobsite"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Jobsite is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_typebtnlbl.titleLabel.text isEqualToString:@"Select Type"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Type is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_statusbtnlbl.titleLabel.text isEqualToString:@"Select Status"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Status is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_datebtnlbl.titleLabel.text isEqualToString:@"Select"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Date is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_timebtn.titleLabel.text isEqualToString:@"Select"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Time is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    if (btntype==1) {
         [self IssueManagementInsert];
    }
    if (btntype==2) {
        [self IssueManagementUpdate];
    }
    }
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)statusbtn:(id)sender {
    poptype=2;
    [self createpopover];
    [_popOverTableView reloadData];

}

- (IBAction)relatedtobtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.issuetable];
    NSIndexPath *textFieldIndexPath = [self.issuetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    Issuemdl*ismdl=(Issuemdl*)[_Issuearray objectAtIndex:textFieldIndexPath.row];


    if (!_relatedtoVCtrl) {
        _relatedtoVCtrl=[[RelatedtoViewController alloc]initWithNibName:@"RelatedtoViewController" bundle:nil];
    }
    _relatedtoVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _relatedtoVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _relatedtoVCtrl.itemcode=ismdl.itemcode;
    _relatedtoVCtrl.jobnumber=ismdl.jobnumbr;
    _relatedtoVCtrl.type=ismdl.type;
    _relatedtoVCtrl.issueid=ismdl.entryid;
    [self presentViewController:_relatedtoVCtrl
                       animated:YES completion:NULL];

}
@end
