//
//  CalEventDetailViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 28/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "CalEventDetailViewController.h"

@interface CalEventDetailViewController ()

@end

@implementation CalEventDetailViewController

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
    _mattitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _mantitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _summarytitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _calmanpwrtable.layer.borderWidth = 2.0;
    _calmanpwrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _sumtable.layer.borderWidth = 2.0;
    _sumtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;
    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _totallabel.text=@"";
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
      _sumtable.hidden=YES;
     _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
    //[_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
    _totalarray=[[NSMutableArray alloc]init];
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        _navitem.title=[NSString stringWithFormat:@"Estimation Review-%@",_estimationnumber];
        _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
        _searchbar.delegate=(id)self;
        _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
        self.calmanpwrtable.tableHeaderView=_searchbar;
        UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
        searchctrlr.searchResultsDelegate=(id)self;
        searchctrlr.searchResultsDataSource=(id)self;
        searchctrlr.delegate=(id)self;

        [self EstimationManPowerReviewSelect];
    }
    else
    {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:_selecteddate];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _navitem.title=[NSString stringWithFormat:@"Estimation Calendar-%@",myFormattedDate];
        [self CalenderManPowerSelect];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-IBActions
- (IBAction)clsebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
     _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;
    //[_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
     _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
    
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        [self EstimationManPowerReviewSelect];
    }
    else
    {

     [self CalenderManPowerSelect];
    }
}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
     _eqpmntbtn.tintColor=[UIColor whiteColor];
    _manpwrbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor blackColor];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        [self EstimationEquipmentReviewSelect];
    }
    else
    {

    [self CalenderEquipmentSelect];
    }
   // [_calmanpwrtable reloadData];
}
- (IBAction)materialaction:(id)sender
{
    tooltype=3;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor whiteColor];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        [self EstimationOtherReviewSelect];
    }
    else
    {

   [self CalenderOtherSelect];
    }
   
}
- (IBAction)summaryaction:(id)sender
{
    tooltype=4;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor whiteColor];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=NO;
    _calmanpwrtable.hidden=YES;
    _sumtable.hidden=NO;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        sum=0;
        _reviewsumarray=[[NSMutableArray alloc]init];
        _titlearray=[[NSMutableArray alloc]init];
        [self SummaryManPowerSelect];
       // [self SummaryEquipmentSelect];
        //[self SummaryMaterialSelect];
    }
    else
    {
    [self  SummarySelect];
    }
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_calmanpwrtable) {
        if (tooltype==1) {
            
            return [_manpwrarray count];
           }
        if (tooltype==2) {
            
            return [_eqpmntarray count];
        }
        if (tooltype==3) {
            
         return [_otherarray count];
        }
    }
    if (tableView==_sumtable)
    {
         if ([_estimationstring isEqualToString:@"Estimationreview"]) {
           return [_reviewsumarray count];
        
         }
         else
         {
             return [_summaryarray count];
         }
        }
    
    return YES;
    
    
}
#pragma mark-tableview delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_calmanpwrtable) {
            if (tooltype==1) {
                [[NSBundle mainBundle]loadNibNamed:@"Eventcalcell" owner:self options:nil];
                cell=_calmanpwrcell;
            }
            if (tooltype==2) {
                [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                cell=_calmaterialcell;
            }
            if (tooltype==3) {
                [[NSBundle mainBundle]loadNibNamed:@"calothereventcell" owner:self options:nil];
                cell=_calothercell;
            }
           
            
        }
        if (tableView==_sumtable)
        {
           // if (tooltype==4) {
                [[NSBundle mainBundle]loadNibNamed:@"Sumcell" owner:self options:nil];
                cell=_sumcell;
            //}
        }
       
    
     cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    }
        if (tableView==_calmanpwrtable) {
            if (tooltype==1) {

              
                Detaileventmanpwr *manmdl=(Detaileventmanpwr *)[_manpwrarray objectAtIndex:indexPath.row];
                
                _manitemcodelabel=(UILabel *)[cell viewWithTag:1];
                _manitemcodelabel.text=manmdl.ItemCode;
                _mandeslabel=(UILabel *)[cell viewWithTag:2];
                _mandeslabel.text=manmdl.eventDescription;
                  _manpdatelabel=(UILabel *)[cell viewWithTag:3];
                if ([_estimationstring isEqualToString:@"Estimationreview"]) {
                    NSArray*array=[manmdl.mandate componentsSeparatedByString:@"T"];
                    NSString*news=[array objectAtIndex:0];
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:news];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _manpdatelabel.text=myFormattedDate;
                }
                else
                {
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:_selecteddate];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _manpdatelabel.text=myFormattedDate;
                
                }
                _manqtylabel=(UILabel *)[cell viewWithTag:4];
                _manqtylabel.text=manmdl.Qty;
                _manstlabel=(UILabel *)[cell viewWithTag:5];
                NSInteger totst=([manmdl.ST integerValue ]*[manmdl.Qty integerValue]);
                _manstlabel.text=[NSString stringWithFormat:@"%d",totst];

                _manotlabel=(UILabel *)[cell viewWithTag:6];
                _manotlabel.text=manmdl.OT;

                _manstratelabel=(UILabel *)[cell viewWithTag:7];
                _manstratelabel.text=[NSString stringWithFormat:@"$%@",manmdl.STrate];
                _manotratelabel=(UILabel *)[cell viewWithTag:8];
                _manotratelabel.text=[NSString stringWithFormat:@"$%@",manmdl.OTrate];

                NSInteger A1=([manmdl.ST integerValue])*([manmdl.STrate integerValue]);
                 NSInteger A2=([manmdl.OT integerValue])*([manmdl.OTrate integerValue]);
                NSInteger B=A1+A2;
                NSInteger total=B*([manmdl.Qty integerValue]);
                NSLog(@"%d",total);
               
             _manotratelabel=(UILabel *)[cell viewWithTag:9];
                _mantotallabel.text=[NSString stringWithFormat:@"$%d",total];
                _typelabel=(UILabel *)[cell viewWithTag:10];
                _typelabel.text=manmdl.mtype;
                _phaselabel=(UILabel *)[cell viewWithTag:11];
                _phaselabel.text=manmdl.phasename;
                
    }
            if (tooltype==3)
            {
               // _totallabel.text=@"";
                
                OthereventMaodel *othmdl=(OthereventMaodel *)[_otherarray objectAtIndex:indexPath.row];
                
                _Otheritemcodelabel=(UILabel *)[cell viewWithTag:1];
                _Otheritemcodelabel.text=othmdl.ItemCode;
                _Otherdeslabel=(UILabel *)[cell viewWithTag:2];
                _Otherdeslabel.text=othmdl.eventDescription;
                _otherdatelabel=(UILabel *)[cell viewWithTag:3];
                if ([_estimationstring isEqualToString:@"Estimationreview"]) {
                    NSArray*array=[othmdl.otherdate componentsSeparatedByString:@"T"];
                    NSString*news=[array objectAtIndex:0];
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:news];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _otherdatelabel.text=myFormattedDate;
                }
                else {
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:_selecteddate];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _otherdatelabel.text=myFormattedDate;

                }
                _otherqtylabel=(UILabel *)[cell viewWithTag:4];
                _otherqtylabel.text=othmdl.Qty;
                _othertotallabel=(UILabel *)[cell viewWithTag:5];
                NSInteger B1=([othmdl.UnitCost integerValue])*([othmdl.Qty integerValue]);
                _othertotallabel.text=[NSString stringWithFormat:@"$%d",B1];
                _otherphaselabel=(UILabel *)[cell viewWithTag:6];
                _otherphaselabel.text=othmdl.otherphasename;
                
                
                
            }

            if (tooltype==2)
            {
              // _totallabel.text=@"";
                Eqeventmdl *eqmdl=(Eqeventmdl *)[_eqpmntarray objectAtIndex:indexPath.row];
                
                _Eqitemcodelabel=(UILabel *)[cell viewWithTag:1];
                _Eqitemcodelabel.text=eqmdl.ItemCode;
                _Eqdeslabel=(UILabel *)[cell viewWithTag:2];
                _Eqdeslabel.text=eqmdl.eventDescription;
                _Eqdatelabel=(UILabel *)[cell viewWithTag:3];
                if ([_estimationstring isEqualToString:@"Estimationreview"]) {
                    NSArray*array=[eqmdl.eqdate componentsSeparatedByString:@"T"];
                    NSString*news=[array objectAtIndex:0];
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:news];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                   _Eqdatelabel.text=myFormattedDate;
                }
                else {
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:_selecteddate];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                _Eqdatelabel.text=myFormattedDate;
                }
                _Eqqtylabel=(UILabel *)[cell viewWithTag:4];
                _Eqqtylabel.text=eqmdl.Qty;
                _Eqtotallabel=(UILabel *)[cell viewWithTag:5];
                 NSInteger B1=([eqmdl.UnitCost integerValue])*([eqmdl.Qty integerValue]);
                _Eqtotallabel.text=[NSString stringWithFormat:@"$%d",B1];
                _Eqphaselabel=(UILabel *)[cell viewWithTag:6];
                _Eqphaselabel.text=eqmdl.eqphasename;
                


                
            }
            
        
    
        }
    if (tableView==_sumtable) {
         //_totallabel.text=@"";
        if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        _summarylabel=(UILabel *)[cell viewWithTag:1];
        _costlabel=(UILabel *)[cell viewWithTag:2];
        _summarylabel.text=[_titlearray objectAtIndex:indexPath.row];
        _costlabel.text=[NSString stringWithFormat:@"$%@",[_reviewsumarray objectAtIndex:indexPath.row]];
                }
        else
        {
            
        
        NSLog(@"%@",_summaryarray);
        NSArray*array=[[_summaryarray objectAtIndex:indexPath.row ] componentsSeparatedByString:@" "];
        NSString*newtitile=[array objectAtIndex:0];
      NSString*newtitiles=[array objectAtIndex:1];
         NSLog(@"%@",newtitiles);
         NSLog(@"%@",newtitile);
        _summarylabel=(UILabel *)[cell viewWithTag:1];
            _costlabel=(UILabel *)[cell viewWithTag:2];
        _summarylabel.text=newtitile;
        _costlabel.text=[NSString stringWithFormat:@"$%@",newtitiles];
       
            
        }


    }
    
    return cell;
    

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_calmanpwrtable||(tableView==_sumtable))
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
#pragma mark-Webservices
-(void)CalenderManPowerSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
//    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
//    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
//    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
//    NSLog(@"s%@",dates);
//    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
//    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
//    
//    NSString*    dateString = [dateFormat2 stringFromDate:dates];
     NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderManPowerSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CalenderManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CalenderEquipmentSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    //    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    //    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    //    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
    //    NSLog(@"s%@",dates);
    //    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    //    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    //
    //    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderEquipmentSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CalenderEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CalenderOtherSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    //    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    //    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    //    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
    //    NSLog(@"s%@",dates);
    //    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    //    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    //
    //    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderOtherSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderOtherSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/CalenderOtherSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SummarySelect{
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SummarySelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<start>%@</start>\n"
                   "</SummarySelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SummarySelect" forHTTPHeaderField:@"Soapaction"];
    
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
/*webservicefor estimationreview*/
-(void)EstimationManPowerReviewSelect
{
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    NSLog(@"%@",estmtn);
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationManPowerReviewSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<LeadId>%d</LeadId>\n"
                   "</EstimationManPowerReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/EstimationManPowerReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationEquipmentReviewSelect
{
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationEquipmentReviewSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EstimationEquipmentReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/EstimationEquipmentReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationOtherReviewSelect
{
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationOtherReviewSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EstimationOtherReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/EstimationOtherReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SummaryManPowerSelect
{
    tooltype=6;
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SummaryManPowerSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SummaryManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SummaryEquipmentSelect
{
    tooltype=7;
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SummaryEquipmentSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SummaryEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SummaryMaterialSelect
{
    tooltype=5;
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SummaryMaterialSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryMaterialSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SummaryMaterialSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ManPowerReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<ManPowerReviewSearch xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</ManPowerReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/ManPowerReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmentReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<EquipmentReviewSearch xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EquipmentReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/EquipmentReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)OtherReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<OtherReviewSearch xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</OtherReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/OtherReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser
       )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    if (tooltype==1||tooltype==2||tooltype==3) {
          [self newcalcuations];
        [_calmanpwrtable reloadData];
    }
    
 
   // [_calmanpwrtable reloadData];
    if (tooltype==4) {
        [self calculatereviewsum];
        [_sumtable reloadData];
    }
    
    switch (tooltype) {
        case 5:
            [self calculatereviewsum];
             [_sumtable reloadData];

            break;

        case 7:
            [self SummaryMaterialSelect];
            break;

        case 6:
            [self SummaryEquipmentSelect];
            break;
            
        default:
            break;
    }
   
    


}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CalenderManPowerSelectResponse"])
    {_manpwrarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"EstimationManPowerReviewSelectResult"])
    {_manpwrarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ManPowerReviewSearchResponse"])
    {_manpwrarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"ItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"CalenderDate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Qty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ST"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OT"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"STrate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"OTrate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"CalenderEquipmentSelectResponse"])
    {_eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"EstimationEquipmentReviewSelectResponse"])
    {_eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EquipmentReviewSearchResponse"])
    {_eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"eqItemCode"])
    {        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQDescription"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"UnitCost"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EQCalenderDate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EqQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EqPhaseName"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"CalenderOtherSelectResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EstimationOtherReviewSelectResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherReviewSearchResponse"])
    {
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"OtherItemCode"])
    {
        if(!_soapresults)
    {
        _soapresults = [[NSMutableString alloc] init];
    }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherCodeDescription"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"otherUnitCost"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherCalenderDate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    
    if([elementName isEqualToString:@"OtherQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherPhaseName"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"SummarySelectResponse"])
    {
        _summaryarray=[[NSMutableArray alloc]init];
       _totallabel.text=@"";
      
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Title"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SummaryManPowerSelectResponse"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SummaryMaterialSelectResponse"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SummaryEquipmentSelectResponse"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"Column1"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column2"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    




    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"CalenderManPowerSelect"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"EstimationManPowerReviewSelectResult"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ItemCode"])
    {
        _manpwr=[[Detaileventmanpwr alloc]init];
        recordResults = FALSE;
        
        _manpwr.ItemCode=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _manpwr.eventDescription=_soapresults;
        
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"Qty"])
    {
       
        recordResults = FALSE;
        _manpwr.Qty=_soapresults;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"CalenderDate"])
    {
        
        recordResults = FALSE;
        _manpwr.mandate=_soapresults;
        
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ST"])
    {
        recordResults = FALSE;
        _manpwr.ST=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"OT"])
    {
        recordResults = FALSE;
        _manpwr.OT=_soapresults;
        
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"STrate"])
    {
        recordResults = FALSE;
        _manpwr.STrate=_soapresults;
        
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"OTrate"])
    {
        recordResults = FALSE;
        _manpwr.OTrate=_soapresults;
       // [_manpwrarray addObject:_manpwr];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"MType"])
    {
        recordResults = FALSE;
        _manpwr.mtype=_soapresults;
        //[_manpwrarray addObject:_manpwr];
        _soapresults = nil;
        
    }

    if([elementName isEqualToString:@"PhaseName"])
    {
        recordResults = FALSE;
        _manpwr.phasename=_soapresults;
        [_manpwrarray addObject:_manpwr];
        _soapresults = nil;
        
    }

    if([elementName isEqualToString:@"eqItemCode"])
    {     _eqmdl=[[Eqeventmdl alloc]init];
        recordResults = FALSE;
        
        _eqmdl.ItemCode=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"EQDescription"])
    {
        
        recordResults = FALSE;
        
        _eqmdl.eventDescription=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"UnitCost"])
    {recordResults = FALSE;
        
        _eqmdl.UnitCost=_soapresults;
        _soapresults = nil;
           }
    if([elementName isEqualToString:@"EQCalenderDate"])
    {recordResults = FALSE;
        
        _eqmdl.eqdate=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"EqQty"])
    {
        recordResults = FALSE;
        
        _eqmdl.Qty=_soapresults;
        //[_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }if([elementName isEqualToString:@"EqPhaseName"])
    {
        recordResults = FALSE;
        
        _eqmdl.eqphasename=_soapresults;
        [_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }
   
    if([elementName isEqualToString:@"OtherItemCode"])
    {     _othrmdl=[[OthereventMaodel alloc]init];
        recordResults = FALSE;
        
        _othrmdl.ItemCode=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"OtherCodeDescription"])
    {
        
        recordResults = FALSE;
        
        _othrmdl.eventDescription=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"otherUnitCost"])
    {recordResults = FALSE;
        
        _othrmdl.UnitCost=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"OtherCalenderDate"])
    {recordResults = FALSE;
        
        _othrmdl.otherdate=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"OtherQty"])
    {
        recordResults = FALSE;
        
        _othrmdl.Qty=_soapresults;
       // [_otherarray addObject:_othrmdl];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"OtherPhaseName"])
    {
        recordResults = FALSE;
        
        _othrmdl.otherphasename=_soapresults;
        [_otherarray addObject:_othrmdl];
        _soapresults = nil;
        
    }

    if([elementName isEqualToString:@"Title"])
    {
        recordResults = FALSE;
        
        
        [_summaryarray addObject:_soapresults];
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"Column2"])
    {
        recordResults = FALSE;
        
        
        [_reviewsumarray addObject:_soapresults];
      
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        recordResults = FALSE;
        
        
        [_titlearray addObject:_soapresults];
        _soapresults = nil;
    }


}
#pragma mark-calculations
-(void)calculatesum
{
    
    int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]integerValue])+sum;
        NSLog(@"%d",sum);
        _totallabel.text=[NSString stringWithFormat:@"$%d",sum]  ;
    }
}

