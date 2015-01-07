//
//  StockViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "StockViewController.h"

@interface StockViewController ()

@end

@implementation StockViewController
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
    [[self.notestxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notestxtview layer] setBorderWidth:2.3];
    [[self.notestxtview layer] setCornerRadius:10];
    [[self.notes1txtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notes1txtview layer] setBorderWidth:2.3];
    [[self.notes1txtview layer] setCornerRadius:10];
    [self JobsSelect];
    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _eqmdl=(EqOthersMdl *)[_eqarray objectAtIndex:0];
   
    _itmnametxtfld.text=_eqmdl.itemname;
    _orderdtxtfld.text=_eqmdl.OrderedQuantity;
    _stocktxtfld.text=_eqmdl.StockQuantity;
    _delivrdtxtfld.text=_eqmdl.DeliveredQty;
    
    
    _item1txtfld.text=_eqmdl.itemname;
    _stock1txtfld.text=_eqmdl.StockQuantity;
    
    _received1txtfld.text=_eqmdl.QtyReceivedBack;
    _sendout1txtfld.text=_eqmdl.DeliveredQty;
     [self NotesStockInselect];
    
    [self StockInSelect];
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    // Return the number of sections.
//    return 1;
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    // Return the number of rows in the section.
//    
//          //return [_equipmntarray count];
//    
//    return [_notesarray count];
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"mycell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        
//       //[[NSBundle mainBundle]loadNibNamed:@"Exceptioncell" owner:self options:nil];
//        cell=_excptncell;
//        }
//    
//    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
//    _notelbl=(UILabel *)[cell viewWithTag:1];
//    _notelbl.text=[_notesarray objectAtIndex:indexPath.row];
//    return cell;
//    
//    
//}

#pragma mark-Web Service
-(void)StockOutInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockOutInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtySendNow>%d</QtySendNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ThirdParty>%d</ThirdParty>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</StockOutInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,thirdparty,[_eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockOutInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)SiteInInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteInInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtyReceivedNow>%d</QtyReceivedNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ReceivedBack>%d</ReceivedBack>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</SiteInInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,0,[_eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteInInsert" forHTTPHeaderField:@"Soapaction"];
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

-(void)StockInInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockInInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtySendNow>%d</QtySendNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ThirdParty>%d</ThirdParty>\n"
                   "</StockInInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,thirdparty];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockInInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)StockInUpdate{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockInUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<ConfirmStockIn>%d</ConfirmStockIn>\n"
                   "<Notes>%@</Notes>\n"
                   "<QtyReceivedBackNow>%d</QtyReceivedBackNow>\n"
                    "<Exception>%d</Exception>\n"
                   "</StockInUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],confirm1,_notes1txtview.text, [_receivedback1txtfld.text integerValue],exception];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockInUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)StockInSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockInSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "</StockInSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockInSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)NotesStockInselect
{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<NotesStockInselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   
                   "</NotesStockInselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/NotesStockInselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)StockInExceptionUpdate
{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockInExceptionUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<Notes>%@</Notes>\n"
                   "</StockInExceptionUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_notes1txtview.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockInExceptionUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
   	[_xmlParser parse];
    _jobsitetxtfld.text= [_jobdict objectForKey: _eqmdl.jobnumber];
    _jobsite1txtfld.text=[_jobdict objectForKey: _eqmdl.jobnumber];
   

    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
       // _jobarray=[[NSMutableArray alloc]init];
        _jobdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockOutInsertResult"])
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
    if([elementName isEqualToString:@"StockInSelectResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"QtyReceivedBackNow"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"NotesStockInselectResult"])
    {
        _notesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockInNotes"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockInException"])
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
        [_jobdict setObject:_soapResults forKey:jobnumber];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
          recordResults = FALSE;
        if ([_soapResults isEqualToString:@"Inserted SiteIn"]) {
            [self StockOutInsert];
        }
        else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirm=0;
            confirm1=0;
            _sendtxtfld.text=@"";
            _notestxtview.text=@"";
            [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             [_exceptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            thirdparty=0;
            message=_soapResults;
        }

         _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"QtyReceivedBackNow"])
    {
        recordResults = FALSE;
        _receivedback1txtfld.text=_soapResults;
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"StockInNotes"])
    {
        
        recordResults = FALSE;
        _notes1txtview.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"StockInException"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            [_exceptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            _remveexcptn.hidden=NO;
            _exceptnbtnlbl.enabled=NO;
            
        }
        else
        {
            [_exceptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             _remveexcptn.hidden=YES;
              _exceptnbtnlbl.enabled=YES;
        }
        _soapResults = nil;
   
    }

}
#pragma mark-AlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.message isEqualToString:message]) {
        
    
    if ([self.delegate respondsToSelector:@selector(toreloadtable)]) {
        [self.delegate toreloadtable];
        
        
    }
        
        if ([alertView.message isEqualToString:@"Invalid Quantity"]) {
            
            
            _sendtxtfld.text=@"";
        }
        
    }
    
    
}
#pragma Mark-Buttons
- (IBAction)thirdbtn:(id)sender {
    btnclck1++;
    if (btnclck1%2!=0) {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        thirdparty=1;
        
    }
    else
    {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        thirdparty=0;
        
    }

}

