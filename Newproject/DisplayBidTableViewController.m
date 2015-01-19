//
//  DisplayBidTableViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DisplayBidTableViewController.h"

@interface DisplayBidTableViewController ()

@end

@implementation DisplayBidTableViewController

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
  
    _manpowertitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _manpowertable.layer.borderWidth = 2.0;
    _manpowertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _Othertitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _Othertable.layer.borderWidth = 2.0;
    _Othertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _summarytitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _SummaryTable.layer.borderWidth = 2.0;
    _SummaryTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;

    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
   
   tooltype=1;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.manpowertable.tableHeaderView=_searchbar;
    //self.Othertable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;
  _navitem.title=[NSString stringWithFormat:@"Bid Review-%@",_bidid];
     tooltype=1;
    sum=0;
    totqty=0;
    TotOT=0;
    TotST=0;
    _ST.hidden=NO;
    _OT.hidden=NO;
    _stlabel.hidden=NO;
    _otlabel.hidden=NO;
      _qtylabel.hidden=NO;
    _totqtylabel.hidden=NO;
    
    
    _otherqtlabel.hidden=YES;
    _othertotqtylbl.hidden=YES;
    _othercostlabel.hidden=YES;
   _othertotcostlabl.hidden=YES;
    _sumlabl.hidden=NO;
    _starray=[[NSMutableArray alloc]init];
    
    _otarray=[[NSMutableArray alloc]init];
    _totalarray=[[NSMutableArray alloc]init];
    _quantityarray=[[NSMutableArray alloc]init];
    [self BidManPowerReviewSelect];
    
    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
}


- (IBAction)colsethispage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.manpowertable.tableHeaderView=_searchbar;
    //self.Othertable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    _totalarray=[[NSMutableArray alloc]init];
    _quantityarray=[[NSMutableArray alloc]init];
    _starray=[[NSMutableArray alloc]init];

    _otarray=[[NSMutableArray alloc]init];
    _otherqtlabel.hidden=YES;
    _othertotqtylbl.hidden=YES;
    _othercostlabel.hidden=YES;
    _othertotcostlabl.hidden=YES;
    _sumdisplaylabel.hidden=NO;
    _sumlabl.hidden=NO;
    sum=0;
    totqty=0;
    TotOT=0;
    TotST=0;
    _ST.hidden=NO;
    _OT.hidden=NO;
    _stlabel.hidden=NO;
    _otlabel.hidden=NO;
     _qtylabel.hidden=NO;
    _totqtylabel.hidden=NO;
    [self BidManPowerReviewSelect];

    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];

}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //self.manpowertable.tableHeaderView=_searchbar;
    self.Othertable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    _otherqtlabel.hidden=NO;
    _othertotqtylbl.hidden=NO;
    _othercostlabel.hidden=NO;
    _othertotcostlabl.hidden=NO;
     _sumdisplaylabel.hidden=YES;
    _sumlabl.hidden=YES;
    _ST.hidden=YES;
    _OT.hidden=YES;
    _stlabel.hidden=YES;
    _otlabel.hidden=YES;
    _qtylabel.hidden=YES;
    _totqtylabel.hidden=YES;
    sum=0;
    totqty=0;
    _totalarray=[[NSMutableArray alloc]init];