-(void)calculatereviewsum
{
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        
        for (int i=0; i<[_reviewsumarray count]; i++) {
            
            [_totalarray addObject:[_reviewsumarray objectAtIndex:i]];
            NSLog(@"%@",_totalarray);
            if (i==[_reviewsumarray count]-1) {
                
                for ( int x=0; x<[_reviewsumarray count]; x++)
                {
                    sum=([[_totalarray objectAtIndex:x]integerValue])+sum;
                    NSLog(@"%d",sum);
                    _totallabel.text=[NSString stringWithFormat:@"$%d",sum]  ;
                }
                
                sum=0;
                
            }
        }
        
    }
    else{
        
        
        for (int i=0; i<[_summaryarray count]; i++) {
            NSArray*array=[[_summaryarray objectAtIndex:i] componentsSeparatedByString:@" "];
            //NSString*newtitile=[array objectAtIndex:0];
            NSString*newtitiles=[array objectAtIndex:1];
            
            [_totalarray addObject:newtitiles];
            NSLog(@"%@",_totalarray);
            
            if (i==[_summaryarray count]-1) {
                for ( int x=0; x<[_totalarray count]; x++)
                {
                    sum=([[_totalarray objectAtIndex:x]integerValue])+sum;
                    NSLog(@"%d",sum);
                    _totallabel.text=[NSString stringWithFormat:@"$%d",sum]  ;
                }
                
                
                sum=0;
            }
            
            
        }
    }
    
}


