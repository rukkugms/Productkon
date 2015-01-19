//
//  EstimationViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EstimationViewController.h"


@interface EstimationViewController ()

@end

@implementation EstimationViewController

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
       self.addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _estmntable.layer.borderWidth = 2.0;
    _estmntable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;

    _listarray=[[NSMutableArray alloc]initWithObjects:@"Estimation Calendar",@"Estimation Review",@"Man Power Chart" ,nil];
    [self WorkTypeSelect];
    
  
  

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self EstimateSelect];
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark-Popover
//-(void)createpopover{
//    UIViewController* popoverContent = [[UIViewController alloc]
//                                        init];
//    
//    UIView* popoverView = [[UIView alloc]
//                           initWithFrame:CGRectMake(0, 0, 190, 70)];
//    
//    popoverView.backgroundColor = [UIColor whiteColor];
//    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 70)];
//    
//    _popOverTableView.delegate=(id)self;
//    _popOverTableView.dataSource=(id)self;
//    _popOverTableView.rowHeight= 35;
//    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//    
//    
//    // CGRect rect = frame;
//    [popoverView addSubview:_popOverTableView];
//    popoverContent.view = popoverView;
//    
//    //resize the popover view shown
//    //in the current view to the view's size
//    popoverContent.contentSizeForViewInPopover = CGSizeMake(190, 72);
//    
//    //create a popover controller
//    
//    self.popOverController = [[UIPopoverController alloc]
//                              initWithContentViewController:popoverContent];
//    
//    //
//    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
//    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
//    
//    
//    [self.popOverController presentPopoverFromRect:_disclurbtnlbl.frame
//                                                     inView:self.estmntable
//                                      permittedArrowDirections:UIPopoverArrowDirectionLeft
//                                                    animated:YES];
//
//    
//    
////    switch (poptype) {
////        case 1:
////            [self.popOverController presentPopoverFromRect:_leadcustmrbtnlbl.frame
////                                                    inView:self.addview
////                                  permittedArrowDirections:UIPopoverArrowDirectionUp
////                                                  animated:YES];
////
////            break;
////        case 2:
////            [self.popOverController presentPopoverFromRect:_planbtnlbl.frame
////                                                    inView:self.addview
////                                  permittedArrowDirections:UIPopoverArrowDirectionUp
////                                                  animated:YES];
////            
////            break;
////
////        default:
////            break;
////    }
//    
//    
//    
//}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_listarray count];
//        switch (poptype) {
//            case 1:
//                return [_leadcustmrarry count];
//                break;
//            case 2:
//                return [_planarray count];
//                break;
//                
//
//            default:
//                break;
//        }
    }
    else if (tableView==_estmntable) {
        return [_Estimationarray count];

    }
    
        
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_estmntable) {
            [[NSBundle mainBundle]loadNibNamed:@"Emtncell" owner:self options:nil];
            cell=_estmtncell;
            
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    if (tableView==_popOverTableView) {
              cell.textLabel.text=[_listarray objectAtIndex:indexPath.row];
//        switch (poptype) {
//            case 1:
//                cell.textLabel.text=[_leadcustmrarry objectAtIndex:indexPath.row];
//                break;
//            case 2:
//                   cell.textLabel.text=[_planarray objectAtIndex:indexPath.row];
//             
//                break;
//
//            default:
//                break;
//        }
    }
if (tableView==_estmntable) {
    
    ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
    _estlbl=(UILabel *)[cell viewWithTag:1];
    _estlbl.text=estmdl.EstimationId;
    _cmpnylbl=(UILabel *)[cell viewWithTag:2];
    _cmpnylbl.text=estmdl.Name;
    UITapGestureRecognizer *tapGesture1 =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap1:)];
    [_cmpnylbl addGestureRecognizer:tapGesture1];

    _planidlabel=(UILabel *)[cell viewWithTag:3];
    if ([estmdl.PlanId isEqualToString:@"NP"]) {
       _planidlabel.text=estmdl.PlanId;
        _planidlabel.textColor=[UIColor blackColor];
        _planidlabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    }
    else
    {
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap:)];
    [_planidlabel addGestureRecognizer:tapGesture];
    _planidlabel.text=estmdl.PlanId;
}
    
    _startdatelabel=(UILabel *)[cell viewWithTag:4];
    NSArray*array=[estmdl.startdate componentsSeparatedByString:@"T"];
    NSString*news=[array objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates = [dateFormat dateFromString:news];
    [dateFormat setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
    _startdatelabel.text=myFormattedDate;
    _enddatelabel=(UILabel *)[cell viewWithTag:5];
    NSArray*array1=[estmdl.enddate componentsSeparatedByString:@"T"];
    NSString*news1=[array1 objectAtIndex:0];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates1 = [dateFormat1 dateFromString:news1];
    [dateFormat1 setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate1 = [dateFormat1 stringFromDate:dates1];

    _enddatelabel.text=myFormattedDate1;
    
    
    _manhrlbl=(UILabel *)[cell viewWithTag:6];
    _manhrlbl.text=[NSString stringWithFormat:@"%d",[estmdl.manhr integerValue]];
    UITapGestureRecognizer *tapGesture2 =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap2:)];
    [_manhrlbl addGestureRecognizer:tapGesture2];

    _eqphrlbl=(UILabel *)[cell viewWithTag:7];
    _eqphrlbl.text=[NSString stringWithFormat:@"%d",[estmdl.eqhr integerValue]];
    UITapGestureRecognizer *tapGesture3 =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTap3:)];
    [_eqphrlbl addGestureRecognizer:tapGesture3];

    

    
}
    
    
    
       return cell;
}