_quantityarray=[[NSMutableArray alloc]init];
    [self BidEquipmentSelect];
    _manpowertable.hidden=YES;
     _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor whiteColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
    
}
- (IBAction)materialaction:(id)sender
{ _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //self.manpowertable.tableHeaderView=_searchbar;
    self.Othertable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    
    _otherqtlabel.hidden=NO;
    _othertotqtylbl.hidden=NO;
    _othercostlabel.hidden=NO;
    _othertotcostlabl.hidden=NO;
    _sumdisplaylabel.hidden=YES;
    _sumlabl.hidden=YES;
    tooltype=3;
    sum=0;
    totqty=0;
    _ST.hidden=YES;
    _OT.hidden=YES;
    _stlabel.hidden=YES;
    _otlabel.hidden=YES;
    _qtylabel.hidden=YES;
    _totqtylabel.hidden=YES;
    _totalarray=[[NSMutableArray alloc]init];
_quantityarray=[[NSMutableArray alloc]init];
    [self BidMaterialReviewselect];
    _manpowertable.hidden=YES;
    _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor whiteColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
   
}
- (IBAction)otheraction:(id)sender
{ _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //self.manpowertable.tableHeaderView=_searchbar;
    self.Othertable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

    _sumlabl.hidden=YES;
    _otherqtlabel.hidden=NO;
    _othertotqtylbl.hidden=NO;
    _othercostlabel.hidden=NO;
    _othertotcostlabl.hidden=NO;
    _sumdisplaylabel.hidden=YES;
    tooltype=4;
    sum=0;
    totqty=0;
    _ST.hidden=YES;
    _OT.hidden=YES;
    _stlabel.hidden=YES;
    _otlabel.hidden=YES;
    _qtylabel.hidden=YES;
    _totqtylabel.hidden=YES;
    _totalarray=[[NSMutableArray alloc]init];
_quantityarray=[[NSMutableArray alloc]init];
    [self BidOtherReviewselect];
    _manpowertable.hidden=YES;
     _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor whiteColor];
    _summarybtn.tintColor=[UIColor blackColor];
    
}
- (IBAction)summaryaction:(id)sender
{
    tooltype=5;
    [self BidReviewInsert];
    _ST.hidden=YES;
    _OT.hidden=YES;
    _stlabel.hidden=YES;
    _otlabel.hidden=YES;
    _qtylabel.hidden=YES;
    _totqtylabel.hidden=YES;
    _sumdisplaylabel.hidden=YES;
    _totalarray=[[NSMutableArray alloc]init];
    _sumlabl.hidden=YES;
    _otherqtlabel.hidden=YES;
    _othertotqtylbl.hidden=YES;
    _othercostlabel.hidden=NO;
    _othertotcostlabl.hidden=NO;
    _manpowertable.hidden=YES;
    _manpowertitle.hidden=YES;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=NO;
    _summarytitle.hidden=NO;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor whiteColor];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_manpowertable) {
        return [_manpowerarray count];
    }
    if (tableView==_Othertable)
    {
        if (tooltype==2) {
            return [_Equipmentarray count];
        }
        if(tooltype==3)
        {
            return [_materialarray count];
        }
        if(tooltype==4)
        {
            return [_Otherarray count];
        }
    }
    if (tableView==_SummaryTable)
    {
        return [_summaryarray count];
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
        
        if (tableView==_manpowertable) {
           
                [[NSBundle mainBundle]loadNibNamed:@"Tblebidcell" owner:self options:nil];
                cell=_manpowercell;
            
        }
        if (tableView==_Othertable) {
            
            [[NSBundle mainBundle]loadNibNamed:@"Bidreviewcell" owner:self options:nil];
            cell=_othercell;
            
        }
        if (tableView==_SummaryTable) {
            
            [[NSBundle mainBundle]loadNibNamed:@"sumbidcell" owner:self options:nil];
            cell=_sumcell;
            
        }


         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    }
    
        if (tableView==_manpowertable) {
            
            
            Reviebidmdl *manmdl=(Reviebidmdl *)[_manpowerarray objectAtIndex:indexPath.row];
            
            _Mestilabel=(UILabel *)[cell viewWithTag:1];
            _Mestilabel.text=manmdl.Estimation;
            _Mitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Mitemcodelabel.text=manmdl.ItemCode;
            _Mdesclabel=(UILabel *)[cell viewWithTag:3];
            _Mdesclabel.text=manmdl.mDescription;
            _Mqtylabel=(UILabel *)[cell viewWithTag:4];
            _Mqtylabel.text=[NSString stringWithFormat:@"%d",[manmdl.TotalQty integerValue]];
            
            _Mstlabel=(UILabel *)[cell viewWithTag:5];
            _Mstlabel.text=manmdl.TotalST;
            
            _Motlabel=(UILabel *)[cell viewWithTag:6];
            _Motlabel.text=manmdl.TotalOT;
            _Mstratelabel=(UILabel *)[cell viewWithTag:7];
            _Mstratelabel.text=[NSString stringWithFormat:@"$%.2f",[manmdl.TotalSTRate doubleValue]];
            
            
            _Motratelabel=(UILabel *)[cell viewWithTag:8];
            _Motratelabel.text=[NSString stringWithFormat:@"$%.2f",[manmdl.TotalOTRate doubleValue]];
            _Mtotlabel=(UILabel *)[cell viewWithTag:9];
            double A1=([manmdl.TotalST doubleValue])*([manmdl.TotalSTRate doubleValue]);
            double A2=([manmdl.TotalOT doubleValue])*([manmdl.TotalOTRate doubleValue]);
            double B=A1+A2;
            //double total=B*([manmdl.TotalQty doubleValue]);
            NSLog(@"%.2f",B);

            //NSInteger x=[manmdl.TotalUnitCost integerValue]*[manmdl.TotalQty integerValue];
            _Mtotlabel.text=[NSString stringWithFormat:@"$%.2f",B];
            _Mtypelabel=(UILabel *)[cell viewWithTag:10];
            _Mtypelabel.text=manmdl.BidMType;

        }
    
    if (tableView==_Othertable) {
        
        if (tooltype==2) {
            
        
                Reviebidmdl *eqmdl=(Reviebidmdl *)[_Equipmentarray objectAtIndex:indexPath.row];
                
                _Oestilabel=(UILabel *)[cell viewWithTag:1];
                _Oestilabel.text=eqmdl.Estimation;
                _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
                _Oitemcodelabel.text=eqmdl.ItemCode;
                _Odesclabel=(UILabel *)[cell viewWithTag:3];
                _Odesclabel.text=eqmdl.mDescription;
                _Oqtylabel=(UILabel *)[cell viewWithTag:4];
                _Oqtylabel.text=[NSString stringWithFormat:@"%d",[eqmdl.TotalQty integerValue]];
                
                _Ototallabel=(UILabel *)[cell viewWithTag:5];
                double e=[eqmdl.TotalUnitCost doubleValue]*[eqmdl.TotalQty doubleValue];
                _Ototallabel.text=[NSString stringWithFormat:@"$%.2f",e];
                
                _Otypelabel=(UILabel *)[cell viewWithTag:6];
                _Otypelabel.text=eqmdl.BidMType;
               

                }
        if (tooltype==3) {
            
            
            Reviebidmdl *mtmdl=(Reviebidmdl *)[_materialarray objectAtIndex:indexPath.row];
            
            _Oestilabel=(UILabel *)[cell viewWithTag:1];
            _Oestilabel.text=mtmdl.Estimation;
            _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Oitemcodelabel.text=mtmdl.ItemCode;
            _Odesclabel=(UILabel *)[cell viewWithTag:3];
            _Odesclabel.text=mtmdl.mDescription;
            _Oqtylabel=(UILabel *)[cell viewWithTag:4];
            _Oqtylabel.text=[NSString stringWithFormat:@"%d",[mtmdl.TotalQty integerValue]];
            
            _Ototallabel=(UILabel *)[cell viewWithTag:5];
            double e=[mtmdl.TotalUnitCost doubleValue]*[mtmdl.TotalQty doubleValue];
            _Ototallabel.text=[NSString stringWithFormat:@"$%.2f",e];
            
            _Otypelabel=(UILabel *)[cell viewWithTag:6];
            _Otypelabel.text=mtmdl.BidMType;
            
            
        }
        if (tooltype==4) {
            
            
            Reviebidmdl *othmdl=(Reviebidmdl *)[_Otherarray objectAtIndex:indexPath.row];
            
            _Oestilabel=(UILabel *)[cell viewWithTag:1];
            _Oestilabel.text=othmdl.Estimation;
            _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Oitemcodelabel.text=othmdl.ItemCode;
            _Odesclabel=(UILabel *)[cell viewWithTag:3];
            _Odesclabel.text=othmdl.mDescription;
            _Oqtylabel=(UILabel *)[cell viewWithTag:4];
            _Oqtylabel.text=[NSString stringWithFormat:@"%d",[othmdl.TotalQty integerValue]];
            
            _Ototallabel=(UILabel *)[cell viewWithTag:5];
            double e=[othmdl.TotalUnitCost doubleValue]*[othmdl.TotalQty doubleValue];
            _Ototallabel.text=[NSString stringWithFormat:@"$%.2f",e];
            
            _Otypelabel=(UILabel *)[cell viewWithTag:6];
            _Otypelabel.text=othmdl.BidMType;
            
            
        }


       
    
    }
    if (tableView==_SummaryTable)
    {
        Reviebidmdl *summdl=(Reviebidmdl *)[_summaryarray objectAtIndex:indexPath.row];
        
        _namelabel=(UILabel *)[cell viewWithTag:1];
        _namelabel.text=summdl.name;
        _costlabel=(UILabel *)[cell viewWithTag:2];
        _costlabel.text=summdl.cost;
 
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_manpowertable||tableView==_Othertable||tableView==_SummaryTable)
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
-(void)BidManPowerReviewSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidManPowerReviewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidManPowerReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidManPowerReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidEquipmentSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidMaterialReviewselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidMaterialReviewselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidMaterialReviewselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidMaterialReviewselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidOtherReviewselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidOtherReviewselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidOtherReviewselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidOtherReviewselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidmanpowerSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<BidmanpowerSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<BidId>%@</BidId>\n"
                   "</BidmanpowerSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidmanpowerSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidEquipmentReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<BidEquipmentReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<BidId>%@</BidId>\n"
                   "</BidEquipmentReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidEquipmentReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidMaterialReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<BidMaterialReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<BidId>%@</BidId>\n"
                   "</BidMaterialReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidMaterialReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidOtherReviewSearch
{
    // webtype=1;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   "<BidOtherReviewSearch xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "<BidId>%@</BidId>\n"
                   "</BidOtherReviewSearch>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring,_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidOtherReviewSearch" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidReviewCostselect
{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidReviewCostselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</BidReviewCostselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidReviewCostselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidReviewInsert
{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidReviewInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidReviewInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidReviewInsert" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlparser)
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    if (tooltype==1) {
        
        [self newcalcuations];
    [_manpowertable reloadData];
    }
    if (tooltype==2||tooltype==3||tooltype==4) {
         [self newcalcuations];
        [_Othertable reloadData];
    }
    if (webtype==1) {
        [self BidReviewCostselect];
       
        
    }
//    if (webtype==2) {
//        [self newcalcuations];
//        [_SummaryTable reloadData];
//        webtype=0;
//    }
    
    
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if (webtype==2)
    {
        [self newcalcuations];
        [_SummaryTable reloadData];
        webtype=0;
    }
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"BidManPowerReviewSelectResponse"])
    {_manpowerarray=[[NSMutableArray alloc]init];
        _sumdisplaylabel.text=@"";
        _qtylabel.text=@"";
        _stlabel.text=@"";
        _otlabel.text=@"";
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidmanpowerSearchResponse"])
    {_manpowerarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"BidTableId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EstimationId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Estimation"])
    {
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

    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalUnitCost"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalST"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"TotalOT"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalSTRate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalOTRate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"TotalSTOTSum"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidEquipmentSelectResponse"])
    {_Equipmentarray=[[NSMutableArray alloc]init];
        _sumdisplaylabel.text=@"";
        _qtylabel.text=@"";
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidEquipmentReviewSearchResponse"])
    {_Equipmentarray=[[NSMutableArray alloc]init];
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    

    if([elementName isEqualToString:@"EqEstimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"eqItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EqDescription"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQTotal"])
    {        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EqType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"EQBidMType"])
    {
        if(!_soapresults)
    {
        _soapresults = [[NSMutableString alloc] init];
    }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidMaterialReviewselectResponse"])
    {_materialarray=[[NSMutableArray alloc]init];
        _sumdisplaylabel.text=@"";
        _qtylabel.text=@"";
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidMaterialReviewSearchResponse"])
    {_materialarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    
    if([elementName isEqualToString:@"MtEstimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MtItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtDescription"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtTotal"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtBidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidOtherReviewselectResponse"])
    {_Otherarray=[[NSMutableArray alloc]init];
        _sumdisplaylabel.text=@"";
        _qtylabel.text=@"";
               if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidOtherReviewSearchResponse"])
    {_Otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"OtherEstimation"])
    {
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
    
    if([elementName isEqualToString:@"OtherDescription"])
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
    
    if([elementName isEqualToString:@"OtherTotal"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherBidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidReviewCostselectResponse"])
    {_summaryarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidReviewId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Name"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Cost"])
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
    if([elementName isEqualToString:@"BidManPowerReviewSelectResponse"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"BidTableId"])
    {
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        recordResults = FALSE;
        
        _reviewmdl.BidTableId=_soapresults;
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"BidId"])
    {
        recordResults = FALSE;
        
        _reviewmdl.BidId=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"EstimationId"])
    {
        recordResults = FALSE;
        
        _reviewmdl.EstimationId=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Estimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"ItemCode"])
    {
        recordResults = FALSE;
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"TotalUnitCost"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"TotalQty"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"TotalST"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalST=_soapresults;
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"TotalOT"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalOT=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"TotalSTRate"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalSTRate=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"TotalOTRate"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalOTRate=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"TotalSTOTSum"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalSTOTSum=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"BidMType"])
    {
        recordResults = FALSE;
        
        _reviewmdl.BidMType=_soapresults;
        [_manpowerarray addObject:_reviewmdl];
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"EqEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"eqItemCode"])
    {
        recordResults = FALSE;
        
       
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"EqDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EQQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EQTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EqType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"EQBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_Equipmentarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }


    if([elementName isEqualToString:@"MtEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtItemCode"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_materialarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"OtherEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherItemCode"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_Otherarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"BidReviewId"])
    {
        recordResults = FALSE;
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.bidreviewid=_soapresults;
        
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"Name"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.name=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"Cost"])
    {
        
        recordResults = FALSE;
        
        
        _reviewmdl.cost=_soapresults;
        [_summaryarray addObject:_reviewmdl];
        _soapresults = nil;
    }
    
    


    

}
#pragma mark-calculations
-(void)calculatecost
{
    
    int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]doubleValue])+sum;
        NSLog(@"%.2f",sum);
        if (tooltype==2||tooltype==2||tooltype==3||tooltype==4||tooltype==5) {
            _othertotcostlabl.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
        }
        else
        {
        _sumdisplaylabel.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
        }
    }
    
}

