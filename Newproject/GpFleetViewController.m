//
//  GpFleetViewController.m
//  Newproject
//
//  Created by Riya on 11/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GpFleetViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30

@interface GpFleetViewController ()

@end

@implementation GpFleetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _touchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=(id)self;
    [self.touchview addGestureRecognizer:panGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 533)];
    
    
    
    
}


#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    
    [self.popOverController presentPopoverFromRect:_servicebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)createcrewpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 250.0f);
    self.popOverController=_popOverController;
    
    
    
    
    [self.popOverController presentPopoverFromRect:_crewbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
#pragma mark-Webservices
-(void)AllSkills
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CrewfleetSelect{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewfleetSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FLStSubTypeId>%d</FLStSubTypeId>\n"
                   "</CrewfleetSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_skilldict objectForKey:_servicebtnlbl.titleLabel.text]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CrewfleetSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetCrewSave{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCrewSave xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FCrewName>%@</FCrewName>\n"
                   "</FleetCrewSave>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_crewtextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCrewSave" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetCrewSetUpSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCrewSetUpSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</FleetCrewSetUpSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetCrewNameSelect{
    
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *cid=[_crewdict objectForKey:_crewbtnlbl.titleLabel.text];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCrewNameSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</FleetCrewNameSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[cid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCrewNameSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FleetCrewSetUpDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCrewSetUpDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<FCrewId>%d</FCrewId>\n"
                   "</FleetCrewSetUpDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCrewSetUpDelete" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)FleetCrewdelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:Deletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FleetCrewdelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ID>%d</ID>\n"
                   "</FleetCrewdelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[crewmdl1.ID integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FleetCrewdelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllFleetCrewDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllFleetCrewDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</AllFleetCrewDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllFleetCrewDelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Fleetcrewinsert
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    NSString *cid=[_crewdict objectForKey:_crewbtnlbl.titleLabel.text];
    Equpmntmdl*manpwr=(Equpmntmdl *)[_fleetarray objectAtIndex:crewpath];

   
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Fleetcrewinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Fleet>%@</Fleet>\n"
                   "<Description>%@</Description>\n"
                   "<Type>%@</Type>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<Name>%@</Name>\n"
                   "<CrewId>%d</CrewId>\n"
                   "</Fleetcrewinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",manpwr.itemcode,manpwr.itemdescptn,@"MT",[manpwr.unitcost floatValue],@"Material",[cid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Fleetcrewinsert" forHTTPHeaderField:@"Soapaction"];
    
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
    [_popOverTableView reloadData];
    if(webtype==1){
          [_fleettable reloadData];
        webtype=0;
        
    }
    else if(webtype==2){
        [_groupfleettable reloadData];
    }
  
   }
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _skilldict=[[NSMutableDictionary alloc]init];
        _skillarray=[[NSMutableArray alloc]init];
        //_revskilldict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"CrewfleetSelectResponse"])
    {
        _fleetarray =[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Condition"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FLAllCrafts"])
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
    if([elementName isEqualToString:@"FleetCrewSaveResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FleetCrewSetUpSelectResponse"])
    {
        if (setuptype==1) {
        setuptype=2;
    }
        _crewnamearray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        _revcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FCrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"FCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FleetCrewNameSelectResponse"])
    {
        _crewmembersarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FtCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"Fleet"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FLDescription"])
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
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Name"])
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
    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        skill=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        
        [_skilldict setObject:skill forKey:_soapResults];
        //  [_revskilldict setObject:_soapResults forKey:skill];
        [_skillarray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"EntryId"])
    {
        
        recordResults = FALSE;
        _eqmdl=[[Equpmntmdl alloc]init];
        _eqmdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
        _eqmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Condition"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
         _eqmdl.HourlyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FLAllCrafts"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
         _eqmdl.itemcode=_soapResults;
        [_fleetarray addObject:_eqmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        
        
        if ([_soapResults isEqualToString:@"Deleted All Members"]) {
            if (clear==1) {
                
                
                [self FleetCrewSetUpDelete];
                [_crewbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
                clear=0;
            }
            else if(clear==0)
            {
                [self FleetCrewNameSelect];
            }
            
            
            
        }
        else if ([_soapResults isEqualToString:@"This Fleet is  Already Exists"]) {
            existstring=@"This Fleet is  Already Exists";
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self FleetCrewNameSelect];
            
            
        }
        else if ([_soapResults isEqualToString:@"Inserted"]){
            [self FleetCrewNameSelect];
        }


       else if ([_soapResults isEqualToString:@"Inserted Crew"]||[_soapResults isEqualToString:@"Deleted CrewSetUp"]||[_soapResults isEqualToString:@"deletedcrew"])
        {

           
           
           if([_soapResults isEqualToString:@"Inserted Crew"]){
            setuptype=1;
            _crewtextfld.text=@"";
            [self FleetCrewSetUpSelect];
        }
           else
           {
               
               _crewtextfld.text=@"";
               [self FleetCrewNameSelect];
           }

            
            
        }
        else{
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            _crewtextfld.text=@"";
            
        }
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FCrewId"])
    {
        recordResults = FALSE;
        
        crewid=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"FCrewName"])
    {
        recordResults = FALSE;
        [_crewnamearray addObject:_soapResults];
        [_crewdict setObject:crewid forKey:_soapResults];
        [_revcrewdict setObject:_soapResults forKey:crewid];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        _crewmdl1=[[Crewmodel alloc]init];
        recordResults = FALSE;
        _crewmdl1.ID=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FtCrewName"])
    {
        recordResults = FALSE;
        _crewmdl1.crewname=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Fleet"])
    {
        recordResults = FALSE;
        _crewmdl1.manpower=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FLDescription"])
    {
        recordResults = FALSE;
        _crewmdl1.mandescptn=_soapResults;
        
        _soapResults = nil;
    }
    
    
    
    if([elementName isEqualToString:@"Type"])
    {
        
        recordResults = FALSE;
        _crewmdl1.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
        _crewmdl1.unitcost=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
        _crewmdl1.name=_soapResults;
        [_crewmembersarray addObject:_crewmdl1];
        _soapResults = nil;
    }


}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    if (setuptype==2) {
        [_crewbtnlbl setTitle:[_crewnamearray lastObject] forState:UIControlStateNormal];
        [self FleetCrewNameSelect];
        setuptype=0;
    }
    
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_popOverTableView){
        switch (poptype) {
            case 1:
         return [_skillarray count];
                break;
            case 2:
                return [_crewnamearray count];
                break;
            default:
                break;
        }

        }
    
    else if (tableView==_fleettable){
        return [_fleetarray count];;
    }
    
    else if (tableView==_groupfleettable){
        return [_crewmembersarray count];;
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
        
        if (tableView==_fleettable) {
            [[NSBundle mainBundle]loadNibNamed:@"Gpfleetcell" owner:self options:nil];
         
            cell=_fleetcell;
        }
        if (tableView==_groupfleettable) {
            [[NSBundle mainBundle]loadNibNamed:@"Fleetgroupcell" owner:self options:nil];
            cell=_Gpfleetcell;
            
           
        }
    }

    
        if(tableView==_popOverTableView){
            switch (poptype) {
                case 1:
                  cell.textLabel.text=[_skillarray objectAtIndex:indexPath.row];
                    break;
                case 2:
                  cell.textLabel.text=[_crewnamearray objectAtIndex:indexPath.row];
                    break;
                default:
                    break;
            }

            
            
          }
        
        if(tableView==_fleettable){
            
            Equpmntmdl*emdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
            _itemcodelbl=(UILabel *)[cell viewWithTag:1];
            _itemcodelbl.text=emdl.itemcode;
            UITapGestureRecognizer *tapGesture =
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap1:)];
            [_itemcodelbl addGestureRecognizer:tapGesture];
            
            _fdeslbl=(UILabel *)[cell viewWithTag:2];
            _fdeslbl.text=emdl.itemdescptn;
            _fhourslbl=(UILabel *)[cell viewWithTag:3];
            _fhourslbl.text=[NSString stringWithFormat:@"$%@",emdl.HourlyRate];

        }
        
    
    if (tableView==_groupfleettable) {
        
        Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
        _Gpitemlbl=(UILabel *)[cell viewWithTag:1];
        _Gpitemlbl.text=crewmdl1.manpower;
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
        [_Gpitemlbl addGestureRecognizer:tapGesture];
        
        
        _Gpdeslbl=(UILabel *)[cell viewWithTag:2];
        _Gpdeslbl.text=crewmdl1.mandescptn;
        _crewnamelbl=(UILabel *)[cell viewWithTag:3];
        
        
        _crewnamelbl.text=crewmdl1.crewname;
        
        
    }

    
       return cell;
}


#pragma mark-Tableview Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                
                [_servicebtnlbl setTitle:[_skillarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                [self CrewfleetSelect];
                
                break;
            case 2:
                
                [_crewbtnlbl setTitle:[_crewnamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                [self FleetCrewNameSelect];
                break;
                
            default:
                break;
        }
        
        [self.popOverController dismissPopoverAnimated:YES];
        
        
        
    }
    
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_groupfleettable) {
        
        
        
        if (editingStyle==UITableViewCellEditingStyleDelete) {
            Deletepath=indexPath.row;
            
                
                
                
                
                [self FleetCrewdelete];
                [_crewmembersarray removeObject:indexPath];
                
            }
            
        }

}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_fleettable||tableView==_groupfleettable)
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
#pragma mark-Touch Gesture
-(void)labelTap:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.groupfleettable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.groupfleettable indexPathForRowAtPoint:locationInTableview];
    
  
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    
    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
    _fleetVCtrl=[[FleetsViewController alloc]initWithNibName:@"FleetsViewController" bundle:nil];
    _fleetVCtrl.frmplan=1;
    _fleetVCtrl.itemfromgp=crewmdl1.manpower;
     _fleetVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_fleetVCtrl animated:YES completion:nil];
}
-(void)labelTap1:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.fleettable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.fleettable indexPathForRowAtPoint:locationInTableview];
    
    
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    
     Equpmntmdl*emdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
    _fleetVCtrl=[[FleetsViewController alloc]initWithNibName:@"FleetsViewController" bundle:nil];
    _fleetVCtrl.frmplan=1;
    _fleetVCtrl.itemfromgp=emdl.itemcode;
    _fleetVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_fleetVCtrl animated:YES completion:nil];
}

