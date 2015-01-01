//
//  LabourViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 09/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "LabourViewController.h"

@interface LabourViewController ()

@end

@implementation LabourViewController

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
     sum=0;
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
  
    // Do any additional setup after loading the view from its nib.
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _labrtable.layer.borderWidth=3.0f;
    _labrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   dateselctor=0;
     sum=0;
    _totalarray=[[NSMutableArray alloc]init];
    _newlabrarray=[[NSMutableArray alloc]init];
    [self CountFromEmployeeSelect];
    //[self ProjectManPowerRequiredSelect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clsebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
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
            [self.popOverController presentPopoverFromRect:_jobbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_descbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
        case 3:
            [self.popOverController presentPopoverFromRect:_datebtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
        default:
            break;
    }
    
    
    
    
    
}
- (IBAction)jobcheckbtnaction:(id)sender
{
    btnclck++;
    if (btnclck%2!=0) {
        [_jobcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        _jobbtn.enabled=YES;
    }
    else
    {
        [_jobcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _jobbtn.enabled=NO;
        [_jobbtn setTitle:@"Select Job Number" forState:UIControlStateNormal];
    }

}
- (IBAction)desccheckaction:(id)sender
{
    btnclck2++;
    if (btnclck2%2!=0) {
        [_desccheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        _descbtn.enabled=YES;
    }
    else
    {
        [_desccheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _descbtn.enabled=NO;
        [_descbtn setTitle:@"Select Description" forState:UIControlStateNormal];
    }

}
- (IBAction)datecheckbtnaction:(id)sender
{
    btnclck3++;
    if (btnclck3%2!=0) {
        [_datecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        _datebtn.enabled=YES;
         dateselctor=1;
    }
    else
    {
        [_datecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _datebtn.enabled=NO;
        [_datebtn setTitle:@"Select Date" forState:UIControlStateNormal];
         dateselctor=0;
    }

}

- (IBAction)cancelbtn:(id)sender {
    [self ProjectManPowerRequiredSelect];
}


- (IBAction)selectjob:(id)sender
{
    btnindex=1;
    [self createpopover];
    [self ManPowerJobnumberSelect];
}
- (IBAction)selectdate:(id)sender
{
    btnindex=3;
    [self createpopover];
    [self LabourCalenderdateSelect];
}
- (IBAction)seletdesc:(id)sender
{
    btnindex=2;
    [self createpopover];
    [self LabourDescriptionSelect];
}
- (IBAction)show:(id)sender
{
    [self ManpowerreqSearch];
}


#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
                return [_jobarray count];
                break;
            case 2:
                return [_descarray count];
                break;
            case 3:
                return [_datearray count];
                break;
                
                
            default:
                break;
        }
        
    }
    else
    {

    return [_newlabrarray count];
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_labrtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Lbrcuscell" owner:self options:nil];
            cell=_labrcell;
        }
    }
     cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
                
                cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
                break;
            case 2:
                
                cell.textLabel.text=[_descarray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_datearray objectAtIndex:indexPath.row];
                
                break;
                
                
            default:
                break;
        }
        
        
    }

        if(tableView==_labrtable)
        {
            
            Labourcustommdl*lmdl=(Labourcustommdl *)[_newlabrarray objectAtIndex:indexPath.row];
                _joblbl=(UILabel*)[cell viewWithTag:1];
                cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
                _joblbl.text=lmdl.JobNumber;
                _itemcodelbl=(UILabel*)[cell viewWithTag:2];
                
                _itemcodelbl.text=lmdl.ItemCode;
                _deslbl=(UILabel*)[cell viewWithTag:3];
                _deslbl.text=lmdl.jbDescription;
                _datelbl=(UILabel*)[cell viewWithTag:4];
                NSArray*array=[lmdl.CalenderDate componentsSeparatedByString:@"T"];
                NSString*news=[array objectAtIndex:0];
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"yyyy-MM-dd"];
                NSDate *dates = [dateFormat dateFromString:news];
                [dateFormat setDateFormat:@"MM-dd-yyy"];
                NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                _datelbl.text=myFormattedDate;
                
                _quantitylbl=(UILabel*)[cell viewWithTag:5];
                _quantitylbl.text=lmdl.qty;
            _countlabel=(UILabel*)[cell viewWithTag:6];
            if ([lmdl.count length]==0) {
                
                _countlabel.text=@"0";

            }
            else
            {
                _countlabel.text=lmdl.count;
            }
           
                
            
            }
            
    