#pragma mark-tableview datasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     ModlEstimation *estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:disindex];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:estmdl.estimateid forKey:@"Estimationid"];
    [defaults synchronize];

    if (tableView==_popOverTableView) {
        if(indexPath.row==0)
        {
            _calendartype=1;
            self.DPVCtrl=[DPCalendarTestViewController new];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:1 forKey:@"Estcal"];
            [defaults synchronize];
            
            [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_DPVCtrl
                                                                                       animated:YES completion:NULL];
                
            }];

        }
        if(indexPath.row==1)
        {  self.calctrl=[[CalEventDetailViewController alloc]initWithNibName:@"CalEventDetailViewController" bundle:nil];
            //}
            _calctrl.estimationstring=@"Estimationreview";
            _calctrl.estid=estmdl.estimateid;
            _calctrl.estimationnumber=estmdl.EstimationId;
            [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_calctrl
                                                                                       animated:YES completion:NULL];
                
            }];

        }
        if(indexPath.row==2)
        {
              _calendartype=2;
                       
            self.mpVCtrl=[DPCalendarmnViewController new];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:2 forKey:@"Estcal"];
            [defaults synchronize];
            [self dismissViewControllerAnimated:YES completion:^{   [self presentViewController:_mpVCtrl
                                                                                       animated:YES completion:NULL];
                
            }];
        }


       
        
        [self.popOverController dismissPopoverAnimated:YES];

    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_estmntable)
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



-(void)labelTap:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
   
//    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
//    {
//        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
//        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
//        if (indexPath)
//            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
//        
//        return;
//    }
    
//    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
//    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
   
 ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
    
    self.PlanVCtrl=[[PlanningViewController alloc]initWithNibName:@"PlanningViewController" bundle:nil];
    _PlanVCtrl.modalPresentationStyle=UIModalPresentationCustom;
    _PlanVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
 
    _PlanVCtrl.plntype=1;
    _PlanVCtrl.fromestmn=1;
    NSLog(@"%d",_PlanVCtrl.fromestmn);
    _PlanVCtrl.Estmnplan=estmdl.PlanId;
    [self presentViewController:_PlanVCtrl
                       animated:YES completion:NULL];
    
}
-(void)labelTap1:(UITapGestureRecognizer *)sender{
    
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    
    //    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
    //    {
    //        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    //        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    //        if (indexPath)
    //            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
    //
    //        return;
    //    }
    
    //    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
    //    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    
    ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
    NSLog(@"texIndexPath%@",estmdl.CId);
      NSLog(@"texIndexPath%@",estmdl.leadid);
    if ([estmdl.leadid isEqualToString:@"0"]) {
        
        
    }
    else{
        _leadctrl=[[LeadsViewController alloc]initWithNibName:@"LeadsViewController" bundle:nil];
        _leadctrl.frmplan=1;
        _leadctrl.planorganztn=estmdl.Name;
        [self presentViewController:_leadctrl animated:YES completion:nil];
    }
    if ([estmdl.CId isEqualToString:@"0"]) {
        
        
    }
    else{
        _custctrl=[[NewCustmrViewController alloc]initWithNibName:@"NewCustmrViewController" bundle:nil];
        _custctrl.frmplan=1;
        _custctrl.planorganztn=estmdl.Name;
        [self presentViewController:_custctrl animated:YES completion:nil];
        
    }

    
}
-(void)labelTap2:(UITapGestureRecognizer *)sender{
    _seperator=1;
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
     planpath=indexPath.row;
    //    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
    //    {
    //        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    //        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    //        if (indexPath)
    //            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
    //
    //        return;
    //    }
    
    //    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
    //    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    [self GetSkillforEstimation];
  
    
}
-(void)labelTap3:(UITapGestureRecognizer *)sender{
    _seperator=2;
    CGPoint location = [sender locationInView:self.view];
    CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
     planpath=indexPath.row;
    //    if (CGRectContainsPoint([self.view convertRect:self.estmntable.frame fromView:self.estmntable.superview], location))
    //    {
    //        CGPoint locationInTableview = [self.estmntable convertPoint:location fromView:self.view];
    //        NSIndexPath *indexPath = [self.estmntable indexPathForRowAtPoint:locationInTableview];
    //        if (indexPath)
    //            [self tableView:self.estmntable didSelectRowAtIndexPath:indexPath];
    //
    //        return;
    //    }
    
    //    CGPoint rootViewPoint = [label.superview convertPoint:center toView:self.estmntable];
    //    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",indexPath.row);
    [self GetSkillforEstimation];
//    ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:indexPath.row];
//    
//    _detailctrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
//    _detailctrl.fromestmn=1;
//    _detailctrl.Estmnhr=estmdl.eqhr;
//      _detailctrl.Estmnpln=estmdl.PlanId;
//    [self presentViewController:_detailctrl animated:YES completion:nil];
    
}