#pragma mark-Actions
- (IBAction)servicebtn:(UIButton *)sender {
    poptype=1;
    [self createpopover];
    [self AllSkills];
    
}

- (IBAction)crewbtn:(id)sender {
    poptype=2;
    [self createcrewpopover];
    [self FleetCrewSetUpSelect];
    
}

- (IBAction)detetegpbtn:(UIButton *)sender {
    
    if([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]){
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select a Fleet group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        NSString*alertstrg=[NSString stringWithFormat:@"Are you sure you want to delete %@ group",_crewbtnlbl.titleLabel.text];
        msgstrg=alertstrg;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:alertstrg delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        [alert show];
        
        //[self FleetCrewSetUpDelete];
        
    }

}

- (IBAction)savecrewbtn:(UIButton *)sender {
    if ([_crewtextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Group name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{

    [self FleetCrewSave];
    }
}

- (IBAction)closebtn:(id)sender {
[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_groupfleettable setEditing:NO animated:NO];
        [_groupfleettable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_groupfleettable setEditing:YES animated:YES];
        [_groupfleettable reloadData];
        
        
    }

}

- (IBAction)deleteallbtn:(id)sender {
    
    if([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]){
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select a Fleet group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        NSString*alertstrg=[NSString stringWithFormat:@"Are you sure you want to delete all items in %@ group",_crewbtnlbl.titleLabel.text];
        msgstrg1=alertstrg;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:alertstrg delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        [alert show];
    }
    
}

    //[self AllFleetCrewDelete];
#pragma mark-alert
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([alertView.message isEqualToString:msgstrg]) {
        
        
        if (buttonIndex==[alertView cancelButtonIndex]){
            clear=1;
            [self AllFleetCrewDelete];
            
        }
        
        else{
            
            
        }
    }
    if ([alertView.message isEqualToString:msgstrg1]) {
        
        
        if (buttonIndex==[alertView cancelButtonIndex]){
           [self AllFleetCrewDelete];
            
        }
        
        else{
            
            
        }
    }
    
    
    
}
#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}

