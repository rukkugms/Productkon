//
//  EqothersViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EqothersViewController.h"

@interface EqothersViewController ()

@end

@implementation EqothersViewController

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
    // Do any additional setup after loading the view from its nib.
    _eqtable.layer.borderWidth=3.0;
    _eqtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _Optionarray=[[NSMutableArray alloc]initWithObjects:@"Job Number",@"Item Name",@"Type",@"Date", nil];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self EquipmentandOthersSelect];
    _mydict=[[NSMutableDictionary alloc]init];
     dateselctor=0;
    
   _timer= [NSTimer scheduledTimerWithTimeInterval:5.0f
                                     target:self
                                   selector:@selector(timermethod)
                                   userInfo:nil
                                    repeats:YES];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;

}
-(void)timermethod{
    [self EquipmentandOthersSelect];
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
                           initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 200);
    
    //create a popover controller
      self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 200.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    switch (btnindex) {
        case 1:
            [self.popOverController presentPopoverFromRect:_itembtnlbl.frame
                                                    inView:self.scroll
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_jobnubrbtnlbl.frame
                                                    inView:self.scroll
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
        case 3:
            [self.popOverController presentPopoverFromRect:_itmdatebtnlbl.frame
                                                    inView:self.scroll
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
        default:
            break;
    }
    

      
    
    
}

#pragma mark-Web Service
-(void)EquipmentandOthersSelect{
      recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentandOthersSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EquipmentandOthersSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
  //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentandOthersSelect" forHTTPHeaderField:@"Soapaction"];
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

-(void)EquipmentJobNumberSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentJobNumberSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EquipmentJobNumberSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentJobNumberSelect" forHTTPHeaderField:@"Soapaction"];
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
-(void)EquipmentItemNameSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentItemNameSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EquipmentItemNameSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentItemNameSelect" forHTTPHeaderField:@"Soapaction"];
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

-(void)EquipmentDateSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EquipmentDateSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EquipmentDateSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentDateSelect" forHTTPHeaderField:@"Soapaction"];
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
-(void)EQOthersSearch{
    recordResults = FALSE;
    NSString*job;
    NSString*item;
    NSString*itemdate;
    job= _jobnubrbtnlbl.titleLabel.text;
    item= _itembtnlbl.titleLabel.text;
    itemdate= _itmdatebtnlbl.titleLabel.text;
    
    if ([_jobnubrbtnlbl.titleLabel.text isEqualToString:@"Select Job"]) {
        
        job=@"";
    }
    if ([_itembtnlbl.titleLabel.text isEqualToString:@"Select Item Name"]) {
        
        item=@"";
    }
    if ([_itmdatebtnlbl.titleLabel.text isEqualToString:@"Select Date"]) {
        
         itemdate=@"1900-1-1";
    }

    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EQOthersSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<string1>%@</string1>\n"
                   "<string2>%@</string2>\n"
                   "<string3>%@</string3>\n"
                   "<cnt>%d</cnt>\n"
                   "</EQOthersSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job,item,itemdate,dateselctor];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EQOthersSearch" forHTTPHeaderField:@"Soapaction"];
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
    
    [_eqtable reloadData];
    [_popOverTableView reloadData];
    
       }
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"EquipmentandOthersSelectResponse"])
    {
        _equipmntarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"JobNumber"])
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
    if([elementName isEqualToString:@"ItemName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Date"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"OrderedQuantity"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockQuantity"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"DeliveredQty"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ReceivedQty"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TotalQtySendBack"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"QtyReceivedBack"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockOut"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteIn"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SiteOut"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockIn"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    


    if([elementName isEqualToString:@"EquipmentJobNumberSelectResponse"])
    {
        _jobnumbrarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EqJobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentItemNameSelectResponse"])
    {
        _itemnamearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EqItemName"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentDateSelectResponse"])
    {
        _itemdatearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EqDate"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EQOthersSearchResponse"])
    {
        _equipmntarray=[[NSMutableArray alloc]init];
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteInException"])
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
      if([elementName isEqualToString:@"EntryId"])
    {
        
        
        _equpmdl=[[EqOthersMdl alloc]init];
        recordResults = FALSE;
        _equpmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        
        
        recordResults = FALSE;
        _equpmdl.jobnumber=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.itemcode=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"ItemName"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.itemname=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Date"])
    {
        
        recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        
      
           _equpmdl.itemdate=myFormattedDate;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"OrderedQuantity"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.OrderedQuantity=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"StockQuantity"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.StockQuantity=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DeliveredQty"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.DeliveredQty=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"ReceivedQty"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.ReceivedQty=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TotalQtySendBack"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.TotalQtySendBack=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"QtyReceivedBack"])
    {
        
        
        recordResults = FALSE;
           _equpmdl.QtyReceivedBack=_soapResults;
    
             _soapResults = nil;
    }
    if([elementName isEqualToString:@"StockOut"])
    {
        
        
        recordResults = FALSE;
        _equpmdl.stockoutbit=_soapResults;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SiteIn"])
    {
        
        
        recordResults = FALSE;
        _equpmdl.siteinbit=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"SiteOut"])
    {
        
        
        recordResults = FALSE;
        _equpmdl.siteoutbit=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"StockIn"])
    {
        
        
        recordResults = FALSE;
        _equpmdl.stockinbit=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SiteInException"])
    {
        
        
        
        recordResults = FALSE;
        _equpmdl.siteinexpn=_soapResults;
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"StockInException"])
    {
        
        
        
        recordResults = FALSE;
        _equpmdl.stockinexpn=_soapResults;
        [_equipmntarray addObject:_equpmdl];
        _soapResults = nil;

    }


    if([elementName isEqualToString:@"EqJobNumber"])
    {
        recordResults = FALSE;
        [_jobnumbrarray addObject:_soapResults];
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"EqItemName"])
    {
        recordResults = FALSE;
        [_itemnamearray addObject:[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EqDate"])
    {
      recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM/dd/yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

        [_itemdatearray addObject:myFormattedDate];
         _soapResults = nil;
    }
  
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
//       NSArray*newarray=[_equipmntarray mutableCopy];
//   // for (int i = 0; i<[_equipmntarray count]; i++) {
//        
//      //  EqOthersMdl*eqmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:i];
//        NSSortDescriptor *firstDescriptor = [[NSSortDescriptor alloc] initWithKey:@"itemdate" ascending:YES];
//        NSSortDescriptor *secondDescriptor = [[NSSortDescriptor alloc] initWithKey:@"entryid" ascending:YES];
//        
//        NSArray *sortDescriptors = [NSArray arrayWithObjects:firstDescriptor, secondDescriptor, nil];
//        
//        NSArray *sortedArray = [newarray sortedArrayUsingDescriptors:sortDescriptors];
//
////    NSSortDescriptor *sortdescpt=[[NSSortDescriptor alloc]initWithKey:eqmdl.itemdate ascending:NO];
////    NSArray*sortedarray=[[NSArray alloc]initWithObjects:sortdescpt, nil];
////          NSLog(@"array%@",[sortedarray objectAtIndex:0]);
////   NSArray*array=[newarray sortedArrayUsingDescriptors:sortedarray];
//  
//        NSLog(@"array%@",[sortedArray objectAtIndex:0]);
// 
//    //}
//    NSLog(@"arrayuuuu");
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
    
    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
                 return [_itemnamearray count];
                break;
            case 2:
                return [_jobnumbrarray count];
                break;
            case 3:
                return [_itemdatearray count];
                break;


            default:
                break;
        }
       
    }
    else{
        return [_equipmntarray count];
    }
    return YES;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_eqtable) {
            
        
        [[NSBundle mainBundle]loadNibNamed:@"Eqotherscell" owner:self options:nil];
        cell=_eqcell;
        }
             }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];

    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
               
                cell.textLabel.text=[_itemnamearray objectAtIndex:indexPath.row];
                break;
            case 2:
               
                cell.textLabel.text=[_jobnumbrarray objectAtIndex:indexPath.row];
                break;
            case 3:
                 cell.textLabel.text=[_itemdatearray objectAtIndex:indexPath.row];
            
                break;
                
                
            default:
                break;
        }

        
    }
    
    if (tableView==_eqtable) {
    EqOthersMdl*eqmmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:indexPath.row];
    _jobnumbrlbl=(UILabel *)[cell viewWithTag:1];
    _jobnumbrlbl.text=eqmmdl.jobnumber;
    _itmcodelbl=(UILabel *)[cell viewWithTag:2];
    _itmcodelbl.text=eqmmdl.itemcode;
    _itemnamelbl=(UILabel *)[cell viewWithTag:3];
    _itemnamelbl.text=eqmmdl.itemname;
    _typelbl=(UILabel *)[cell viewWithTag:4];
    _typelbl.text=eqmmdl.type;
    _datelbl=(UILabel *)[cell viewWithTag:5];
    _datelbl.text=eqmmdl.itemdate;
    _orderdlbl=(UILabel *)[cell viewWithTag:6];
    _orderdlbl.text=eqmmdl.OrderedQuantity;
    _stocklbl=(UILabel *)[cell viewWithTag:7];
    _stocklbl.text=eqmmdl.StockQuantity;
        
        if ([eqmmdl.stockoutbit isEqualToString:@"true"]) {
            _stockoutbtnlbl.backgroundColor=[UIColor colorWithRed:51/255.0f green:153.0/255.0f blue:0.0/255.0f alpha:1.0f];
        
            if ([eqmmdl.DeliveredQty integerValue]>=[eqmmdl.OrderedQuantity integerValue]) {
                
                 _stockoutbtnlbl.enabled=NO;
                
            }
           
            
             if ([eqmmdl.siteinbit isEqualToString:@"false"]) {
                 if ([eqmmdl.siteinexpn isEqualToString:@"true"]) {
                     
                     _siteinbtnlbl.backgroundColor=[UIColor redColor];
                     
                     
                 }
                 else{
                     
                 _siteinbtnlbl.backgroundColor=[UIColor colorWithRed:51/255.0f green:153.0/255.0f blue:0.0/255.0f alpha:1.0f];
                     
                     if ([eqmmdl.ReceivedQty integerValue]>=[eqmmdl.OrderedQuantity integerValue]) {
                         
                        _siteinbtnlbl.enabled=NO;
                      
                     }

                  
                 }

                 }
             else if ([eqmmdl.siteinbit isEqualToString:@"true"]){
                 _siteinbtnlbl.backgroundColor=[UIColor redColor];
             }
                
        }
        
        if ([eqmmdl.siteoutbit isEqualToString:@"true"]) {
            _siteoutbtnlbl.backgroundColor=[UIColor colorWithRed:51/255.0f green:153.0/255.0f blue:0.0/255.0f alpha:1.0f];
            if ([eqmmdl.TotalQtySendBack integerValue]>=[eqmmdl.ReceivedQty integerValue]) {
                
                 _siteoutbtnlbl.enabled=NO;
                          }

           
            
            if ([eqmmdl.stockinbit isEqualToString:@"false"]) {
                if ([eqmmdl.stockinexpn isEqualToString:@"true"]) {
                    
                    _stockinbtnlbl.backgroundColor=[UIColor redColor];
                    
                }
                else{

                _stockinbtnlbl.backgroundColor=[UIColor colorWithRed:51/255.0f green:153.0/255.0f blue:0.0/255.0f alpha:1.0f];
                    if ([eqmmdl.QtyReceivedBack integerValue]>=[eqmmdl.TotalQtySendBack integerValue]) {
                        
                         _stockinbtnlbl.enabled=NO;
                     
                    }

                
                }
            }
            else if ([eqmmdl.stockinbit isEqualToString:@"true"]){
                _stockinbtnlbl.backgroundColor=[UIColor redColor];
            }
            
        }
        

        
        
        
        
    }

    return cell;
    
    
}
#pragma mark-Tableview Datasource
-(void)tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
                
               
                 [_itembtnlbl setTitle:[_itemnamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                break;
            case 2:
                
                [_jobnubrbtnlbl setTitle:[_jobnumbrarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];

                break;
            case 3:
               
                   [_itmdatebtnlbl setTitle:[_itemdatearray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                break;
                
                
            default:
                break;
        }

     //   [_optionbtnlbl setTitle:[_Optionarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
       }
    [self.popOverController dismissPopoverAnimated:YES];
}
-(void)toreloadtable{
    [self EquipmentandOthersSelect];
}

- (IBAction)clsebtn:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)selectbtn:(id)sender {
   
}

- (IBAction)checkbtn:(id)sender {
   
//    btnclck++;
//    if (btnclck%2!=0) {
//        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        _selectbtnlbl.enabled=YES;
//    }
//    else
//    {
//        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//          _selectbtnlbl.enabled=NO;
//    }

}

- (IBAction)optnbtn:(id)sender {
      [_popOverTableView reloadData];
}

- (IBAction)itembtn:(id)sender {
    btnindex=1;
    [self createpopover];

    [self EquipmentItemNameSelect];
}

- (IBAction)itmcheckbtn:(id)sender {
      btnclck++;
        if (btnclck%2!=0) {
           [_itemcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
          
           _itembtnlbl.enabled=YES;
        }
        else
        {
           [_itemcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            _itembtnlbl.enabled=NO;
            [_itembtnlbl setTitle:@"Select Item Name" forState:UIControlStateNormal];
       }

}

- (IBAction)jobbtn:(id)sender {
    btnindex=2;
    [self createpopover];
    [self EquipmentJobNumberSelect];
}

- (IBAction)jobcheckbtn:(id)sender {
    btnclck2++;
    if (btnclck2%2!=0) {
        [_jobcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
          _jobnubrbtnlbl.enabled=YES;
    }
    else
    {
        [_jobcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _jobnubrbtnlbl.enabled=NO;
         [_jobnubrbtnlbl setTitle:@"Select Job" forState:UIControlStateNormal];
    }

}

- (IBAction)datecheckbtn:(id)sender {
    btnclck3++;
    if (btnclck3%2!=0) {
        [_datecheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _itmdatebtnlbl.enabled=YES;
        dateselctor=1;
    }
    else
    {
        [_datecheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
         _itmdatebtnlbl.enabled=NO;
        [_itmdatebtnlbl setTitle:@"Select Date" forState:UIControlStateNormal];
        dateselctor=0;

    }

}

- (IBAction)itmdatebtn:(id)sender {
    btnindex=3;
    [self createpopover];
    [self EquipmentDateSelect];
}

- (IBAction)showbtn:(id)sender {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    [self EQOthersSearch];
}

- (IBAction)stockoutbtn:(id)sender {
   // if(_stockoutbtnlbl.isEnabled){
           button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.eqtable];
    NSIndexPath *textFieldIndexPath = [self.eqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    EqOthersMdl*eqmmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:textFieldIndexPath.row];
    NSMutableArray*passedarray=[[NSMutableArray alloc]initWithObjects:eqmmdl, nil];
  
    _stockVCtrl=[[StockViewController alloc]initWithNibName:@"Siteoutview" bundle:nil];

    _stockVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _stockVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _stockVCtrl.eqarray=passedarray;
    _stockVCtrl.delegate=self;
    [self presentViewController:_stockVCtrl
                       animated:YES completion:NULL];
   // }
//    else{
//    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Process Completed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]
//    ;
//    [alert show];
//
//
//    }

}

- (IBAction)siteinbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.eqtable];
    NSIndexPath *textFieldIndexPath = [self.eqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    EqOthersMdl*eqmmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:textFieldIndexPath.row];
    NSMutableArray*passedarray=[[NSMutableArray alloc]initWithObjects:eqmmdl, nil];

        _InoutVCtrl=[[InOutSiteViewController alloc]initWithNibName:@"InOutSiteViewController" bundle:nil];
    
    _InoutVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _InoutVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _InoutVCtrl.inoutarray=passedarray;
    _InoutVCtrl.delegate=(id)self;
    [self presentViewController:_InoutVCtrl
                       animated:YES completion:NULL];
    
}

- (IBAction)siteoutbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.eqtable];
    NSIndexPath *textFieldIndexPath = [self.eqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    EqOthersMdl*eqmmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:textFieldIndexPath.row];
    NSMutableArray*passedarray=[[NSMutableArray alloc]initWithObjects:eqmmdl, nil];

_InoutVCtrl=[[InOutSiteViewController alloc]initWithNibName:@"StkOtSiteout" bundle:nil];
    
    _InoutVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _InoutVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
     _InoutVCtrl.inoutarray=passedarray;
    _InoutVCtrl.delegate=(id)self;
    [self presentViewController:_InoutVCtrl
                       animated:YES completion:NULL];
    

}

- (IBAction)stockinbtn:(id)sender {
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.eqtable];
    NSIndexPath *textFieldIndexPath = [self.eqtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    EqOthersMdl*eqmmdl=(EqOthersMdl *)[_equipmntarray objectAtIndex:textFieldIndexPath.row];
    NSMutableArray*passedarray=[[NSMutableArray alloc]initWithObjects:eqmmdl, nil];
    

        _stockVCtrl=[[StockViewController alloc]initWithNibName:@"StockViewController" bundle:nil];
    
    _stockVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _stockVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    _stockVCtrl.eqarray=passedarray;
    _stockVCtrl.delegate=self;

    [self presentViewController:_stockVCtrl
                       animated:YES completion:NULL];
    

}

- (IBAction)cancelbtn:(id)sender {
     [self EquipmentandOthersSelect];
    _timer= [NSTimer scheduledTimerWithTimeInterval:5.0f
                                             target:self
                                           selector:@selector(timermethod)
                                           userInfo:nil
                                            repeats:YES];

    
}

@end