#pragma mark-Webservice
-(void)SelectAllCustomer{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCustomer xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllLeads{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllLeads xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllLeads" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimateSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimateSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</EstimateSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimateSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GetSkillforEstimation{
    recordResults = FALSE;
    NSString *soapMessage;
    ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:planpath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetSkillforEstimation xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "<ServiceId>%d</ServiceId>\n"
                   "</GetSkillforEstimation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",estmdl.PlanId,[estmdl.skill integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GetSkillforEstimation" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)EstimateInsert{
    recordResults = FALSE;
    
    NSString *ledid;
    NSString *custid;
  
    
    if (leadtuch%2)
    {
        ledid=[_leaddict objectForKey:_leadcustmrbtnlbl.titleLabel.text];
    }
    else
    {
        ledid=0;
       
    }
    if(custtuch%2)
    {
        custid=[_custmrdict objectForKey:_leadcustmrbtnlbl.titleLabel.text];

            }
    else
    {
        custid=0;
        
        
    }

    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimateInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<leadid>%d</leadid>\n"
                   "<CId>%d</CId>\n"
                   "<EstimationId>%@</EstimationId>\n"
                   "<SkillId>%d</SkillId>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Name>%@</Name>\n"
                   "<FoldID>%d</FoldID>\n"
                   "</EstimateInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",ledid,custid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimateInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationPlanSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationPlanSelect xmlns=\"http://ios.kontract360.com/\">\n"
                  " <customername>%@</customername>\n"
                   "</EstimationPlanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_leadcustmrbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationPlanSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EstimationWorkTypeSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<EstimationWorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<planid>%@</planid>\n"
                   "</EstimationWorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planbtnlbl.titleLabel.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"testUSA.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationWorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)WorkTypeSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<WorkTypeSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "</WorkTypeSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/WorkTypeSelect" forHTTPHeaderField:@"Soapaction"];
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
    [_estmntable reloadData];
        
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
        if([elementName isEqualToString:@"EstimateSelectResponse"])
    {_Estimationarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EstimateId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Markup_id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EstimationId"])
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
    if([elementName isEqualToString:@"PlanId"])
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
    
    if([elementName isEqualToString:@"FoldID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Startdate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EndDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManPowerHrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentHrs"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"EstimationPlanSelectResponse"])
    {
        _planarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"planid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"leadid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"WorkTypeSelectResult"])
    {
        _typelistarray=[[NSMutableArray alloc]init];
        _typelistdict=[[NSMutableDictionary alloc]init];
        _revtypelistarray=[[NSMutableDictionary alloc]init];
        
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
    if([elementName isEqualToString:@"WorkType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EstimationWorkTypeSelectResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PlanWorkType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"GetSkillforEstimationResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PSItemCode"])
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
    
    if([elementName isEqualToString:@"EstimateId"])
    {
        _mdlestmtn=[[ModlEstimation alloc]init];
        
        recordResults = FALSE;
        _mdlestmtn.estimateid=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"Markup_id"])
    {
        
        recordResults = FALSE;
       // _mdlestmtn.leadid=_soapResults;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.CId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EstimationId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.EstimationId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.skill=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.PlanId=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
         _mdlestmtn.Name=_soapResults;
        
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"FoldID"])
    {
        
        recordResults = FALSE;
        _mdlestmtn.foldid=_soapResults;
        
       
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Startdate"])
    {
        
        recordResults = FALSE;
        _mdlestmtn.startdate=_soapResults;
        
              _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EndDate"])
    {
        
        recordResults = FALSE;
        
        _mdlestmtn.enddate=_soapResults;
        //[_Estimationarray addObject:_mdlestmtn];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"leadid"])
    {
        
        recordResults = FALSE;
        
        _mdlestmtn.leadid=_soapResults;
        [_Estimationarray addObject:_mdlestmtn];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"ManPowerHrs"])
    {
        
        recordResults = FALSE;
        
        _mdlestmtn.manhr=_soapResults;
       // [_Estimationarray addObject:_mdlestmtn];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"EquipmentHrs"])
    {
        
        recordResults = FALSE;
        
        _mdlestmtn.eqhr=_soapResults;
        //[_Estimationarray addObject:_mdlestmtn];
        _soapResults = nil;
        
    }


    
    if([elementName isEqualToString:@"planid"])
    {
        
       recordResults = FALSE;
        [_planarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        recordResults = FALSE;
        typestg=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"WorkType"])
    {
        
        recordResults = FALSE;
        [_typelistarray addObject:_soapResults];
        [_typelistdict setObject:typestg forKey:_soapResults];
        [_revtypelistarray setObject:_soapResults forKey:typestg];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"PlanWorkType"])
    {
        recordResults = FALSE;
        [_wrktypebtnlbl setTitle:[_revtypelistarray objectForKey:_soapResults] forState:UIControlStateNormal];
            _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"PSItemCode"])
    {
        recordResults = FALSE;
        ModlEstimation*estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:planpath];
        
        _detailctrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
        _detailctrl.fromestmn=1;
        if (_seperator==1) {
            _detailctrl.Estmnhr=estmdl.manhr;
        }
        else if (_seperator==2) {
            _detailctrl.Estmnhr=estmdl.eqhr;
        }

        _detailctrl.Estmnpln=[estmdl.PlanId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        _detailctrl.Estmngencode=_soapResults;
        [self presentViewController:_detailctrl animated:YES completion:nil];
        _soapResults = nil;
        
    }
    



}
#pragma mark-Uibutton Actions

- (IBAction)leadcustmrbtb:(id)sender {
    poptype=1;
   // [self createpopover];
    
}

- (IBAction)planbtn:(id)sender {
    poptype=2;
    //[self createpopover];
    [self EstimationPlanSelect];
   

}

- (IBAction)wrktypebtn:(id)sender {
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
    _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.estmntable];
    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    ModlEstimation *estmdl=(ModlEstimation *)[_Estimationarray objectAtIndex:textFieldIndexPath.row];
    NSLog(@"%@",estmdl.leadid);
    if ( ![estmdl.leadid isEqualToString:@"0"]) {
         [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _custmrchckbtn.enabled=NO;
        _leadcustmlbl.text=@"Lead";
        [_leadcustmrbtnlbl setTitle:estmdl.Name forState:UIControlStateNormal];
    }
   
   else if (![estmdl.CId isEqualToString:@"0"]) {
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _leadchckbtnlbl.enabled=NO;
        _leadcustmlbl.text=@"Customer";

        [_leadcustmrbtnlbl setTitle:estmdl.Name forState:UIControlStateNormal];
    }

    
    [_planbtnlbl setTitle:estmdl.PlanId forState:UIControlStateNormal];
   // [_wrktypebtnlbl setTitle:estmdl.PlanId forState:UIControlStateNormal];
    
    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
    _leadcustmrbtnlbl.enabled=NO;
         [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
       [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
      [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
       [_planbtnlbl setTitle:@"Select"forState:UIControlStateNormal];
    [_wrktypebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    
}

- (IBAction)disclurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 170, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 170, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 36;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(170, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    self.popOverController.popoverContentSize=CGSizeMake(170.0f,100.0f);
    self.popOverController=_popOverController;
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.estmntable];
    NSIndexPath *textFieldIndexPath = [self.estmntable indexPathForRowAtPoint:rootViewPoint];
    disindex=textFieldIndexPath.row;
    [self.popOverController presentPopoverFromRect:_disclurbtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

    
   // [self createpopover];
}

- (IBAction)addclsebtn:(id)sender {
      _addview.hidden=YES;
}

- (IBAction)leadchckbtn:(id)sender {
    leadtuch++;
    if (leadtuch%2) {
        
        [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _custmrchckbtn.enabled=NO;
          _leadcustmrbtnlbl.enabled=YES;
        _leadcustmlbl.text=@"Lead";
        [self SelectAllLeads];
    }
    
    else{
         [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_leadchckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
         _custmrchckbtn.enabled=YES;
        
        
        
    }

}
- (IBAction)custmrchck:(id)sender {
    custtuch++;
    if (custtuch%2) {
        
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
         _leadchckbtnlbl.enabled=NO;
         _leadcustmrbtnlbl.enabled=YES;
        _leadcustmlbl.text=@"Customer";
        [self SelectAllCustomer];
    }
    
    else{
         [_leadcustmrbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_custmrchckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
          _leadchckbtnlbl.enabled=YES;
    }

}
@end