#pragma mark-drag and drop

- (void)setupSourceTableWithFrame:(CGRect)frame
{
    
    [self.touchview addSubview:_fleettable];
}
- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(538, 30, 460, 700)];
    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    // [dropArea setBackgroundColor:[UIColor redColor]];
    [self.touchview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_groupfleettable];
    
}
- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_fleettable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

  //  CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
      Equpmntmdl*emdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
       draggedCell.textLabel.text =emdl.itemcode;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.touchview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_fleettable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_groupfleettable];
    
    if([_fleettable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_groupfleettable pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    if ([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please select Group Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
        
        
        NSIndexPath* indexPath = [_fleettable indexPathForRowAtPoint:point];
        UITableViewCell* cell = [_fleettable cellForRowAtIndexPath:indexPath];
        
        if(cell != nil)
        {
            CGPoint origin = cell.frame.origin;
            origin.x += _fleettable.frame.origin.x;
            origin.y += _fleettable.frame.origin.y;
            
            [self initDraggedCellWithCell:cell AtPoint:origin];
            cell.highlighted = NO;
            
            if(draggedData != nil)
            {
                //[draggedData release];
                draggedData = nil;
            }
            
            crewpath=indexPath.row;
            
          Equpmntmdl*emdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
            
            draggedData = emdl.itemcode;
            NSLog(@"%@",emdl.itemdescptn);
        }
    }
    
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_groupfleettable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_groupfleettable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += dropArea.frame.origin.x;
        origin.y += dropArea.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        Equpmntmdl*emdl=(Equpmntmdl *)[_fleetarray objectAtIndex:indexPath.row];
        draggedData = emdl.itemcode;
        
        // remove old cell
        [_crewmembersarray removeObjectAtIndex:indexPath.row];
        [_groupfleettable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _groupfleettable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _groupfleettable.frame = frame;
         }];
        
    }
    
}

- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                           [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    existstring=@"";
    if(draggedCell != nil && draggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_groupfleettable indexPathForRowAtPoint:[gestureRecognizer locationInView:_groupfleettable]];
            if(indexPath != nil)
            {
                Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                crewmdl1.manpower=draggedData;
                [_crewmembersarray addObject:crewmdl1];
                
                //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
                [_groupfleettable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//                [self  UserLogcrewMove];
//                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
//                
//                if (rightsmodel.EditModule==0) {
//                    
//                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                    [alert show];
//                }
//                else
//                {
                
                            [self Fleetcrewinsert];
               // }
                
            }
            else
            {
                if ([_crewmembersarray count]==0) {
                    Crewmodel *crewmdl1=[[Crewmodel alloc]init];
                    crewmdl1.manpower=draggedData;
                    [_crewmembersarray addObject:crewmdl1];
                    
                }
                else{
                    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                    crewmdl1.manpower=draggedData;
                    [_crewmembersarray addObject:crewmdl1];
                }
//                [self  UserLogcrewMove];
//                Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
//                
//                if (rightsmodel.EditModule==0) {
//                    
//                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to drag this item" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//                    [alert show];
//                }
//                else
//                {
                
                             [self Fleetcrewinsert];
              //  }
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_crewmembersarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_groupfleettable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        if ([existstring isEqualToString:@"This Fleet is  Already Exists"]) {
            [draggedCell removeFromSuperview];
            //[draggedCell release];
            draggedCell = nil;
            
            //[draggedData release];
            draggedData = nil;
            
        }
        else
        {
            
            
            
            [UIView animateWithDuration:0.3 animations:^
             {
                 CGRect frame = _groupfleettable.frame;
                 //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
                 _groupfleettable.frame = frame;
             }];
            
            [draggedCell removeFromSuperview];
            //[draggedCell release];
            draggedCell = nil;
            
            //[draggedData release];
            draggedData = nil;
        }
    }
}


@end