return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popOverTableView) {
        switch (btnindex) {
            case 1:
                
                
                [_jobbtn setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                break;
            case 2:
                
                [_descbtn setTitle:[[_descarray objectAtIndex:indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] forState:UIControlStateNormal ];
                
                break;
            case 3:
                
                [_datebtn setTitle:[_datearray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                break;
                
                
            default:
                break;
        }
        
        //   [_optionbtnlbl setTitle:[_Optionarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
    }
    [self.popOverController dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_labrtable)
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



#pragma mark-webservices
-(void)ProjectManPowerRequiredSelect
{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ProjectManPowerRequiredSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ProjectManPowerRequiredSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ProjectManPowerRequiredSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)LabourDescriptionSelect
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LabourDescriptionSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</LabourDescriptionSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/LabourDescriptionSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)LabourCalenderdateSelect
{
       recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LabourCalenderdateSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</LabourCalenderdateSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/LabourCalenderdateSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ManPowerJobnumberSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ManPowerJobnumberSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ManPowerJobnumberSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ManPowerJobnumberSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ManpowerreqSearch
{
    recordResults = FALSE;
    NSString*job;
    NSString*desc;
    NSString*itemdate;
    job= _jobbtn.titleLabel.text;
    desc= [_descbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    itemdate= _datebtn.titleLabel.text;
    
    if ([_jobbtn.titleLabel.text isEqualToString:@"Select Job Number"]) {
        
        job=@"";
    }
    if ([_descbtn.titleLabel.text isEqualToString:@"Select Description"]) {
        
        desc=@"";
    }
    if ([_datebtn.titleLabel.text isEqualToString:@"Select Date"]) {
        
        itemdate=@"1900-1-1";
    }
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ManpowerreqSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<string1>%@</string1>\n"
                   "<string2>%@</string2>\n"
                   "<string3>%@</string3>\n"
                   "<cnt>%d</cnt>\n"
                   "</ManpowerreqSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job,desc,itemdate,dateselctor];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ManpowerreqSearch" forHTTPHeaderField:@"Soapaction"];
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
-(void)CountFromEmployeeSelect
{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CountFromEmployeeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</CountFromEmployeeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CountFromEmployeeSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    
    if (webtype==2) {
       
        [self ProjectManPowerRequiredSelect];
            }
    if (webtype==1) {
        
        [self checkqtyavailability];
        [self newcalcuations];
        [_labrtable reloadData];
       

    }
    [_popOverTableView reloadData];
    
  
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ProjectManPowerRequiredSelectResponse"])
    {
        _labourarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CalenderDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qty"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"CountFromEmployeeSelectResponse"])
    {
        _employeecountarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"countJobNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CountDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"count1"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LabourDescriptionSelectResponse"])
    {
        _descarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LabourDes"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LabourCalenderdateSelectResponse"])
    {
        _datearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LabourCalenderdate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManPowerJobnumberSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"manjobnumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManpowerreqSearchResponse"])
    {
        _labourarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"ProjectManPowerRequiredSelectResponse"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        
        recordResults = FALSE;
        _lbrmdl=[[Labourcustommdl alloc]init];
        _lbrmdl.JobNumber=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
      
        _lbrmdl.ItemCode=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
       
        _lbrmdl.jbDescription=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"CalenderDate"])
    {
        
        recordResults = FALSE;
        _lbrmdl.CalenderDate=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"qty"])
    {
        
        recordResults = FALSE;
      
        _lbrmdl.qty=_soapResults;
        [_labourarray addObject:_lbrmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"countJobNumber"])
    {
        
        recordResults = FALSE;
        _emdl=[[Countmdl alloc]init];
        _emdl.JobNumber=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountDescription"])
    {
        
        recordResults = FALSE;
      _emdl.jbDescription=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"count1"])
    {
        
        recordResults = FALSE;
        _emdl.count1=_soapResults;
        [_employeecountarray addObject:_emdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LabourDes"])
    {
        
        recordResults = FALSE;
        [_descarray addObject:_soapResults];
                _soapResults = nil;
    }
    if([elementName isEqualToString:@"LabourCalenderdate"])
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
        [_datearray addObject:myFormattedDate];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"manjobnumber"])
    {
        
        recordResults = FALSE;
        [_jobarray addObject:_soapResults];
        _soapResults = nil;
    }






}
//- (void)parserDidEndDocument:(NSXMLParser *)parser
//{
//    if (webtype==1) {
//        [self checkqtyavailability1];
//        [self newcalcuations];
//        [_labrtable reloadData];
//        
//        
//    }
//
//}
#pragma mark-calculations
-(void)calculatesum
{
    
    int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]integerValue])+sum;
      
        
        _totalquantitylabel.text=[NSString stringWithFormat:@"%d",sum]  ;
        
    }
    
}

-(void)newcalcuations{
    
    _totalarray=[[NSMutableArray alloc]init];
            for (int i=0; i<[_labourarray count]; i++) {
                Labourcustommdl *lmdl=(Labourcustommdl *)[_labourarray objectAtIndex:i];
               
               
                [_totalarray addObject:[NSString stringWithFormat:@"%d",[lmdl.qty integerValue]]];
               
                
                if (i==[_labourarray count]-1) {
                    [self calculatesum];
                    sum=0;
                }
            }
    }
-(void)checkqtyavailability
{  _newlabrarray=[[NSMutableArray alloc]init];
    for (int i=0; i<[_labourarray count]; i++)
    {
        
        Labourcustommdl*lmdl=(Labourcustommdl *)[_labourarray objectAtIndex:i];
        
        NSLog(@"%@",lmdl.JobNumber);
        
        NSLog(@"%@",lmdl.jbDescription);
        
        for (int j=0; j<[_employeecountarray count]; j++)
        {
            Countmdl *emdl=(Countmdl *)[_employeecountarray objectAtIndex:j];
            NSLog(@"%@",emdl.JobNumber);
            NSLog(@"%@",emdl.jbDescription);
            
            if ([lmdl.JobNumber isEqualToString:emdl.JobNumber]&&[lmdl.jbDescription isEqualToString:emdl.jbDescription])
            {
                NSLog(@"%@",emdl.JobNumber);
                NSLog(@"%@",emdl.jbDescription);
                NSLog(@"%@",lmdl.JobNumber);
                NSLog(@"%@",lmdl.jbDescription);
               
                
                
                lmdl.count=emdl.count1;
                 NSLog(@"%@",lmdl.count);
            }
//            else
//            {
//                
//                lmdl.count=@"0";
//            }

        }
        NSLog(@"%@",lmdl.count);
        
        [_newlabrarray addObject:lmdl];
    }
}

@end