-(void)calculatesum
{
    
    int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]doubleValue])+sum;
        NSLog(@"%.2f",sum);
        if (tooltype==2||tooltype==2||tooltype==3||tooltype==4||tooltype==5) {
            _othertotcostlabl.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
        }
        else
        {
            _sumdisplaylabel.text=[NSString stringWithFormat:@"$%.2f",sum]  ;
        }

    }
    [self calculateqty];
}
-(void)calculateqty
{
    int i;
    for (i=0; i<[_quantityarray count]; i++)
    {
        totqty=([[_quantityarray objectAtIndex:i]integerValue])+totqty;
        NSLog(@"%d",totqty);
         if (tooltype==2||tooltype==2||tooltype==3||tooltype==4||tooltype==5)
         {
             _othertotqtylbl.text=[NSString stringWithFormat:@"%d",totqty]  ;
         }
        else
        {
        _qtylabel.text=[NSString stringWithFormat:@"%d",totqty]  ;
        }
    }

}
-(void)calculatest
{
    int i;
    for (i=0; i<[_starray count]; i++)
    {
        TotST=([[_starray objectAtIndex:i]integerValue])+TotST;
        NSLog(@"%d",TotST);
        _stlabel.text=[NSString stringWithFormat:@"%d",TotST]  ;
    }
    [self calculatesum];
    
}
-(void)calculateot
{
    int i;
    for (i=0; i<[_otarray count]; i++)
    {
        TotOT=([[_otarray objectAtIndex:i]integerValue])+TotOT;
        NSLog(@"%d",TotOT);
        _otlabel.text=[NSString stringWithFormat:@"%d",TotOT]  ;
    }
    [self calculatest];
    
}



