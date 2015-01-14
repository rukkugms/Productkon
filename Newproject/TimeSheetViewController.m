//
//  TimeSheetViewController.m
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TimeSheetViewController.h"

@interface TimeSheetViewController ()

@end

@implementation TimeSheetViewController

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
     self.view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.view2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    newbarbutntype=1;
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=NO;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;

    _timesheettable.rowHeight=60;
    _timesheettable.layer.borderWidth=3.0;
    _timesheettable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _equipmnttableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _materialstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _otherstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _labortableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    
    
    _allemplyescheckbtnlbl.hidden=NO;
    _allemployeeslbl.hidden=NO;
    _foremanbtnlbl.hidden=NO;
    _foremancheckbtnlbl.hidden=NO;
    _foremanlbl.hidden=NO;

    _labrbarbtn.tintColor=[UIColor whiteColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];
   

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
    if(tableView==_timesheettable){
        switch (webtype) {
            case 1:
                return [_timesheetarray count];
                break;
            case 2:
                return [_equmntarray count];
                break;

            default:
                break;
        }
        
    }
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
               return [_jobarray count];
                break;
            case 2:
                return [_skillarray count];
                break;
            case 3:
                return [_foremandict count];
                break;
            case 4:
                return [_phasedict count];
                break;
            case 5:
                return [_sequcedict count];
                break;

            case 6:
                return [_POdict count];
                break;

            case 7:
                return [_WOdict count];
                break;
                

            default:
                break;
        }
        
    }
      return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  //  if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_timesheettable){
            switch (barbtntype) {
                case 1:
                      [[NSBundle mainBundle]loadNibNamed:@"Tlaborcell" owner:self options:nil];
                     cell=_laborcell;
                    break;
                case 2:
                    [[NSBundle mainBundle]loadNibNamed:@"TEqupcell" owner:self options:nil];
                    cell=_labrequpcell;
                    break;
                case 4:
                    [[NSBundle mainBundle]loadNibNamed:@"TOtherscell" owner:self options:nil];
                    cell=_labrothrcell;
                    break;
                    


                    
                default:
                    break;
            }
          
           
        }
    
    if (tableView==_popOverTableView) {
        NSArray*arry=[_foremandict allKeys];
        NSArray*phasearry=[_phasedict allKeys];
        NSArray*seqnearry=[_sequcedict allKeys];
        
        NSArray*poarray=[_POdict allKeys];
        NSArray*woarray=[_WOdict allKeys];
        switch (poptype) {
            case 1:
                  cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_skillarray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[arry objectAtIndex:indexPath.row];
                break;
            case 4:
                cell.textLabel.text=[phasearry objectAtIndex:indexPath.row];
                break;
                break;
            case 5:
                cell.textLabel.text=[seqnearry objectAtIndex:indexPath.row];
                break;

            case 6:
                cell.textLabel.text=[poarray objectAtIndex:indexPath.row];
                break;
                
            case 7:
                cell.textLabel.text=[woarray objectAtIndex:indexPath.row];
                break;
                

            default:
                break;
        }
      
    }
        
  if (tableView==_timesheettable) {
      
      if (webtype==1) {
          
      
      Timesheetmdl *tsmdl=(Timesheetmdl *)[_timesheetarray objectAtIndex:indexPath.row];
      _lbnamelbl=(UILabel *)[cell viewWithTag:1];
      _lbnamelbl.text=tsmdl.employeename;
      _craftlbl=(UILabel *)[cell viewWithTag:2];
      //_craftlbl.text
       _lbdatelbl=(UILabel *)[cell viewWithTag:3];
      _lbdatelbl.text=tsmdl.tsdate;
      _lbtimeinlbl=(UILabel *)[cell viewWithTag:4];
      _lbtimeinlbl.text=tsmdl.timein;
      _lbtimeoutlbl=(UILabel *)[cell viewWithTag:5];
      _lbtimeoutlbl.text=tsmdl.timeout;
      _lbphasebtnlbl=(UILabel *)[cell viewWithTag:6];
      _lbphasebtnlbl.text=tsmdl.phase;
      _lbsewuncebtnlbl=(UILabel *)[cell viewWithTag:7];
      _lbsewuncebtnlbl.text=tsmdl.sequencename;
      _lbtagbtnlbl=(UILabel *)[cell viewWithTag:8];
     // _lbtagbtnlbl.text=tsmdl.t
      _lbpolbl=(UILabel *)[cell viewWithTag:9];
      _lbwolbl=(UILabel *)[cell viewWithTag:10];
      
      }
      
      else if (webtype==2){
          
            Timesheetmdl *tsmdl=(Timesheetmdl *)[_equmntarray objectAtIndex:indexPath.row];
          _eqnamelbl=(UILabel *)[cell viewWithTag:1];
          _eqnamelbl.text=tsmdl.equipmentname;
          _eqdatelbl=(UILabel *)[cell viewWithTag:2];
          _eqdatelbl.text=tsmdl.tsdate;
        
          _eqtimeinlbl=(UILabel *)[cell viewWithTag:3];
          _eqtimeinlbl.text=tsmdl.timein;
          _eqtimeoutlbl=(UILabel *)[cell viewWithTag:4];
          _eqtimeoutlbl.text=tsmdl.timeout;
          _eqphaselbl=(UILabel *)[cell viewWithTag:5];
          _eqphaselbl.text=tsmdl.phasename;
          _eqsequcelbl=(UILabel *)[cell viewWithTag:6];
          _eqsequcelbl.text=tsmdl.sequencename;
          _eqtaglbl=(UILabel *)[cell viewWithTag:7];
         // _eqtaglbl.text=tsmdl.;
          _eqpolbl=(UILabel *)[cell viewWithTag:8];
          _eqpolbl.text=tsmdl.purcseid;
          _eqwolbl=(UILabel *)[cell viewWithTag:9];
          _eqwolbl.text=tsmdl.workid;

}
   
}
    
    
    
    
    
    return cell;
    
    
}
#pragma mark-Tableview datasouce
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray*arry=[_foremandict allKeys];
     NSArray*phasearry=[_phasedict allKeys];
    NSArray*poarray=[_POdict allKeys];
 NSArray*woarray=[_WOdict allKeys];
    NSArray*seqnearry=[_sequcedict allKeys];

       if(tableView==_popOverTableView){
        switch (poptype) {
            case 1:
                selectedindex=indexPath.row;

                 [_jobnumberbtnlbl setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                _servicebtnlbl.enabled=YES;
                break;
            case 2:
                   [_servicebtnlbl setTitle:[_skillarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 3:
                [_foremanbtnlbl setTitle:[arry objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 4:
                [_phase1btnlbl setTitle:[phasearry objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 5:
                [_sequence1btnlbl setTitle:[seqnearry objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;

            case 6:
               [_po1btnlbl setTitle:[poarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;

            case 7:
                [_wo1btnlbl setTitle:[woarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;

                
            default:
                break;
        }

        
 
        
        
    }
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_timesheettable)
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
                                            inView:self.scroll
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
    
    jobdate=dateString;
    
    switch (newbarbutntype) {
        case 1:
              barbtntype=1;
            [self TimesheetLaborselect];
            break;
        case 2:
         [self TimesheetEquipmentselect];
            break;
        case 3:
            [self TimesheetFleetselect];
            break;
        case 6:
            [self TimesheetMaterialselect];
            break;

        default:
            break;
    }
    
   
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
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 120.0f);
    self.popOverController=_popOverController;
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    switch (poptype) {
        case 1:
            [self.popOverController presentPopoverFromRect:_jobnumberbtnlbl.frame
                                                    inView:self.scroll
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            

            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_servicebtnlbl.frame
                                                    inView:self.scroll
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
        case 3:
            [self.popOverController presentPopoverFromRect:_foremanbtnlbl.frame
                                                    inView:self.view1
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;

        case 4:
            [self.popOverController presentPopoverFromRect:_phase1btnlbl.frame
                                                    inView:self.view1
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
        case 5:
            [self.popOverController presentPopoverFromRect:_sequence1btnlbl.frame
                                                    inView:self.view1
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;

        case 6:
            [self.popOverController presentPopoverFromRect:_po1btnlbl.frame
                                                    inView:self.view1
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
        case 7:
            [self.popOverController presentPopoverFromRect:_wo1btnlbl.frame
                                                    inView:self.view1
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;

        default:
            break;
    }
       }
-(void)createpopoverforview2{
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
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 120.0f);
    self.popOverController=_popOverController;
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    switch (poptype2) {
            
        case 1:
            [self.popOverController presentPopoverFromRect:_phase2btnlbl.frame
                                                    inView:self.view2
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_sequence2btnlbl.frame
                                                    inView:self.view2
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
            
        case 3:
            [self.popOverController presentPopoverFromRect:_po2btnlbl.frame
                                                    inView:self.view2
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
        case 4:
            [self.popOverController presentPopoverFromRect:_wo2btn.frame
                                                    inView:self.view2
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
            
        default:
            break;
    }
}

#pragma mark-Webservice
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
-(void)TimesheetServiceselect{
    recordResults=FALSE;
    
       NSArray*array1=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
        NSString*jobid=[NSString stringWithFormat:@"%@-%@",[array1 objectAtIndex:0],[array1 objectAtIndex:1]];
    
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimesheetServiceselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                    "<jobid>%@</jobid>\n"
                   "</TimesheetServiceselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimesheetServiceselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
 
    NSString *job=[NSString stringWithFormat:@"%@",[_jobdict objectForKey:jobno]];
    
    
    
 
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<job_id>%@</job_id>\n"
                   
                   "</ForemanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ForemanSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimeSheetPhasesSelect
{
    recordResults=FALSE;
    
    NSInteger serviceid=[[_skilldict objectForKey:_servicebtnlbl.titleLabel.text]integerValue];
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimeSheetPhasesSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ServicesId>%d</ServicesId>\n"
                   
                   "</TimeSheetPhasesSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",serviceid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimeSheetPhasesSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimeSheetSequenceSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
  //  NSString *job=[NSString stringWithFormat:@"%@",[_jobdict objectForKey:jobno]];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimeSheetSequenceSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<jobid>%@</jobid>\n"
                   
                   "</TimeSheetSequenceSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimeSheetSequenceSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)TimeSheetSequenceGeneralSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
  //  NSString *job=[NSString stringWithFormat:@"%@",[_jobdict objectForKey:jobno]];

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimeSheetSequenceGeneralSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<jobid>%@</jobid>\n"
                   
                   "</TimeSheetSequenceGeneralSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimeSheetSequenceGeneralSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)PurchaseOrderselect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSString *job=[NSString stringWithFormat:@"%@",[_jobdict objectForKey:jobno]];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PurchaseOrderselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<JobId>%@</JobId>\n"
                   
                   "</PurchaseOrderselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PurchaseOrderselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)WorkOrderselect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSString *job=[NSString stringWithFormat:@"%@",[_jobdict objectForKey:jobno]];
    NSInteger poid=[[_POdict objectForKey:_po1btnlbl.titleLabel.text]integerValue];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkOrderselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<JobId>%@</JobId>\n"
                   "<PurchaseId>%d</PurchaseId>\n"
                   "</WorkOrderselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job,poid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkOrderselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimesheetLaborselect
{
    webtype=1;
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
      NSDate *dateString1 = [dateFormat1 dateFromString:jobdate];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];

 
  
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimesheetLaborselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TSLJobNumber>%@</TSLJobNumber>\n"
                   "<TSLDate>%@</TSLDate>\n"
                   "</TimesheetLaborselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno,sqldate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimesheetLaborselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimesheetEquipmentselect
{
    webtype=2;
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString1 = [dateFormat1 dateFromString:jobdate];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimesheetEquipmentselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TSEqJobNumber>%@</TSEqJobNumber>\n"
                   "<TSEqDate>%@</TSEqDate>\n"
                   "</TimesheetEquipmentselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno,sqldate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimesheetEquipmentselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimesheetFleetselect
{
    webtype=3;
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString1 = [dateFormat1 dateFromString:jobdate];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimesheetFleetselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TSFlJobNumber>%@</TSFlJobNumber>\n"
                   "<TSFlDate>%@</TSFlDate>\n"
                   "</TimesheetFleetselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno,sqldate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimesheetFleetselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)TimesheetMaterialselect
{
    webtype=6;
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    NSArray*array=[_jobnumberbtnlbl.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString1 = [dateFormat1 dateFromString:jobdate];
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TimesheetMaterialselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<TSMTJobNumber>%@</TSMTJobNumber>\n"
                   "<TSMTDate>%@</TSMTDate>\n"
                   "</TimesheetMaterialselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",jobno,sqldate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TimesheetMaterialselect" forHTTPHeaderField:@"Soapaction"];
    
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
  [_timesheettable reloadData];
    [_popOverTableView reloadData];
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"TimesheetServiceselectResponse"])
    {
        _skillarray=[[NSMutableArray alloc]init];
        _skilldict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"SkillId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ForemanSelectResponse"])
    {_foremandict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"cemp_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TimeSheetPhasesSelectResponse"])
    {
        _phasedict=[[NSMutableDictionary alloc]init];
        _revphasedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PhaseName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PurchaseOrderselectResponse"])
    {
        _POdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"WorkOrderselectResponse"])
    {
        _WOdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"WorkNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TimeSheetSequenceSelectResponse"])
    {
        _sequcedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TimeSheetSequenceGeneralSelectResult"])
    {
        _sequcedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JobSequenceId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Jobtask"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"TimesheetLaborselectResponse"])
    {
        _timesheetarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLEntryID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLJobNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"TSLDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"TSLTimeIN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"TSLTimeOut"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLForemanId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"foremanname"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLEmployeeId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"employeename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLPhase"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"TSLService"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSLSequence"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"sequencename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TimesheetEquipmentselectResponse"])
    {
        _equmntarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqEntryID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqJobNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqTimeIN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqTimeOut"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqEquipmentId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmnentName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqPhase"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EqPhaseName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqService"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqSequence"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Eqsequencename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqPurchaseId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqWorkId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TSEqWorkId"])
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
       _jobmdl=[[jobsitemodel alloc]init];
        recordResults = FALSE;
       _jobmdl.jobid=[_soapResults integerValue];
       _soapResults = nil;
    }

    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
           _jobmdl.jobno=_soapResults;
        jobnumber=_soapResults;
        [_jobdict setObject:[NSString stringWithFormat:@"%d",_jobmdl.jobid] forKey: _jobmdl.jobno];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",jobnumber,_soapResults]];
        _jobmdl.jobname=_soapResults;
        [_newjobarray addObject:_jobmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillName"])
    {
      recordResults = FALSE;
        skillname=_soapResults;
        [_skillarray addObject:_soapResults];
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
        [_skilldict setObject:_soapResults forKey:skillname];
         _soapResults = nil;

    }
    if([elementName isEqualToString:@"name"])
    {
         recordResults = FALSE;
        formanname=_soapResults;
          _soapResults = nil;
    }
    if([elementName isEqualToString:@"cemp_id"])
    {
        recordResults = FALSE;
        [_foremandict setObject:_soapResults forKey:formanname];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        recordResults = FALSE;
        phaseid=_soapResults;
        _soapResults = nil;


    }
    
    if([elementName isEqualToString:@"PhaseName"])
    {
        recordResults = FALSE;
        
        [_phasedict setObject:phaseid forKey:_soapResults];
        [_revphasedict setObject:_soapResults forKey:phaseid];
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"PurchaseId"])
    {
        recordResults = FALSE;
        purchseid=_soapResults;
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
        [_POdict setObject:purchseid forKey:_soapResults];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WorkId"])
    {
        recordResults = FALSE;
        workid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WorkNumber"])
    {
        recordResults = FALSE;
        [_WOdict setObject:workid forKey:_soapResults];
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        recordResults = FALSE;
        jobsequceid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Jobtask"])
    {
        recordResults = FALSE;
        [_sequcedict setObject:jobsequceid forKey:_soapResults];
        _soapResults = nil;

    }

    if([elementName isEqualToString:@"TSLEntryID"])
    {
        recordResults = FALSE;
        _timesheetmdl=[[Timesheetmdl alloc]init];
        _timesheetmdl.entryid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"TSLJobNumber"])
    {
        recordResults = FALSE;
         _timesheetmdl.jobnumber=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"TSLDate"])
    {
        recordResults = FALSE;
        NSArray *array1=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[array1 objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _timesheetmdl.tsdate=myFormattedDate;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"TSLTimeIN"])
    {
        recordResults = FALSE;
        NSArray*timearray=[_soapResults componentsSeparatedByString:@"."];
        NSString*time1=[timearray objectAtIndex:0];
         _timesheetmdl.timein=time1;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"TSLTimeOut"])
    {
        recordResults = FALSE;
        NSArray*timearray=[_soapResults componentsSeparatedByString:@"."];
        NSString*time1=[timearray objectAtIndex:0];

         _timesheetmdl.timeout=time1;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSLForemanId"])
    {
        recordResults = FALSE;
         _timesheetmdl.foremanid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"foremanname"])
    {
        recordResults = FALSE;
         _timesheetmdl.foremanname=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"TSLEmployeeId"])
    {
        recordResults = FALSE;
         _timesheetmdl.employeeid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"employeename"])
    {
        recordResults = FALSE;
         _timesheetmdl.employeename=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"TSLPhase"])
    {
        recordResults = FALSE;
        
         _timesheetmdl.phase=[_revphasedict objectForKey:_soapResults];
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"TSLService"])
    {
        recordResults = FALSE;
         _timesheetmdl.jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSLSequence"])
    {
        recordResults = FALSE;
         _timesheetmdl.sequenceid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"sequencename"])
    {
        recordResults = FALSE;
         _timesheetmdl.sequencename=_soapResults;
        [_timesheetarray addObject:_timesheetmdl];
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"TSEqEntryID"])
    {
        
        recordResults = FALSE;
        _timesheetmdl=[[Timesheetmdl alloc]init];
        _timesheetmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqJobNumber"])
    {
        
        recordResults = FALSE;
        _timesheetmdl.jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqDate"])
    {
        
        recordResults = FALSE;
        NSArray *array1=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[array1 objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _timesheetmdl.tsdate=myFormattedDate;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqTimeIN"])
    {
        
        recordResults = FALSE;
        NSArray*timearray=[_soapResults componentsSeparatedByString:@"."];
        NSString*time1=[timearray objectAtIndex:0];
        _timesheetmdl.timein=time1;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqTimeOut"])
    {
        
        recordResults = FALSE;
        NSArray*timearray=[_soapResults componentsSeparatedByString:@"."];
        NSString*time1=[timearray objectAtIndex:0];
        _timesheetmdl.timeout=time1;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqEquipmentId"])
    {
        
        recordResults = FALSE;
        _timesheetmdl.equipmentid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EquipmnentName"])
    {
        
        recordResults = FALSE;
         _timesheetmdl.equipmentname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqPhase"])
    {
        
        recordResults = FALSE;
          _timesheetmdl.phase=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EqPhaseName"])
    {
        
        recordResults = FALSE;
              _timesheetmdl.phasename=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqService"])
    {
        
        recordResults = FALSE;
          _timesheetmdl.service=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqSequence"])
    {
        
        recordResults = FALSE;
         _timesheetmdl.sequenceid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Eqsequencename"])
    {
        
        recordResults = FALSE;
         _timesheetmdl.sequencename=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqPurchaseId"])
    {
        
        recordResults = FALSE;
         _timesheetmdl.purcseid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TSEqWorkId"])
    {
        
        recordResults = FALSE;
         _timesheetmdl.workid=_soapResults;
        [_equmntarray addObject:_timesheetmdl];
        _soapResults = nil;
    }
   
    
    
}
#pragma mark-picker method
-(void)dateChanged1{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
    _time1txtfld.text=currentTime;
 
    
}

- (IBAction)time2btn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged2) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_time2checkbtnlbl.frame
                             inView:self.view2
           permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                           animated:YES];
    

}
-(void)dateChanged2{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
    _time2txtfld.text=currentTime;
    
    
}

#pragma mark-Button Actions


- (IBAction)allemplysbtn:(id)sender {
    btnclck++;
    if (btnclck%2!=0) {
        [_allemplyescheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _foremancheckbtnlbl.enabled=NO;
    }
    
    else{
        [_allemplyescheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _foremancheckbtnlbl.enabled=YES;
    }
    
}

- (IBAction)foremanbtn:(id)sender {
    btnclck1++;
    if (btnclck1%2!=0) {
        [_foremancheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _allemplyescheckbtnlbl.enabled=NO;
        _foremanbtnlbl.enabled=YES;
        
    }
    
    else{
        [_foremancheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _allemplyescheckbtnlbl.enabled=YES;
        _foremanbtnlbl.enabled=NO;;
        
    }
    
}


- (IBAction)time1btn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged1) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_time1checkbtnlbl.frame
                                        inView:self.view1
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];
    
    
}

- (IBAction)formanselctn:(id)sender {
    poptype=3;
    [self createpopover];
    [self ForemanSelect];
}

- (IBAction)phase1btn:(id)sender {
    poptype=4;
    [self createpopover];
    [self TimeSheetPhasesSelect];
}

- (IBAction)sequence1btn:(id)sender {
    poptype=5;
    [self createpopover];
    if ([_servicebtnlbl.titleLabel.text isEqualToString:@"Scaffold"]) {
        
        [self TimeSheetSequenceSelect];
    }
    else if ([_servicebtnlbl.titleLabel.text isEqualToString:@"General"]) {
        
         [self TimeSheetSequenceGeneralSelect];
    }
    
}
- (IBAction)wo1btn:(id)sender {
    poptype=7;
    [self createpopover];
    [self WorkOrderselect];
    
}

- (IBAction)po1btn:(id)sender {
    poptype=6;
    [self createpopover];
    [self PurchaseOrderselect];

}

- (IBAction)tagnumber1btn:(id)sender {
}

- (IBAction)phase2btn:(id)sender {
    poptype=4;
    poptype2=1;
    [self createpopoverforview2];
    [self TimeSheetPhasesSelect];

}

- (IBAction)sequence2btn:(id)sender {
    poptype=5;
    poptype2=2;
    [self createpopoverforview2];
    if ([_servicebtnlbl.titleLabel.text isEqualToString:@"Scaffold"]) {
        
        [self TimeSheetSequenceSelect];
    }
    else if ([_servicebtnlbl.titleLabel.text isEqualToString:@"General"]) {
        
        [self TimeSheetSequenceGeneralSelect];
    }

}

- (IBAction)tagnumber2btn:(id)sender {
    
}
- (IBAction)wobt:(id)sender {
    poptype=7;
    poptype2=4;
    [self createpopoverforview2];
    [self WorkOrderselect];

    
}

- (IBAction)PO2btn:(id)sender {
    poptype=6;
    poptype2=3;
    [self createpopoverforview2];
    [self PurchaseOrderselect];
}

- (IBAction)applybtn:(id)sender {
   
}

- (IBAction)jobnumbrbtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)clsebtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)datebtn:(id)sender {
    [self createCalenderPopover];
    
}
- (IBAction)servicebtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self TimesheetServiceselect];
    
}


#pragma mark-Barbutton Actions

- (IBAction)laborbtn:(id)sender {
    barbtntype=1;
    newbarbutntype=1;
    [self TimesheetLaborselect];
        [_timesheettable reloadData];
    
    _allemplyescheckbtnlbl.hidden=NO;
    _allemployeeslbl.hidden=NO;
    _foremanbtnlbl.hidden=NO;
    _foremancheckbtnlbl.hidden=NO;
    _foremanlbl.hidden=NO;
    
    
    _view1.hidden=NO;
     _view2.hidden=YES;
    _labortableview.hidden=NO;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor whiteColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

    
}

- (IBAction)equpbtn:(id)sender {
      barbtntype=2;
    newbarbutntype=2;

    [self TimesheetEquipmentselect];

    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;

    [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor whiteColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

}

- (IBAction)fleetbtn:(id)sender {
       barbtntype=2;
    newbarbutntype=3;

     [_timesheettable reloadData];
       [self TimesheetFleetselect];
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;
    
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor whiteColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)tpfbtn:(id)sender {
       barbtntype=2;
    newbarbutntype=4;

     [_timesheettable reloadData];
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor whiteColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];



}

- (IBAction)tpebtn:(id)sender {
       barbtntype=2;
    newbarbutntype=5;

     [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;

    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor whiteColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)materialsbtn:(id)sender {
    barbtntype=2;
    newbarbutntype=6;

    [_timesheettable reloadData];
    
    [self TimesheetMaterialselect];
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;

    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor whiteColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

}

- (IBAction)consumblesbtn:(id)sender {
     barbtntype=2;
    newbarbutntype=7;

     [_timesheettable reloadData];
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor whiteColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)othrsbtn:(id)sender {
    barbtntype=4;
    newbarbutntype=8;

    [_timesheettable reloadData];

    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=NO;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor whiteColor];


}

@end
