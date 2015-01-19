//
//  WorkorderViewController.m
//  Newproject
//
//  Created by Riya on 1/7/15.
//  Copyright (c) 2015 GMSIndia1. All rights reserved.
//

#import "WorkorderViewController.h"

@interface WorkorderViewController ()

@end

@implementation WorkorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _worktable.layer.borderWidth=3.0;
    _worktable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self ShowWO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
    calendar.delegate = (id)self;
    
    
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
    self.popOverController.popoverContentSize=CGSizeMake(320.0f, 340.0f);
    self.popOverController=_popOverController;
    [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}

#pragma mark-popover
-(void)createpopover{
 
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 220, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(220, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(220.0f, 220.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    [self.popOverController presentPopoverFromRect:_pobtnlbl.frame
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
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
    // _datetxtfld.text=dateString;
    [self.popOverController dismissPopoverAnimated:YES];
}

#pragma mark - Web Service
-(void)ShowWO{
    webtype=1;
    recordResults = FALSE;
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ShowWO xmlns=\"http://ios.kontract360.com/\">\n"
                   "<JobId>%d</JobId>\n"
                   "</ShowWO>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_jobid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ShowWO" forHTTPHeaderField:@"Soapaction"];
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
-(void)ShowPO{
    webtype=2;
    recordResults = FALSE;
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ShowPO xmlns=\"http://ios.kontract360.com/\">\n"
                   "<JobId>%d</JobId>\n"
                   "</ShowPO>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_jobid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ShowPO" forHTTPHeaderField:@"Soapaction"];
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

-(void)CreateWO{
    webtype=3;
    recordResults = FALSE;
    Purchsemdl *pmdl=(Purchsemdl *)[_purchasearray objectAtIndex:btnindex];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_datebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
     NSString*    dateString = [dateFormat2 stringFromDate:dates];
    
    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates1 = [dateFormat3 dateFromString:pmdl.purchasedate];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
     NSString*    dateString1 = [dateFormat4 stringFromDate:dates1];

    
    
   
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CreateWO xmlns=\"http://ios.kontract360.com/\">\n"
                   "<wo>%@</wo>\n"
                   "<JobID>%d</JobID>\n"
                   "<PODate>%@</PODate>\n"
                   "<po>%d</po>\n"
                   "<wodate>%@</wodate>\n"
                   "</CreateWO>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_numbrtxtfld.text,[_jobid integerValue],dateString1,[pmdl.entryid integerValue],dateString];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CreateWO" forHTTPHeaderField:@"Soapaction"];
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
-(void)UpdateWO{
    webtype=3;
     Workordrmdl *wmdl=(Workordrmdl *)[_Workarray objectAtIndex:editpath];
    recordResults = FALSE;
   // Purchsemdl *pmdl=(Purchsemdl *)[_purchasearray objectAtIndex:btnindex];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_datebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    
    
  
   NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateWO xmlns=\"http://ios.kontract360.com/\">\n"
                   "<woid>%d</woid>\n"
                   "<wo>%@</wo>\n"
                   "<JobId>%d</JobId>\n"
                   "<poid>%d</poid>\n"
                   "<wodate>%@</wodate>\n"
                   "</UpdateWO>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[wmdl.entryid integerValue],_numbrtxtfld.text,[_jobid integerValue],[wmdl.purchaseid integerValue],dateString];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateWO" forHTTPHeaderField:@"Soapaction"];
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
-(void)DestroyWO{
    recordResults = FALSE;
    
    
    Workordrmdl *wmdl=(Workordrmdl *)[_Workarray objectAtIndex:deletepath];

    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DestroyWO xmlns=\"http://ios.kontract360.com/\">\n"
                   "<woid>%d</woid>\n"
                   "</DestroyWO>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[wmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DestroyWO" forHTTPHeaderField:@"Soapaction"];
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
    if (webtype==1||webtype==3) {
         [_worktable reloadData];
       // webtype=0;
        
    }
    else if(webtype==2){
    [_popOverTableView reloadData];
       // webtype=0;
    }
    
    }
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ShowWOResponse"])
    {
        _Workarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WorkId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WorkNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WorkDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
        if([elementName isEqualToString:@"PurchaseNumberWO"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PurchaseIdWO"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"ShowPOResponse"])
    {
        _purchasearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PurchaseId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PurchaseNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PurchaseDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CreateWOResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"records"])
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
    if([elementName isEqualToString:@"WorkId"])
    {
        
        recordResults = FALSE;
        _Workmdl=[[Workordrmdl alloc]init];
        _Workmdl.entryid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobId"])
    {
        
        recordResults = FALSE;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WorkNumber"])
    {
        
        recordResults = FALSE;
        _Workmdl.number=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WorkDate"])
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
        _Workmdl.workdate=myFormattedDate;
        
        _soapResults = nil;
    }
        if([elementName isEqualToString:@"PurchaseIdWO"])
    {
        
        recordResults = FALSE;
        _Workmdl.purchaseid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"PurchaseNumberWO"])
    {
        
        recordResults = FALSE;
        _Workmdl.purchaseorder=_soapResults;
        
        [_Workarray addObject:_Workmdl];
        _soapResults = nil;
    }
  
    if([elementName isEqualToString:@"PurchaseId"])
    {
        
        recordResults = FALSE;
        
        _purchsemdl=[[Purchsemdl alloc]init];
        _purchsemdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobId"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PurchaseNumber"])
    {
        
        recordResults = FALSE;
        _purchsemdl.number=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PurchaseDate"])
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
        _purchsemdl.purchasedate=myFormattedDate;
        [_purchasearray addObject:_purchsemdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"records"])
    {
        
       recordResults = FALSE;
        if ([_soapResults isEqualToString:@"inserted"]) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Inserted Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
           
        }
       else if ([_soapResults isEqualToString:@"Work Order Updated"]) {
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Updated Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
       else if ([_soapResults isEqualToString:@"Work Order Deleted"]) {
           
         
           
       }


        else{
            msgstrg=_soapResults;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        [self ShowWO];
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
    if(tableView==_worktable){
    return [_Workarray count];
    }
    else if(tableView==_popOverTableView){
        return [_purchasearray count];
       

    }
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_worktable) {
        [[NSBundle mainBundle]loadNibNamed:@"Workordercell" owner:self options:nil];
        cell=_workcell;
        }
        
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    if (tableView==_worktable) {
        
        Workordrmdl *wmdl=(Workordrmdl *)[_Workarray objectAtIndex:indexPath.row];
        _numbrlbl=(UILabel *)[cell viewWithTag:1];
        _numbrlbl.text=wmdl.number;
        _datelbl=(UILabel *)[cell viewWithTag:2];
        _datelbl.text=wmdl.workdate;
        _polbl=(UILabel *)[cell viewWithTag:3];
         _polbl.text=wmdl.purchaseorder;

    }
    else{
         Purchsemdl *pmdl=(Purchsemdl *)[_purchasearray objectAtIndex:indexPath.row];
        cell.textLabel.text=pmdl.number;
    }
    
    return cell;
    
    
}
#pragma mark-Tableview Delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_worktable)
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  Purchsemdl *pmdl=(Purchsemdl *)[_purchasearray objectAtIndex:indexPath.row];
    btnindex=indexPath.row;

    if (tableView==_popOverTableView){
        [_pobtnlbl setTitle:pmdl.number forState:UIControlStateNormal];
        
    }
    [self.popOverController dismissPopoverAnimated:YES];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        deletepath=indexPath.row;
        [self DestroyWO];
        
        
        
        [_Workarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

- (IBAction)editbtnlbl:(id)sender {
    optnidnfr=2;
     _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.worktable];
    NSIndexPath *textFieldIndexPath = [self.worktable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    editpath=textFieldIndexPath.row;
    Workordrmdl *wmdl=(Workordrmdl *)[_Workarray objectAtIndex:editpath];
    _numbrtxtfld.text=wmdl.number;
    [_datebtnlbl setTitle:wmdl.workdate forState:UIControlStateNormal];
     [_pobtnlbl setTitle:wmdl.purchaseorder forState:UIControlStateNormal];
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addbtn:(id)sender {
    optnidnfr=1;
    _addview.hidden=NO;
}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_worktable setEditing:NO animated:NO];
        [_worktable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_worktable setEditing:YES animated:YES];
        [_worktable reloadData];
        
        
        
        
    }

}
- (IBAction)datebtn:(id)sender {
    [self createCalenderPopover];
}

- (IBAction)pobtn:(id)sender {
    [self createpopover];
    [self ShowPO];
}

- (IBAction)addclsebtn:(id)sender {
    _addview.hidden=YES;

}

- (IBAction)updatebtn:(id)sender {

    if ([_numbrtxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_datebtnlbl.titleLabel.text isEqualToString:@"Select"]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Date is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_pobtnlbl.titleLabel.text isEqualToString:@"Select"]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Purchase Order is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        _updatebtnlbl.enabled=NO;
        
        if (optnidnfr==1) {
           [self CreateWO];
        }
        else{
            [self UpdateWO];
        }
        
    }
    

   
}
#pragma mark - Alertview delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Inserted Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            _updatebtnlbl.enabled=YES;
            //_addview.hidden=YES;
            _numbrtxtfld.text=@"";
            [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
             [_pobtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            
            
        }
    }
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            _updatebtnlbl.enabled=YES;
            _addview.hidden=YES;
            _numbrtxtfld.text=@"";
            [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            [_pobtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            
            
        }
    }

    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        
        if (buttonIndex==0) {
            _updatebtnlbl.enabled=YES;
            if (optnidnfr==1) {
                _updatebtnlbl.enabled=YES;
               // _addview.hidden=YES;
                _numbrtxtfld.text=@"";
                [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
                [_pobtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            }
            else{
                _updatebtnlbl.enabled=YES;
                _addview.hidden=YES;
                _numbrtxtfld.text=@"";
                [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
                [_pobtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            }
            
            
        }
    }

}

@end