- (IBAction)confirmbtn:(id)sender {
    
    
    btnclck++;
    if (btnclck%2!=0) {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        confirm=1;
        
    }
    else
    {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirm=0;
    }

}

- (IBAction)savebtn:(id)sender {
          
    
    NSInteger deliver=[_delivrdtxtfld.text integerValue];
    NSInteger order=[_orderdtxtfld.text integerValue];
    NSInteger balance=order-deliver;
    NSLog(@"%d",balance);
    
    
    if (thirdparty==1) {
        
       
        if ([_sendtxtfld.text  compare:_orderdtxtfld.text options:NSNumericSearch] == NSOrderedDescending){
            
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Quantity should be less than or equal to Ordered Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
     
        else{
            [self SiteInInsert];
             //[self StockOutInsert];
        }
        
    }
    else{
        
        
        if ([_sendtxtfld.text  compare:_stocktxtfld.text options:NSNumericSearch] == NSOrderedDescending){
            
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Quantity should be less than or equal to Quantity In Stock" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            
        }
        
        else{
            if ([_sendtxtfld.text  compare:_orderdtxtfld.text options:NSNumericSearch] == NSOrderedDescending){
                
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Quantity should be less than or equal to Ordered Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else{
                if (confirm==1) {
                    [self SiteInInsert];
                     // [self StockOutInsert];
                }
                else{
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Confirm before Save" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];

                }
              
            }

        }
        
    }

    
   }

- (IBAction)confirm1btnlbl:(id)sender {
    btnclck2++;
    if (btnclck2%2!=0) {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        confirm1=1;
        
    }
    else
    {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirm1=0;

        
    }
    
    
    

}

- (IBAction)exceptnbtn:(id)sender {
    expclck++;
    if (expclck%2!=0) {
        [_exceptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        exception=1;
        
    }
    else
    {
        [_exceptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        exception=0;
    }

}

- (IBAction)removebtn:(id)sender {
    
//    UIViewController* popoverContent = [[UIViewController alloc]
//                                        init];
//    
//    UIView* popoverView = [[UIView alloc]
//                           initWithFrame:CGRectMake(0, 0, 330, 200)];
//    
//    popoverView.backgroundColor = [UIColor whiteColor];
//    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 330, 200)];
//    
//    _popOverTableView.delegate=(id)self;
//    _popOverTableView.dataSource=(id)self;
//    _popOverTableView.rowHeight= 32;
//    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//    
//    
//    // CGRect rect = frame;
//    [popoverView addSubview:_popOverTableView];
//     popoverContent.view = popoverView;
//    
//    //resize the popover view shown
//    //in the current view to the view's size
//    popoverContent.contentSizeForViewInPopover = CGSizeMake(330, 200);
//    
//    //create a popover controller
//    self.popOverController = [[UIPopoverController alloc]
//                              initWithContentViewController:popoverContent];
//    
//    //
//    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
//    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
//    
//    
//    
//    [self.popOverController presentPopoverFromRect:_remveexcptn.frame
//                                                    inView:self.scroll
//                                  permittedArrowDirections:UIPopoverArrowDirectionUp
//                                                  animated:YES];
    
    [self StockInExceptionUpdate];
    

}

- (IBAction)deletebtn:(id)sender {
}

- (IBAction)save1btn:(id)sender {
    if (confirm1==1) {
        [self StockInUpdate];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Confirm before Save" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }

}

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
  
}
#pragma mark-Textfield Delegate


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_sendtxtfld) {
        int value2=[val isNumeric:_sendtxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    return YES;
}
@end
