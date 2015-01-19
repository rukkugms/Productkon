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
    _MPtotalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _Eqtotalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
      _othertotalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _mattitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _mantitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _matothertitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _eqreviewtitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _view1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _summarytitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _calmanpwrtable.layer.borderWidth = 2.0;
    _calmanpwrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _sumtable.layer.borderWidth = 2.0;
    _sumtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
     _matothertitleview.hidden=YES;
    _eqreviewtitleview.hidden=YES;
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
    btnclick=1;
    _Eqtotalview.hidden=YES;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    _totallabel.text=@"";
    _qtytotallabel.text=@"";
    _othertotalview.hidden=YES;
    _sttotal.text=@"";
    _OTtotal.text=@"";
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _matothertitleview.hidden=YES;
     _eqreviewtitleview.hidden=YES;
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
        _view1.hidden=YES;
        _mantitleview.hidden=NO;
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
        _view1.hidden=NO;
        _mantitleview.hidden=YES;
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
{ btnclick=1;
    //_qtytotallabel.text=@"";
   // _sttotal.text=@"";
   // _OTtotal.text=@"";
    _activityindctr.hidden=NO;
    [_activityindctr startAnimating];
     _Eqtotalview.hidden=YES;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    _summarybtn.enabled=YES;
    tooltype=1;
     _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _matothertitleview.hidden=YES;
    _summarytitleview.hidden=YES;
     _eqreviewtitleview.hidden=YES;
    _sumtable.hidden=YES;
    _othertotalview.hidden=YES;
    //[_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
     _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
    _MPtotalview.hidden=NO;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        [self EstimationManPowerReviewSelect];
         _view1.hidden=YES;
        _mantitleview.hidden=NO;
    }
    else
    {
 _view1.hidden=NO;
        _mantitleview.hidden=YES;
     [self CalenderManPowerSelect];
    }
}
- (IBAction)equipmentaction:(id)sender
{
    _activityindctr.hidden=NO;
    [_activityindctr startAnimating];
    btnclick=1;
   // _qtytotallabel.text=@"";
   // _sttotal.text=@"";
   // _OTtotal.text=@"";
    _MPtotalview.hidden=YES;
    _Eqtotalview.hidden=NO;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    tooltype=2;
    _summarybtn.enabled=YES;
    _othertotalview.hidden=YES;
     _view1.hidden=YES;
     _eqpmntbtn.tintColor=[UIColor whiteColor];
    _manpwrbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor blackColor];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _matothertitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        [self EstimationEquipmentReviewSelect];
        _eqreviewtitleview.hidden=NO;
         _mattitleview.hidden=YES;
    }
    else
    {
_eqreviewtitleview.hidden=YES;
         _mattitleview.hidden=NO;
    [self CalenderEquipmentSelect];
    }
   // [_calmanpwrtable reloadData];
}
- (IBAction)materialaction:(id)sender
{
    _activityindctr.hidden=NO;
    [_activityindctr startAnimating];
    btnclick=1;
    _MPtotalview.hidden=YES;
    _Eqtotalview.hidden=YES;
    //_qtytotallabel.text=@"";
    //_sttotal.text=@"";
    //_OTtotal.text=@"";
    _othertotalview.hidden=NO;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    tooltype=3;
     _view1.hidden=YES;
    _summarybtn.enabled=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor whiteColor];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _matothertitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    _eqreviewtitleview.hidden=YES;
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
    _activityindctr.hidden=NO;
    [_activityindctr startAnimating];
    
    //_qtytotallabel.text=@"";
    //_sttotal.text=@"";
   // _OTtotal.text=@"";
    _MPtotalview.hidden=YES;
    _Eqtotalview.hidden=YES;
    _othertotalview.hidden=YES;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    tooltype=4;
     _view1.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
     _materialbtn.tintColor=[UIColor blackColor];
     _summarybtn.tintColor=[UIColor whiteColor];
   
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _mattitleview.hidden=YES;
    _matothertitleview.hidden=YES;
    _summarytitleview.hidden=NO;
    _calmanpwrtable.hidden=YES;
    _sumtable.hidden=NO;
    _eqreviewtitleview.hidden=YES;
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        if (btnclick==1) {
        
    
        sum=0;
        _reviewsumarray=[[NSMutableArray alloc]init];
        _titlearray=[[NSMutableArray alloc]init];
        
        _totallabel.text=@"";
        [self SummaryManPowerSelect];
         //_summarybtn.enabled=NO;
        
         _summarybtn.tintColor=[UIColor whiteColor];
       // [self SummaryEquipmentSelect];
        //[self SummaryMaterialSelect];
        }
        else{
        
        
            
            
        }
         btnclick++;
    }
    else
    {
        
        sum=0;
        _totallabel.text=@"";
    [self  SummarySelect];
          //_summarybtn.enabled=NO;
         _summarybtn.tintColor=[UIColor whiteColor];
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
                 if ([_estimationstring isEqualToString:@"Estimationreview"]) {
                     [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                     cell=_calmaterialcell;
                    
                 }
                else
                {
                    [[NSBundle mainBundle]loadNibNamed:@"CalEqevnt" owner:self options:nil];
                    cell=_caleqcell;
                }
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
                _manqtylabel=(UILabel *)[cell viewWithTag:4];
                 _manstlabel=(UILabel *)[cell viewWithTag:5];
                 _manotlabel=(UILabel *)[cell viewWithTag:6];
                 _manstratelabel=(UILabel *)[cell viewWithTag:7];
                 _manotratelabel=(UILabel *)[cell viewWithTag:8];
                _mantotallabel=(UILabel *)[cell viewWithTag:9];
                 _typelabel=(UILabel *)[cell viewWithTag:10];
                  _phaselabel=(UILabel *)[cell viewWithTag:11];
                if ([_estimationstring isEqualToString:@"Estimationreview"]) {
                    NSArray*array=[manmdl.mandate componentsSeparatedByString:@"T"];
                    NSString*news=[array objectAtIndex:0];
                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
                    NSDate *dates = [dateFormat dateFromString:news];
                    [dateFormat setDateFormat:@"MM-dd-yyy"];
                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _manpdatelabel.text=myFormattedDate;
                    
                    _manqtylabel.text=[NSString stringWithFormat:@"%d",[manmdl.Qty integerValue]];
                   
                    NSInteger totst=([manmdl.ST integerValue ]*[manmdl.Qty integerValue]);
                    _manstlabel.text=[NSString stringWithFormat:@"%d",totst];
                    
                    NSInteger totot=([manmdl.OT integerValue ]*[manmdl.Qty integerValue]);
                    _manotlabel.text=[NSString stringWithFormat:@"%d",totot];
                    
                   
                    _manstratelabel.text=[NSString stringWithFormat:@"$%@",manmdl.STrate];
                   
                    _manotratelabel.text=[NSString stringWithFormat:@"$%@",manmdl.OTrate];
                    
                    double A1=([manmdl.ST doubleValue])*([manmdl.STrate doubleValue]);
                    double A2=([manmdl.OT doubleValue])*([manmdl.OTrate doubleValue]);
                    double B=A1+A2;
                    double total=B*([manmdl.Qty doubleValue]);
                    //NSLog(@"%.2f",total);
                    
                   
                    _mantotallabel.text=[NSString stringWithFormat:@"$%.2f",total];
                   
                    _typelabel.text=manmdl.mtype;
                  
                    _phaselabel.text=manmdl.phasename;

                }
                else
                {
//                    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//                    [dateFormat setDateFormat:@"yyyy-MM-dd"];
//                    NSDate *dates = [dateFormat dateFromString:_selecteddate];
//                    [dateFormat setDateFormat:@"MM-dd-yyy"];
//                    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
                    _manpdatelabel.text=[NSString stringWithFormat:@"%d",[manmdl.Qty integerValue]];
                    NSInteger totst=([manmdl.ST integerValue ]*[manmdl.Qty integerValue]);
                    _manqtylabel.text=[NSString stringWithFormat:@"%d",totst];
                     NSInteger totot=([manmdl.OT integerValue ]*[manmdl.Qty integerValue]);
                     _manstlabel.text=[NSString stringWithFormat:@"%d",totot];
                    _manotlabel.text=[NSString stringWithFormat:@"$%@",manmdl.STrate];
                _manstratelabel.text=[NSString stringWithFormat:@"$%@",manmdl.OTrate];
                    double A1=([manmdl.ST doubleValue])*([manmdl.STrate doubleValue]);
                    double A2=([manmdl.OT doubleValue])*([manmdl.OTrate doubleValue]);
                    double B=A1+A2;
                    double total=B*([manmdl.Qty doubleValue]);
                    //NSLog(@"%.2f",total);
                    _manotratelabel.text=[NSString stringWithFormat:@"$%.2f",total];
                    _mantotallabel.text=manmdl.mtype;
                      _typelabel.text=manmdl.phasename;
                    _phaselabel.text=manmdl.sequence;
                    
                }
                
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
                _otherqtylabel.text=[NSString stringWithFormat:@"%d",[othmdl.Qty integerValue]];
                _othertotallabel=(UILabel *)[cell viewWithTag:5];
                double B1=([othmdl.UnitCost doubleValue])*([othmdl.Qty doubleValue]);
                _othertotallabel.text=[NSString stringWithFormat:@"$%.2f",B1];
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
                    _EqJobtasklabel=(UILabel *)[cell viewWithTag:8];
                    _EqJobtasklabel.text=eqmdl.EqJobtask;
                }
                _Eqqtylabel=(UILabel *)[cell viewWithTag:4];
                _Eqqtylabel.text=[NSString stringWithFormat:@"%d",[eqmdl.Qty integerValue]];
                _Eqtotallabel=(UILabel *)[cell viewWithTag:5];
                 double B1=([eqmdl.UnitCost doubleValue])*([eqmdl.Qty doubleValue])*([eqmdl.EqST doubleValue]);
                _Eqtotallabel.text=[NSString stringWithFormat:@"$%.2f",B1];
                _Eqphaselabel=(UILabel *)[cell viewWithTag:6];
                _Eqphaselabel.text=eqmdl.eqphasename;
                _Eqhourslabel=(UILabel *)[cell viewWithTag:7];
                _Eqhourslabel.text=eqmdl.EqST;
                


                
            }
            
        
    
        }
    if (tableView==_sumtable) {
         //_totallabel.text=@"";
        if ([_estimationstring isEqualToString:@"Estimationreview"]) {
        _summarylabel=(UILabel *)[cell viewWithTag:1];
        _costlabel=(UILabel *)[cell viewWithTag:2];
        _summarylabel.text=[_titlearray objectAtIndex:indexPath.row];
        _costlabel.text=[NSString stringWithFormat:@"$%.2f",[[_reviewsumarray objectAtIndex:indexPath.row]doubleValue]];
                }
        else
        {
            
        
        //NSLog(@"%@",_summaryarray);
        NSArray*array=[[_summaryarray objectAtIndex:indexPath.row ] componentsSeparatedByString:@"$"];
    
        NSString*newtitile=[array objectAtIndex:0];
      NSString*newtitiles=[array objectAtIndex:1];
        // NSLog(@"%@",newtitiles);
        // NSLog(@"%@",newtitile);
        _summarylabel=(UILabel *)[cell viewWithTag:1];
            _costlabel=(UILabel *)[cell viewWithTag:2];
        _summarylabel.text=newtitile;
        _costlabel.text=[NSString stringWithFormat:@"%.2f",[newtitiles doubleValue]];
       
            
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
                   
                   "<CalenderManPowerSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<CalenderEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<CalenderOtherSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderOtherSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderOtherSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SummarySelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<start>%@</start>\n"
                   "</SummarySelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SummarySelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<EstimationManPowerReviewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<LeadId>%d</LeadId>\n"
                   "</EstimationManPowerReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationManPowerReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<EstimationEquipmentReviewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EstimationEquipmentReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationEquipmentReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<EstimationOtherReviewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EstimationOtherReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EstimationOtherReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SummaryManPowerSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SummaryManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SummaryEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SummaryEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SummaryMaterialSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "</SummaryMaterialSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SummaryMaterialSelect" forHTTPHeaderField:@"Soapaction"];
    
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
                   "<ManPowerReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</ManPowerReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ManPowerReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
                   "<EquipmentReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</EquipmentReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/EquipmentReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
                   "<OtherReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<LeadId>%d</LeadId>\n"
                   "</OtherReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,[_estid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/OtherReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
        _activityindctr.hidden=YES;
        [_activityindctr stopAnimating];
    }
    
 
   // [_calmanpwrtable reloadData];
    if (tooltype==4) {
        [self calculatereviewsum];
        [_sumtable reloadData];
        
        _activityindctr.hidden=YES;
        [_activityindctr stopAnimating];

    }
    
    switch (tooltype) {
        case 5:
            [self calculatereviewsum];
             [_sumtable reloadData];
            _activityindctr.hidden=YES;
            [_activityindctr stopAnimating];


            break;

        case 7:
            [self SummaryMaterialSelect];
            _activityindctr.hidden=YES;
            [_activityindctr stopAnimating];

            break;

        case 6:
            [self SummaryEquipmentSelect];
            _activityindctr.hidden=YES;
            [_activityindctr stopAnimating];

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
    if([elementName isEqualToString:@"EstimationManPowerReviewSelectResponse"])
    { _totallabel.text=@"";
        _manpwrarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ManPowerReviewSearchResponse"])
    {_totallabel.text=@"";
        _manpwrarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"JobTask"])
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
    {   _totallabel.text=@"";
        _eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"EstimationEquipmentReviewSelectResponse"])
    {   _totallabel.text=@"";
        _eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EquipmentReviewSearchResponse"])
    {_totallabel.text=@"";
        _eqpmntarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"EqST"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EqJobtask"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }



    if([elementName isEqualToString:@"CalenderOtherSelectResponse"])
    {_totallabel.text=@"";
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EstimationOtherReviewSelectResponse"])
    {_totallabel.text=@"";
        _otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherReviewSearchResponse"])
    {_totallabel.text=@"";
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
    {  _totallabel.text=@"";
        _summaryarray=[[NSMutableArray alloc]init];
     
      
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
    if([elementName isEqualToString:@"JobTask"])
    {
        recordResults = FALSE;
        _manpwr.sequence=_soapresults;
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
        
    }
    
    if([elementName isEqualToString:@"EqPhaseName"])
    {
        recordResults = FALSE;
        
        _eqmdl.eqphasename=_soapresults;
        //[_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"EqJobtask"])
    {
        recordResults = FALSE;
        
        _eqmdl.EqJobtask=_soapresults;
        //[_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }

    if([elementName isEqualToString:@"EqST"])
    {
        recordResults = FALSE;
        
        _eqmdl.EqST=_soapresults;
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
        [_otherarray addObject:_othrmdl];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"OtherPhaseName"])
    {
        recordResults = FALSE;
        
        _othrmdl.otherphasename=_soapresults;
        //[_otherarray addObject:_othrmdl];
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
        
        
        [_reviewsumarray addObject:[NSString stringWithFormat:@"%.2f",[_soapresults doubleValue]]];
      
       
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
        sum=([[_totalarray objectAtIndex:i]doubleValue])+sum;
        //NSLog(@"%.2f",sum);
        _totallabel.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
    }
    [self calculateqty];
}

-(void)calculatereviewsum
{
    
    if ([_estimationstring isEqualToString:@"Estimationreview"]) {
          _totalarray=[[NSMutableArray alloc]init];
        for (int i=0; i<[_reviewsumarray count]; i++) {
            
            [_totalarray addObject:[_reviewsumarray objectAtIndex:i]];
           // NSLog(@"%@",_totalarray);
            if (i==[_reviewsumarray count]-1) {
                
                for ( int x=0; x<[_reviewsumarray count]; x++)
                {
                    sum=([[_totalarray objectAtIndex:x]doubleValue])+sum;
                    //NSLog(@"%.2f",sum);
                    _totallabel.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
                }
                
                sum=0;
                
            }
        }
        
    }
    else
    {
         _totalarray=[[NSMutableArray alloc]init];
       
        for (int i=0; i<[_summaryarray count]; i++) {
            NSArray*array=[[_summaryarray objectAtIndex:i] componentsSeparatedByString:@" "];
            NSString*newtitile=[array objectAtIndex:0];
            NSString*newtitiles=[array objectAtIndex:1];
            //NSLog(@"%@",newtitiles);
            if ([newtitile isEqualToString:@"Direct"]||[newtitile isEqualToString:@"Indirect"]) {
                
            }
            else
            {
           
                
            [_totalarray addObject:[newtitiles stringByReplacingOccurrencesOfString:@"$" withString:@""]];
            //NSLog(@"%@",_totalarray);
            }
            
            if (i==[_summaryarray count]-1) {
                for ( int x=0; x<[_totalarray count]; x++)
                {
                    sum=([[_totalarray objectAtIndex:x]doubleValue])+sum;
                    //NSLog(@"%.2f",sum);
                    _totallabel.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
                }
                
                
                sum=0;
            
            
            
            }
        }
    }
    
}


-(void)newcalcuations{
     _totalarray=[[NSMutableArray alloc]init];
    _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    
   _qtyarray=[[NSMutableArray alloc]init];
    switch (tooltype) {
        case 1:
            for (int i=0; i<[_manpwrarray count]; i++) {
             Detaileventmanpwr *manmdl=(Detaileventmanpwr *)[_manpwrarray objectAtIndex:i];
            double A1=([manmdl.ST doubleValue])*([manmdl.STrate doubleValue]);
            double A2=([manmdl.OT doubleValue])*([manmdl.OTrate doubleValue]);
            double B=A1+A2;
            double total=B*([manmdl.Qty doubleValue]);
           // NSLog(@"%.2f",total);
            [_qtyarray addObject:[NSString stringWithFormat:@"%d",[manmdl.Qty integerValue]]];
            [_starray addObject:[NSString stringWithFormat:@"%d",[manmdl.ST integerValue]*[manmdl.Qty integerValue]]];
                 [_otarray addObject:[NSString stringWithFormat:@"%d",[manmdl.OT integerValue]*[manmdl.Qty integerValue]]];
           [_totalarray addObject:[NSString stringWithFormat:@"%.2f",total]];
           // NSLog(@"%@",_totalarray);
            
            if (i==[_manpwrarray count]-1) {
                [self calculatesum];
                sum=0;
                qty=0;
                totalst=0;
                totalOT=0;
            }
            }

            break;
        case 2:
              for (int i=0; i<[_eqpmntarray count]; i++) {
             Eqeventmdl *eqmdl=(Eqeventmdl *)[_eqpmntarray objectAtIndex:i];
            double B1=([eqmdl.UnitCost doubleValue])*([eqmdl.Qty doubleValue])*([eqmdl.EqST doubleValue]);
            [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B1]];
            [_qtyarray addObject:[NSString stringWithFormat:@"%d",[eqmdl.Qty integerValue]]];
            [_starray addObject:[NSString stringWithFormat:@"%d",[eqmdl.EqST integerValue]]];
           // NSLog(@"%@",_totalarray);
            
            if (i==[_eqpmntarray count]-1) {
                [self calculatesum];
                sum=0;
                qty=0;
                totalst=0;
            
                
            }
              }

            break;
        case 3:
            for (int i=0; i<[_otherarray count]; i++) {
                
                OthereventMaodel *othmdl=(OthereventMaodel *)[_otherarray objectAtIndex:i];
                double B1=([othmdl.UnitCost doubleValue])*([othmdl.Qty doubleValue]);
                [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B1]];
                [_qtyarray addObject:[NSString stringWithFormat:@"%d",[othmdl.Qty integerValue]]];
                
               // NSLog(@"%@",_totalarray);
                
                if (i==[_otherarray count]-1) {
                    
                    
                    [self calculatesum];
                    sum=0;
                     qty=0;
                }
                
            }

            break;

            
        default:
            break;
    }
   
}
-(void)calculateqty
{
    int i;
     if (tooltype==1)        {
    for (i=0; i<[_qtyarray count]; i++)
    {
        qty=([[_qtyarray objectAtIndex:i]integerValue])+qty;
       // NSLog(@"%d",qty);
       
            _qtytotallabel.text=[NSString stringWithFormat:@"%d",qty]  ;
    }
         [self calculatest];
     }
    
      else if (tooltype==2)
        {
            for (i=0; i<[_qtyarray count]; i++)
            {
                qty=([[_qtyarray objectAtIndex:i]integerValue])+qty;
               // NSLog(@"%d",qty);
                
                _eqqtytotal.text=[NSString stringWithFormat:@"%d",qty]  ;
            }
             [self calculatest];

        }
      else if (tooltype==3)
      {
          for (i=0; i<[_qtyarray count]; i++)
          {
              qty=([[_qtyarray objectAtIndex:i]integerValue])+qty;
             // NSLog(@"%d",qty);
              
              _othertotal.text=[NSString stringWithFormat:@"%d",qty]  ;
          }
 
      }
    
}
-(void)calculatest
{
    int i;
    if (tooltype==1)        {
    for (i=0; i<[_starray count]; i++)
    {
        totalst=([[_starray objectAtIndex:i]integerValue])+totalst;
        //NSLog(@"%d",totalst);
      
        _sttotal.text=[NSString stringWithFormat:@"%d",totalst]  ;
        
    }
    [self calculateot];
   
    }
    else if (tooltype==2)
    {
        for (i=0; i<[_starray count]; i++)
        {
            totalst=([[_starray objectAtIndex:i]integerValue])+totalst;
           // NSLog(@"%d",totalst);
            
            _eqhourstotal.text=[NSString stringWithFormat:@"%d",totalst]  ;
        }
    }
}

-(void)calculateot
{
    int i;
    for (i=0; i<[_otarray count]; i++)
    {
        totalOT=([[_otarray objectAtIndex:i]integerValue])+totalOT;
        //NSLog(@"%d",totalOT);
        if (tooltype==1)        {
        _OTtotal.text=[NSString stringWithFormat:@"%d",totalOT]  ;
        }
    }
    
}



#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _totallabel.text=@"";
    _searchstring=_searchbar.text;
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
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
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
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
     _qtyarray=[[NSMutableArray alloc]init];
     _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
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
