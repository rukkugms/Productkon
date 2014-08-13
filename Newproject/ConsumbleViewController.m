//
//  ConsumbleViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ConsumbleViewController.h"

@interface ConsumbleViewController ()

@end

@implementation ConsumbleViewController

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
    _addView.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
          _consumbleTable.layer.borderWidth = 2.0;
    _consumbleTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleView.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.consumbleTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self AllSkills];

   // [self SelectAllConsumables];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_subsearchbtnlbl.frame
                                            inView:self.addView
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

#pragma mark- WebService
-(void)SelectAllConsumables{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllConsumables xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertConsumables{
    webtype=1;
    NSString*unitcost=[_unitcosttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];

    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertConsumables xmlns=\"http://test.kontract360.com/\">\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   "<subtype>%@</subtype>\n"
                   "<unitcost>%f</unitcost>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                    "</InsertConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",_destxtfld.text,[_skilldict objectForKey:_subsearchbtnlbl.titleLabel.text],[unitcost floatValue],[_stckinhandtxtfld.text floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/InsertConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateConsumables{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
     NSString*unitcost=[_unitcosttxtfld.text stringByReplacingOccurrencesOfString:@"$" withString:@""];
    //NSString*unitcost=[_unitcosttxtfld.text substringFromIndex:1];
    Manpwr*pwrmdl=(Manpwr *)[_cnsumblearray objectAtIndex:butnpath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateConsumables xmlns=\"http://test.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "<itemcode>%@</itemcode>\n"
                   "<description>%@</description>\n"
                   "<subtype>%@</subtype>\n"
                   "<unitcost>%f</unitcost>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                    "</UpdateConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",pwrmdl.entryid,_codetxtfld.text,_destxtfld.text,[_skilldict objectForKey:_subsearchbtnlbl.titleLabel.text],[unitcost floatValue],[_stckinhandtxtfld.text floatValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteConsumables{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Manpwr*pwrmdl=(Manpwr *)[_cnsumblearray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteConsumables  xmlns=\"http://test.kontract360.com/\">\n"
                   "<Entryid>%d</Entryid>\n"
                   "</DeleteConsumables >\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",pwrmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/DeleteConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchConsumables{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchConsumables xmlns=\"http://test.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SearchConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllSubtypeConsumables{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypeConsumables xmlns=\"http://test.kontract360.com/\">\n"
                   "</SelectAllSubtypeConsumables>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllSubtypeConsumables" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllSkills{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
	[_xmlParser parse];
    if (webtype==1||webtype==2||webtype==3) {
        [self SelectAllConsumables];
        webtype=0;
    }
    [_consumbleTable reloadData];
    [_popOverTableView reloadData];
    
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllConsumablesResult"])
    {
        _cnsumblearray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SearchConsumablesResponse"])
    {
           _cnsumblearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SelectAllSubtypeConsumablesResult"])
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
    if([elementName isEqualToString:@"UpdateConsumablesResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsertConsumablesResult"])
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

    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _skilldict=[[NSMutableDictionary alloc]init];
        _subtypearray=[[NSMutableArray alloc]init];
        _revskilldict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SkillId"])
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
        _Consublemdl=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _Consublemdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
       _Consublemdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
         _Consublemdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        
        _Consublemdl.unitcost=_soapResults;
      
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
          _Consublemdl.subtype=[_revskilldict objectForKey:_soapResults];;
        
        NSLog(@"%@", _Consublemdl.subtype);
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        
        recordResults = FALSE;
        _Consublemdl.stckinhand=_soapResults;
        [_cnsumblearray addObject:  _Consublemdl];
        
        _soapResults = nil;
    }

       if([elementName isEqualToString:@"subtype"])
    {
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"result"])
    {  recordResults = FALSE;
        
       
        if (webtype==3) {
            
        }
        else{
            
         msgstrg=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        }
    
        
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        skill=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        
        [_skilldict setObject:skill forKey:_soapResults];
        [_revskilldict setObject:_soapResults forKey:skill];
        [_subtypearray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
    

}


#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_consumbleTable) {
        return [_cnsumblearray count];
        
    }
    if (tableView==_popOverTableView) {
        return [_subtypearray count];
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
        
        if (tableView==_consumbleTable) {
            [[NSBundle mainBundle]loadNibNamed:@"Consumblecell" owner:self options:nil];
            cell=_consumbleCell;
        }
    }
    if (tableView==_popOverTableView) {
        cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
    }
    if (tableView==_consumbleTable) {
        Manpwr*materaialmdl=(Manpwr *)[_cnsumblearray objectAtIndex:indexPath.row];
        _codelbl=(UILabel *)[cell viewWithTag:1];
        _codelbl.text=materaialmdl.itemcode;
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=materaialmdl.itemdescptn;
        _typelbl=(UILabel *)[cell viewWithTag:3];
        _typelbl.text=materaialmdl.subtype;
         NSLog(@"%@", _Consublemdl.subtype);
        _costlbl=(UILabel *)[cell viewWithTag:4];
        _costlbl.text=[NSString stringWithFormat:@"$%@",materaialmdl.unitcost];
        
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        
       // _subtyptxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
         [_subsearchbtnlbl setTitle:[_subtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    
    
     [self.popOverController dismissPopoverAnimated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        [self DeleteConsumables];
        [_cnsumblearray removeObject:indexPath];
        
        
    }
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_consumbleTable)
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


#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchConsumables];
    [_searchbar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
     [self SelectAllConsumables];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllConsumables];
        // [searchBar resignFirstResponder];
        
        
    }
  //  [searchBar resignFirstResponder];
    
    
}

- (IBAction)subsearchbtn:(id)sender{
    [self createpopover];
    [self AllSkills];
    
    
}

- (IBAction)updatebtn:(id)sender{
    if (butntype==1) {
        if([_destxtfld.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description Field Is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_subsearchbtnlbl.titleLabel.text isEqualToString:@""]||[_subsearchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }

        else
        {
        [self InsertConsumables];
        }
        
    }
    else  if (butntype==2)
    {
        if([_destxtfld.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description Field Is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
        else if ([_subsearchbtnlbl.titleLabel.text isEqualToString:@""]||[_subsearchbtnlbl.titleLabel.text isEqualToString:@"Select"]){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Subtype field is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }

        else
        {

        [self UpdateConsumables];
        }
        
    }
}
- (IBAction)cancelbtn:(id)sender{
    _codetxtfld.text=@"";
    _resultdisplaylabel.hidden=YES;
    _destxtfld.text=@"";
    _subtyptxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _stckinhandtxtfld.text=@"";
     [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    
}
- (IBAction)deletebtn:(id)sender{
    butntype=3;
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_consumbleTable setEditing:NO animated:NO];
        [_consumbleTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_consumbleTable setEditing:YES animated:YES];
        [_consumbleTable reloadData];
        
        
        
        
    }

    
}


-(IBAction)closeconsume:(id)sender{
      _addView.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(IBAction)addconsume:(id)sender
{
    _addView.hidden=NO;
    _codetxtfld.text=@"";
    _resultdisplaylabel.hidden=YES;
    _destxtfld.text=@"";
    _subtyptxtfld.text=@"";
    _unitcosttxtfld.text=@"";
    _stckinhandtxtfld.text=@"";
     [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    butntype=1;
    _cancelbtn.enabled=YES;
       _navItem.title=@"Create";
    
    
}
-(IBAction)editconsume:(id)sender{
     butntype=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    _resultdisplaylabel.hidden=YES;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.consumbleTable];
    NSIndexPath *textFieldIndexPath = [self.consumbleTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    butnpath=textFieldIndexPath.row;
    Manpwr*toolmdl=(Manpwr *)[_cnsumblearray objectAtIndex:butnpath];
    _codetxtfld.text=toolmdl.itemcode;
    NSLog(@"toolmdl.itemcode%@",toolmdl.itemcode);
    _destxtfld.text=toolmdl.itemdescptn;
    _subtyptxtfld.text=toolmdl.subtype;
    [_subsearchbtnlbl setTitle:toolmdl.subtype forState:UIControlStateNormal];

    _unitcosttxtfld.text=[NSString stringWithFormat:@"$%@",toolmdl.unitcost];
    _cancelbtn.enabled=NO;
    _stckinhandtxtfld.text=toolmdl.stckinhand;
    _addView.hidden=NO;
    _navItem.title=@"Edit";

}

-(IBAction)closeaddview:(id)sender{
    _addView.hidden=YES;
    _resultdisplaylabel.hidden=YES;
    
    
}
#pragma mark-textfield delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_unitcosttxtfld) {
        int value2=[val isNumeric:_unitcosttxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid unit cost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_stckinhandtxtfld) {
        int value12=[val isNumeric:_stckinhandtxtfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid stock in hand" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
        }
    }
    return YES;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.message isEqualToString:msgstrg]) {
        _codetxtfld.text=@"";
        _resultdisplaylabel.hidden=NO;
        _resultdisplaylabel.text=_soapResults;
        _destxtfld.text=@"";
        _subtyptxtfld.text=@"";
        _unitcosttxtfld.text=@"";
        _stckinhandtxtfld.text=@"";
        [_subsearchbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
    }

    if ([alertView.message isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcosttxtfld.text=@"";
       
    }
    
    
    if ([alertView.message isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stckinhandtxtfld.text=@"";
        
    }}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_codetxtfld)
    {
        NSUInteger newLength = [_codetxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_destxtfld)
    {
        NSUInteger newLength = [_destxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_unitcosttxtfld)
    {
        NSUInteger newLength = [_unitcosttxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_stckinhandtxtfld)
    {
        NSUInteger newLength = [_stckinhandtxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    
    return YES;
}

@end