-(void)newcalcuations{
    
    switch (tooltype) {
        case 1:
            for (int i=0; i<[_manpowerarray count]; i++) {
                Reviebidmdl *manmdl=(Reviebidmdl *)[_manpowerarray objectAtIndex:i];
               
                double A1=([manmdl.TotalST doubleValue])*([manmdl.TotalSTRate doubleValue]);
                double A2=([manmdl.TotalOT doubleValue])*([manmdl.TotalOTRate doubleValue]);
                double B=A1+A2;
               // double total=B*([manmdl.TotalQty doubleValue]);
                NSLog(@"%.2f",B);
                NSInteger qty=[manmdl.TotalQty integerValue];
                [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B]];
                [_quantityarray addObject:[NSString stringWithFormat:@"%d",qty]];
                [_starray addObject:[NSString stringWithFormat:@"%d",[manmdl.TotalST integerValue]]];
                 [_otarray addObject:[NSString stringWithFormat:@"%d",[manmdl.TotalOT integerValue]]];
                NSLog(@"%@",_totalarray);
                
                if (i==[_manpowerarray count]-1) {
                    [self calculateot];
                    sum=0;
                    totqty=0;
                    TotOT=0;
                    TotST=0;
                }
            }
            
            break;
        case 2:
            for (int i=0; i<[_Equipmentarray count]; i++) {
                Reviebidmdl *eqmdl=(Reviebidmdl *)[_Equipmentarray objectAtIndex:i];
                double B1=([eqmdl.TotalUnitCost doubleValue])*([eqmdl.TotalQty doubleValue]);
                [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B1]];
                NSLog(@"%@",_totalarray);
                 NSInteger qty=[eqmdl.TotalQty integerValue];
                [_quantityarray addObject:[NSString stringWithFormat:@"%d",qty]];

                if (i==[_Equipmentarray count]-1) {
                    [self calculatesum];
                    sum=0;
                    totqty=0;
                    
                }
            }
            
            break;
        case 3:
            for (int i=0; i<[_materialarray count]; i++) {
                
                Reviebidmdl *mtmdl=(Reviebidmdl *)[_materialarray objectAtIndex:i];
                double B1=([mtmdl.TotalQty doubleValue])*([mtmdl.TotalUnitCost doubleValue]);
                [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B1]];
                NSLog(@"%@",_totalarray);
                NSInteger qty=[mtmdl.TotalQty integerValue];
                [_quantityarray addObject:[NSString stringWithFormat:@"%d",qty]];
                if (i==[_materialarray count]-1) {
                    
                    
                    [self calculatesum];
                    sum=0;
                     totqty=0;
                }
                
            }
            
            break;
            
        case 4:
            for (int i=0; i<[_Otherarray count]; i++) {
                
                Reviebidmdl *othmdl=(Reviebidmdl *)[_Otherarray objectAtIndex:i];
                double B1=([othmdl.TotalQty doubleValue])*([othmdl.TotalUnitCost doubleValue]);
                [_totalarray addObject:[NSString stringWithFormat:@"%.2f",B1]];
                NSLog(@"%@",_totalarray);
                NSInteger qty=[othmdl.TotalQty integerValue];
                [_quantityarray addObject:[NSString stringWithFormat:@"%d",qty]];

                if (i==[_Otherarray count]-1) {
                    
                    
                    [self calculatesum];
                    sum=0;
                     totqty=0;
                }
                
            }
            
            break;
        case 5:
            for (int i=0; i<[_summaryarray count]; i++) {
                
                Reviebidmdl *smdl=(Reviebidmdl *)[_summaryarray objectAtIndex:i];
               [_totalarray addObject:[NSString stringWithFormat:@"%.2f",[smdl.cost doubleValue]]];
                NSLog(@"%@",_totalarray);
               
                
                if (i==[_summaryarray count]-1) {
                    
                    
                    [self calculatecost];
                    sum=0;
                    
                }
                
            }
            
            break;


        default:
            break;
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _sumdisplaylabel.text=@"";
     _qtylabel.text=@"";
     _stlabel.text=@"";
     _otlabel.text=@"";
    _searchstring=_searchbar.text;
    _totalarray=[[NSMutableArray alloc]init];
    _quantityarray=[[NSMutableArray alloc]init];
    _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    if (tooltype==1) {
        [self BidmanpowerSearch];
        
    }
    else if(tooltype==2)
    {
        [self BidEquipmentReviewSearch];
    }
    else if(tooltype==3)
    {
        [self BidMaterialReviewSearch];
    }
    else if(tooltype==4)
    {
        [self BidOtherReviewSearch];
    }
    
    
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    _totalarray=[[NSMutableArray alloc]init];
    _quantityarray=[[NSMutableArray alloc]init];
    _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    if (tooltype==1) {
        [self BidManPowerReviewSelect];
    }
    if(tooltype==2)
    {
        [self BidEquipmentSelect];
    }
    if(tooltype==3)
    {
        [self BidMaterialReviewselect];
    }
    if (tooltype==4) {
        [self BidOtherReviewselect];
    }
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    _totalarray=[[NSMutableArray alloc]init];
    _quantityarray=[[NSMutableArray alloc]init];
    _starray=[[NSMutableArray alloc]init];
    _otarray=[[NSMutableArray alloc]init];
    if ([_searchbar.text length]==0) {
        if (tooltype==1) {
            [self BidManPowerReviewSelect];
        }
        if (tooltype==2) {
            [self BidEquipmentSelect];
        }
        
        if (tooltype==3) {
            [self BidMaterialReviewselect];
        }
        if (tooltype==4) {
            [self BidOtherReviewselect];
        }

    }
    
}


@end