-(void)newcalcuations{
    
    switch (tooltype) {
        case 1:
            for (int i=0; i<[_manpwrarray count]; i++) {
             Detaileventmanpwr *manmdl=(Detaileventmanpwr *)[_manpwrarray objectAtIndex:i];
            NSInteger A1=([manmdl.ST integerValue])*([manmdl.STrate integerValue]);
            NSInteger A2=([manmdl.OT integerValue])*([manmdl.OTrate integerValue]);
            NSInteger B=A1+A2;
            NSInteger total=B*([manmdl.Qty integerValue]);
            NSLog(@"%d",total);
            
           [_totalarray addObject:[NSString stringWithFormat:@"%d",total]];
            NSLog(@"%@",_totalarray);
            
            if (i==[_manpwrarray count]-1) {
                [self calculatesum];
                sum=0;
            }
            }

            break;
        case 2:
              for (int i=0; i<[_eqpmntarray count]; i++) {
             Eqeventmdl *eqmdl=(Eqeventmdl *)[_eqpmntarray objectAtIndex:i];
            NSInteger B1=([eqmdl.UnitCost integerValue])*([eqmdl.Qty integerValue]);
            [_totalarray addObject:[NSString stringWithFormat:@"%d",B1]];
            NSLog(@"%@",_totalarray);
            
            if (i==[_eqpmntarray count]-1) {
                [self calculatesum];
                sum=0;
                
            }
              }

            break;
        case 3:
            for (int i=0; i<[_otherarray count]; i++) {
                
                OthereventMaodel *othmdl=(OthereventMaodel *)[_otherarray objectAtIndex:i];
                NSInteger B1=([othmdl.UnitCost integerValue])*([othmdl.Qty integerValue]);
                [_totalarray addObject:[NSString stringWithFormat:@"%d",B1]];
                NSLog(@"%@",_totalarray);
                
                if (i==[_otherarray count]-1) {
                    
                    
                    [self calculatesum];
                    sum=0;
                }
                
            }

            break;

            
        default:
            break;
    }
   
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _totallabel.text=@"";
    _searchstring=_searchbar.text;
    _totalarray=[[NSMutableArray alloc]init];
    if (tooltype==1) {
        [self ManPowerReviewSearch];

    }
    else if(tooltype==2)
    {
        [self EquipmentReviewSearch];
    }
    else if(tooltype==3)
    {
        [self OtherReviewSearch];
    }

    
       [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    _totalarray=[[NSMutableArray alloc]init];
    if (tooltype==1) {
    [self EstimationManPowerReviewSelect];
    }
     if(tooltype==2)
     {
         [self EstimationEquipmentReviewSelect];
     }
    if(tooltype==3)
    {
        [self EstimationOtherReviewSelect];
    }
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    _totalarray=[[NSMutableArray alloc]init];
    if ([_searchbar.text length]==0) {
        if (tooltype==1) {
        [self EstimationManPowerReviewSelect];
        }
        if (tooltype==2) {
            [self EstimationEquipmentReviewSelect];
        }
        
        if (tooltype==3) {
            [self EstimationOtherReviewSelect];
        }
    }
    
}


@end
