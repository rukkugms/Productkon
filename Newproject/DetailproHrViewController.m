//
//  DetailproHrViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailproHrViewController.h"

@interface DetailproHrViewController ()

@end

@implementation DetailproHrViewController

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
  
       _w4detailview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _detailsaddview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    _w4detailview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    _paymentdetailview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

    _dcmntdetailview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _detailsaddview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

_editview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _detailsaddview.hidden=NO;;
     _detailbtnlbl.tintColor=[UIColor whiteColor];
    _detailstablview.layer.borderWidth = 2.0;
    _detailstablview.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _detailstabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
   _documentlisttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _doctabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _documentlisttable.layer.borderWidth=3.0f;
      _maritalarray=[[NSMutableArray alloc]initWithObjects:@"SINGLE",@"MARRIED",@"DIVORCED", nil];
    _maritalkeyarray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    _maritaldict=[[NSMutableDictionary alloc]initWithObjects:_maritalarray forKeys:_maritalkeyarray];
    _payementtypearray=[[NSMutableArray alloc]initWithObjects:@"Check",@"Direct Deposit",@"Paysource Card", nil];
     _maritalkeyarray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    _paymenttypedict=[[NSMutableDictionary alloc]initWithObjects:_payementtypearray forKeys:_maritalkeyarray];
_revpaymnttypedict =[[NSMutableDictionary alloc]initWithObjects:_maritalkeyarray forKeys:_payementtypearray];
    _revmaritaldict=[[NSMutableDictionary alloc]initWithObjects:_maritalkeyarray forKeys:_maritalarray];
    _imgview.layer.borderWidth = 2.0;
    _imgview.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;

    // Do any additional setup after loading the view from its nib.
     imagechecker=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self Statusselect];
    _montharray=[[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC",nil];
    _remontharray=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    _remonthdict=[[NSMutableDictionary alloc]initWithObjects:_montharray forKeys:_remontharray];

    _previewimg.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = (id)self;
    [_previewimg addGestureRecognizer:pgr];
    

}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView==_detailstablview)
    {
         return [_requirmntarray count];
    }
    if(tableView==_documentlisttable)
    {
        return [_docmntdict count];
    }
    if (tableView==_popOverTableView) {
        if (poptype==1) {
              return [_maritalarray count];
        }
      
        if (poptype==2) {
            return [_payementtypearray count];
        }
        if (poptype==3) {
            return [_statusdict count];
        }
        if (poptype==4) {
            return [_vendordict count];
        }
        if (poptype==10) {
            return [_statedict count];
        }

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
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

        if(tableView==_detailstablview)
        {
            [[NSBundle mainBundle]loadNibNamed:@"proHRDetailcell" owner:self options:nil];
            cell=_detailscell;
        }
        if(tableView==_documentlisttable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"customdoccell" owner:self options:nil];
            cell=_doccell;
        }
    
    if (tableView==_popOverTableView) {
        NSArray*array=[_statusdict allKeys];
        NSArray*vendrarray=[_vendordict allKeys];
        NSArray*statearry=[_statedict allKeys];
        if (poptype==1) {
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
            cell.textLabel.text=[_maritalarray objectAtIndex:indexPath.row];

            
                    }
        
        if (poptype==2) {
            
            
            cell.textLabel.text=[_payementtypearray objectAtIndex:indexPath.row];

                   }
        if (poptype==3) {
            cell.textLabel.text=[array objectAtIndex:indexPath.row];
        }
        
         if (poptype==4) {
             cell.textLabel.text=[vendrarray objectAtIndex:indexPath.row];
         }
        if (poptype==10) {
            cell.textLabel.text=[statearry objectAtIndex:indexPath.row];
        }

           }
    }
    if(tableView==_documentlisttable){
        NSArray*namearry=[_docmntdict allKeys];
        _docnamelbl=(UILabel *)[cell viewWithTag:1];
        _docnamelbl.text=[namearry objectAtIndex:indexPath.row];
           button=(UIButton *)[cell viewWithTag:4];
        
        
    }
    if(tableView==_detailstablview){
        Appreqmdl *appreqmdl=(Appreqmdl *)[_requirmntarray objectAtIndex:indexPath.row];
        _requirementlabel=(UILabel*)[cell viewWithTag:1];
        _requirementlabel.text=appreqmdl.reqname;
        _statuslabel=(UILabel*)[cell viewWithTag:2];
        _statuslabel.text=[_restatusdict objectForKey:appreqmdl.status];
        _expirylabel=(UILabel*)[cell viewWithTag:3];
        
        NSArray*arry1=[[NSArray alloc]init];
        arry1=[appreqmdl.expdate componentsSeparatedByString:@"/" ];
        NSString *yr=[arry1 objectAtIndex:2];
        
        NSString *mon=[_remonthdict objectForKey:[arry1 objectAtIndex:0]];
        _expirylabel.text=[NSString stringWithFormat:@"%@ %@",mon,yr];

        //_expirylabel.text=appreqmdl.expdate;
        _verificationlabel=(UILabel*)[cell viewWithTag:4];
        _verificationlabel.text=appreqmdl.verifictnstatus;
        
        _namevendorlbl=(UILabel*)[cell viewWithTag:5];
        _namevendorlbl.text=appreqmdl.vendorname;
        
        
        
    }
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView){
          NSArray*array=[_statusdict allKeys];
        NSArray*vendrarray=[_vendordict allKeys];
           NSArray*statearry=[_statedict allKeys];
         if (poptype==1) {
        
        //_maritalbtn.titleLabel.text=[_maritalarray objectAtIndex:indexPath.row];
             [ _maritalbtn  setTitle:[_maritalarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

             
         }
        
        if (poptype==2) {
            
            
           // _paymenttypebtn.titleLabel.text=[_payementtypearray objectAtIndex:indexPath.row];
            [_paymenttypebtn  setTitle:[_payementtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
            switch (indexPath.row) {
                case 0:
                    _instnname.enabled=NO;
                    _Accuntnumbr.enabled=NO;
                    _typesegmntlbl.enabled=NO;
                    _rontgnumbr.enabled=NO;
                    _citytxt.enabled=NO;
                    _statelbl.enabled=NO;
                    _cardnumbtxtfld.enabled=NO;
                    _cardroutdno.enabled=NO;
                    _expbtn.enabled=NO;
                    break;
                case 1:
                    _instnname.enabled=YES;
                    _Accuntnumbr.enabled=YES;
                    _typesegmntlbl.enabled=YES;
                    _rontgnumbr.enabled=YES;
                    _citytxt.enabled=YES;
                    _statelbl.enabled=YES;
                    _cardnumbtxtfld.enabled=NO;
                    _cardroutdno.enabled=NO;
                    _expbtn.enabled=NO;
                    break;

                case 2:
                    _instnname.enabled=NO;
                    _Accuntnumbr.enabled=NO;
                    _typesegmntlbl.enabled=NO;
                    _rontgnumbr.enabled=NO;
                    _citytxt.enabled=NO;
                    _statelbl.enabled=NO;
                    _cardnumbtxtfld.enabled=YES;
                    _cardroutdno.enabled=YES;
                    _expbtn.enabled=YES;
                    break;

                    
                default:
                    break;
            }
            
        }
        if (poptype==3) {
               [_statuslbl  setTitle:[array objectAtIndex:indexPath.row] forState:UIControlStateNormal];
          
        }
        if (poptype==4) {
            [_vendrnamebtnlbl  setTitle:[vendrarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
        }
        if (poptype==10) {
            [_statelbl  setTitle:[statearry objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
        }

        [self.popOverController dismissPopoverAnimated:YES];

    }
        
        
    
    
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_detailstablview||tableView==_documentlisttable)
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

#pragma mark-Webservice

-(void)UpdateW4{
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    NSInteger martid=[[_revmaritaldict objectForKey:_maritalbtn.titleLabel.text]integerValue];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateW4 xmlns=\"http://ios.kontract360.com/\">\n"
                   "<appid>%d</appid>\n"
                   "<dependent>%d</dependent>\n"
                   "<mart>%d</mart>\n"
                   "</UpdateW4>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid,[_Dependentstexffld.text integerValue],martid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateW4" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateDirectDeposit{
    
    recordResults=FALSE;
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    NSLog(@"%@",[_revpaymnttypedict objectForKey:_paymenttypebtn.titleLabel.text]);
    NSInteger paymnt=[[_revpaymnttypedict objectForKey:_paymenttypebtn.titleLabel.text ]integerValue];
    NSInteger type = 0;

    if (_typesegmntlbl.selectedSegmentIndex==0) {
        type=1;
        
    }
    else{
        type=2;
    }
    
    NSString *date1 =_expbtn.titleLabel.text;
    NSLog(@"s%@",date1);
    if ([date1 isEqualToString:@"Select Date"]) {
         date1 =@"01/01/1900";
        
    }

    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:date1];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    dateString = [dateFormat2 stringFromDate:dates];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateDirectDeposit xmlns=\"http://ios.kontract360.com/\">\n"
                   "<appid>%d</appid>\n"
                   "<payment>%d</payment>\n"
                   "<fname>%@</fname>\n"
                   "<fac>%@</fac>\n"
                   "<type1>%d</type1>\n"
                   "<froute>%@</froute>\n"
                   "<card>%@</card>\n"
                   "<croute>%@</croute>\n"
                   "<exp>%@</exp>\n"
                   "</UpdateDirectDeposit>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid,paymnt,_instnname.text,_Accuntnumbr.text,type,_rontgnumbr.text,_cardnumbtxtfld.text,_cardroutdno.text,dateString];
        NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateDirectDeposit" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UploadHRDocsImage{
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    
    NSString *imagename;
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_documentnametextfld.text];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadHRDocsImage xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<appid>%d</appid>\n"
                   "<doctitle>%@</doctitle>\n"
                   "</UploadHRDocsImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,empdmdl.applicantid,_documentnametextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadHRDocsImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectHRDocs{
    newwebtype=2;
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectHRDocs xmlns=\"http://ios.kontract360.com/\">\n"
              
                   "<appid>%d</appid>\n"
                  "</SelectHRDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectHRDocs" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Applicantrequirementselect{
    newwebtype=1;
    recordResults=FALSE;
    NSString *soapMessage;
    
    NSLog(@"array%@",[_Applicantarray objectAtIndex:_path]);
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Applicantrequirementselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "<Applicant_Id>%d</Applicant_Id>\n"
                   "</Applicantrequirementselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Applicantrequirementselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Statusselect{
   
    newwebtype=3;
    recordResults=FALSE;
    NSString *soapMessage;
    
   
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Statusselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                
                   "</Statusselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Statusselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ReqVendorselect{
    newwebtype=4;

    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ReqVendorselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   
                   "</ReqVendorselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ReqVendorselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ApplicantReqirement2Update{
   
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat: @"MM/dd/yyyy"];
    
 
    NSDate *dateString1 = [dateFormat1 dateFromString:_detalexpbtnlbl.titleLabel.text];
    
    NSLog(@"date%@",_detalexpbtnlbl.titleLabel.text);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"YYYY-MM-dd"];
    NSString* sqldate=[dateFormat2 stringFromDate:dateString1];
    
    recordResults=FALSE;
    NSString *soapMessage;
    Appreqmdl *appreqmdl=(Appreqmdl *)[_requirmntarray objectAtIndex:btnindex];
    
     Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    
    NSString*vendorid;
    
    if ([_vendrnamebtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        vendorid=@"0";
    }
  
    else{
        vendorid=[_vendordict objectForKey:_vendrnamebtnlbl.titleLabel.text];
    }
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ApplicantReqirement2Update xmlns=\"http://ios.kontract360.com/\">\n"
                   "<EntryId>%d</EntryId>\n"
                   "<Applicant_Id>%d</Applicant_Id>\n"
               
                   "<Requirement_Name>%@</Requirement_Name>\n"
                   "<expir_date>%@</expir_date>\n"
                   "<status>%d</status>\n"
                   "<ARVendorId>%@</ARVendorId>\n"
                   "<verification_status>%d</verification_status>\n"
                   "</ApplicantReqirement2Update>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[appreqmdl.entryid integerValue ],empdmdl.applicantid,appreqmdl.reqname,sqldate,[[_statusdict objectForKey:_statuslbl.titleLabel.text]integerValue ],vendorid,1];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ApplicantReqirement2Update" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Stateselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Stateselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Stateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Stateselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)PaymentTypeselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
      Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PaymentTypeselect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<applicant_id>%d</applicant_id>\n"
                   "</PaymentTypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PaymentTypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)W4select{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:_path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<W4select xmlns=\"http://ios.kontract360.com/\">\n"
                   "<applicant_id>%d</applicant_id>\n"
                   "</W4select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/W4select" forHTTPHeaderField:@"Soapaction"];
    
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
    
    
    
        if (newwebtype==1) {
        
        // [self Statusselect];
        [self ReqVendorselect];
          [_detailstablview reloadData];
        
        //newwebtype=0;
    }
    if (newwebtype==4) {
          [_detailstablview reloadData];
       
    }

          if (newwebtype==2) {
       [_documentlisttable reloadData];
        newwebtype=0;
    }
     [_documentlisttable reloadData];
     //[_detailstablview reloadData];
  [_popOverTableView reloadData];
    
    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectHRDocsResult"])
    {
        _docmntdict=[[NSMutableDictionary alloc]init];           
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DocumentTitle"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"DocumentName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"url"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"UploadHRDocsImageResult"])
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
    if([elementName isEqualToString:@"ApplicantrequirementselectResponse"])
    { newwebtype=4;
        _requirmntarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"Requirement_Name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Verification_status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"reqVendorName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"RVendorname"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"StatusselectResponse"])
    {
        [self Applicantrequirementselect];
        _statusdict=[[NSMutableDictionary alloc]init];
        _restatusdict=[[NSMutableDictionary alloc]init];

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
    if([elementName isEqualToString:@"statusname"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReqVendorselectResponse"])
    {
        _vendordict=[[NSMutableDictionary alloc]init];
        _revendordict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ReqVendorId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"VendorName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"StateselectResponse"])
    {
        _statedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"state_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"state_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"PaymentTypeselectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PaymentTypeId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Fname"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"FAcNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"FRoutingNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"CardNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"CRoutingNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"CardExpiryDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"W4selectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"W4Appid"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"NoOfDependents"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MaritalStatusId"])
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
    if([elementName isEqualToString:@"DocumentTitle"])
    {
       
        recordResults = FALSE;
        _docname=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DocumentName"])
    {
        recordResults = FALSE;
      _soapResults = nil;
    }
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        [_docmntdict setObject:_soapResults forKey:_docname];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if([_soapResults isEqualToString:@"inserted"]){
            
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"" message:@"Inserted Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertview show];
        }
        else{
             _resultstring=_soapResults;
            UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertview show];
        }
       
        
        
        [self Applicantrequirementselect];
        [self SelectHRDocs];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        _appreqmdl=[[Appreqmdl alloc]init];
         recordResults = FALSE;
        _appreqmdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Requirement_Name"])
    {
        recordResults = FALSE;
          _appreqmdl.reqname=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"T"];
        NSString*news=[array objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:news];
        [dateFormat setDateFormat:@"MM/dd/yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
           _appreqmdl.expdate=myFormattedDate;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Verification_status"])
    {
        recordResults = FALSE;
           _appreqmdl.verifictnstatus=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"status"])
    {
        recordResults = FALSE;
           _appreqmdl.status=_soapResults;
       
   
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"reqVendorName"])
    {
        recordResults = FALSE;
        //_appreqmdl.vendorname=_soapResults;
     
        _soapResults = nil;
        
    }

    if([elementName isEqualToString:@"RVendorname"])
    {
        recordResults = FALSE;
        _appreqmdl.vendorname=_soapResults;
         [_requirmntarray addObject:_appreqmdl];
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"id"])
    {
       recordResults = FALSE;
        statusstring=_soapResults;
         _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"statusname"])
    {
        recordResults = FALSE;
        [_statusdict setObject:statusstring forKey:_soapResults];
          [_restatusdict setObject:_soapResults forKey:statusstring];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"ReqVendorId"])
    {
        recordResults = FALSE;
        vendorstrg=_soapResults;
        _soapResults = nil;

        
    }
 
    if([elementName isEqualToString:@"VendorName"])
    {
        recordResults = FALSE;
        [_vendordict setObject:vendorstrg forKey:_soapResults];
        [_revendordict setObject:_soapResults forKey:vendorstrg];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"state_id"])
    {
       recordResults = FALSE;
        stateidstr=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"state_name"])
    {
        recordResults = FALSE;
        [_statedict setObject:stateidstr forKey:_soapResults];
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"applicant_Id"])
    {
        recordResults = FALSE;
        _paymntmdl=[[payementmdl alloc]init];
        _paymntmdl.applicantid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"PaymentTypeId"])
    {
        recordResults = FALSE;
           _paymntmdl.paymnttypeid=_soapResults;
        switch ([_soapResults integerValue]) {
            case 1:
                _instnname.enabled=NO;
                _Accuntnumbr.enabled=NO;
                _typesegmntlbl.enabled=NO;
                _rontgnumbr.enabled=NO;
                _citytxt.enabled=NO;
                _statelbl.enabled=NO;
                _cardnumbtxtfld.enabled=NO;
                _cardroutdno.enabled=NO;
                _expbtn.enabled=NO;
                break;
            case 2:
                _instnname.enabled=YES;
                _Accuntnumbr.enabled=YES;
                _typesegmntlbl.enabled=YES;
                _rontgnumbr.enabled=YES;
                _citytxt.enabled=YES;
                _statelbl.enabled=YES;
                _cardnumbtxtfld.enabled=NO;
                _cardroutdno.enabled=NO;
                _expbtn.enabled=NO;
                break;
                
            case 3:
                _instnname.enabled=NO;
                _Accuntnumbr.enabled=NO;
                _typesegmntlbl.enabled=NO;
                _rontgnumbr.enabled=NO;
                _citytxt.enabled=NO;
                _statelbl.enabled=NO;
                _cardnumbtxtfld.enabled=YES;
                _cardroutdno.enabled=YES;
                _expbtn.enabled=YES;
                break;
                
                
            default:
                break;
        }

        [_paymenttypebtn setTitle:[_paymenttypedict objectForKey:_paymntmdl.paymnttypeid] forState:UIControlStateNormal];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Fname"])
    {
        recordResults = FALSE;
           _paymntmdl.fname=_soapResults;
        _instnname.text=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"FAcNumber"])
    {
        recordResults = FALSE;
           _paymntmdl.facnumber=_soapResults;
        _Accuntnumbr.text=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        recordResults = FALSE;
           _paymntmdl.ptypeid=_soapResults;
        if ([_soapResults isEqualToString:@"1"]) {
            _typesegmntlbl.selectedSegmentIndex=0;
        }
        else{
            _typesegmntlbl.selectedSegmentIndex=1;
        }
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FRoutingNumber"])
    {
        recordResults = FALSE;
           _paymntmdl.froutingnumber=_soapResults;
        _rontgnumbr.text=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"CardNumber"])
    {
        recordResults = FALSE;
           _paymntmdl.cardnumber=_soapResults;
        _cardnumbtxtfld.text=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"CRoutingNumber"])
    {
        recordResults = FALSE;
           _paymntmdl.croutingnumber=_soapResults;
        _cardroutdno.text=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"CardExpiryDate"])
    {
        recordResults = FALSE;
        
        NSArray*array=[_soapResults componentsSeparatedByString:@"T"];
        NSString*news=[array objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:news];
        [dateFormat setDateFormat:@"MM/dd/yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _paymntmdl.cardexpiry=myFormattedDate;
        [_payementarray addObject:_paymntmdl];
        [_expbtn setTitle:myFormattedDate forState:UIControlStateNormal];

        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"W4Appid"])
    {
        recordResults = FALSE;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"NoOfDependents"])
    {
        recordResults = FALSE;
        _Dependentstexffld.text=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"MaritalStatusId"])
    {
        recordResults = FALSE;
        [_maritalbtn setTitle:[_maritaldict objectForKey:_soapResults] forState:UIControlStateNormal];
        _soapResults = nil;
        
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
    calendar.delegate =(id) self;
    
    
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
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2019"];
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
   
      if (dateselctor==12) {
       [self.popOverController presentPopoverFromRect:_expbtn.frame
                                            inView:self.paymentdetailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
      }
      else if (dateselctor==11) {
          [self.popOverController presentPopoverFromRect:_detalexpbtnlbl.frame
                                                  inView:self.editview
                                permittedArrowDirections:UIPopoverArrowDirectionUp
                                                animated:YES];
          

           }
    
}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    
    NSString *dateString1 = [dateFormat stringFromDate:date];
    if (dateselctor==11) {
        [_detalexpbtnlbl setTitle:dateString1 forState:UIControlStateNormal];
    }
    else{
        [_expbtn setTitle:dateString1 forState:UIControlStateNormal];
    }



}


#pragma mark-UIpopover
-(void)createpopover{
   
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 230, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 230, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(230, 200);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(230.0f, 200.0f);
    self.popOverController=_popOverController;
    
    switch (webtype) {
        case 1:
            [self.popOverController presentPopoverFromRect:_statuslbl.frame
                                                    inView:self.editview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            

            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_vendrnamebtnlbl.frame
                                                    inView:self.editview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;

            
        case 10:
            [self.popOverController presentPopoverFromRect:_statelbl.frame
                                                    inView:self.paymentdetailview
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            
            break;
            

        default:
            break;
    }
    
   }

#pragma mark-Button Action
-(IBAction)selectmaritalstatus:(id)sender
{
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    self.popOverController.popoverContentSize=CGSizeMake(200.0f, 90.0f);
    self.popOverController=_popOverController;
        
    
    
    [self.popOverController presentPopoverFromRect:_maritalbtn.frame
                                            inView:self.w4detailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}


- (IBAction)expbtn:(id)sender {
    dateselctor=12;
    dateString=@"01/01/1900";
    [self createCalenderPopover];
}

- (IBAction)statebtn:(id)sender {
    poptype=10;
    webtype=10;
    [self createpopover];
    [self Stateselect];
}

- (IBAction)typesegmnt:(id)sender {
}

-(IBAction)selectpaymenttype:(id)sender
{
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_paymenttypebtn.frame
                                            inView:self.paymentdetailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

}

- (IBAction)savebtn:(id)sender {
    [self UpdateDirectDeposit];
}

- (IBAction)detailclsebtn:(id)sender {
       _uplddocbtnlbl.enabled=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

    
    
    

-(IBAction)updatedoc:(id)sender{
    
    if ([_documentnametextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is Required " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(imagechecker==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Document is Required " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
    else{
    
        _uplddocbtnlbl.enabled=NO;
       UIImage *imagename =_previewimg.image;
      NSData *data = UIImagePNGRepresentation(imagename);
    _encodedString = [data base64EncodedString];
       NSLog(@"%@",_encodedString);
         imagechecker=0;
    
    [self UploadHRDocsImage];
        
    }
    
}
- (IBAction)DetailsBtnAction:(id)sender
{
    [self Applicantrequirementselect];
    _detailbtnlbl.tintColor=[UIColor whiteColor];
       _docubtnlbl.tintColor=[UIColor blackColor];
       _w4btnlbl.tintColor=[UIColor blackColor];
       _paymntbtnlbl.tintColor=[UIColor blackColor];
    
    _detailsaddview.hidden=NO;
    _w4detailview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
}

- (IBAction)DcmntBtnAction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor whiteColor];
    _w4btnlbl.tintColor=[UIColor blackColor];
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    
    [self SelectHRDocs];
    _dcmntdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
}

- (IBAction)w4BtnAction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];
    _w4btnlbl.tintColor=[UIColor whiteColor];
    _paymntbtnlbl.tintColor=[UIColor blackColor];

    _w4detailview.hidden=NO;
    _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
    [self W4select];
       
}

- (IBAction)paymentbtnaction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];
    _w4btnlbl.tintColor=[UIColor blackColor];
    _paymntbtnlbl.tintColor=[UIColor whiteColor];

    _paymentdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _dcmntdetailview.hidden=YES;
    [self PaymentTypeselect];
    
}
-(IBAction)editdetails:(id)sender
{
    _editview.hidden=NO;
}
-(IBAction)closeeditview:(id)sender
{
    _editview.hidden=YES;
}
-(IBAction)updaterequirement:(id)sender{
    _updatereqbtnlbl.enabled=NO;
    
    [self ApplicantReqirement2Update];
    
    
}

-(IBAction)cancelrequirement:(id)sender{
  
    [_statuslbl  setTitle:@"Select" forState:UIControlStateNormal];
      [_vendrnamebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
    [_detalexpbtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
[_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
    
}
- (IBAction)w4savebtn:(id)sender {
    
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_Dependentstexffld.text];
    if(value1==0)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Dependents" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        _Dependentstexffld.text=@"";
        
        
    }
    else{
        
        if ([_Dependentstexffld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Number of Dependents is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];

            
        }
        else{
    [self UpdateW4];
        }
    }
    
    }
- (IBAction)showbtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.documentlisttable];
   NSIndexPath *textFieldIndexPath = [self.documentlisttable indexPathForRowAtPoint:rootViewPoint];
   NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    NSArray *newnamearry=[_docmntdict allKeys];
    urlstring=[_docmntdict objectForKey:[newnamearry objectAtIndex:textFieldIndexPath.row]];

    NSString*newstrg=[urlstring stringByReplacingOccurrencesOfString:@"ios" withString:@"testUSA"];

   // if (!_webVCtrl) {
        self.webVCtrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
   // }
    _webVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _webVCtrl.urlstring=newstrg;
    [self presentViewController:_webVCtrl
                       animated:YES completion:NULL];
    

    
}
- (IBAction)editbtn:(id)sender {
    _editview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.detailstablview];
    NSIndexPath *textFieldIndexPath = [self.detailstablview indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    Appreqmdl *appreqmdl=(Appreqmdl *)[_requirmntarray objectAtIndex:textFieldIndexPath.row];
    _reqnamelbl.text=appreqmdl.reqname;
   
      [_statuslbl  setTitle:[_restatusdict objectForKey:appreqmdl.status] forState:UIControlStateNormal];
  
   //[_vendrnamebtnlbl  setTitle:[_revendordict objectForKey:appreqmdl.vendor] forState:UIControlStateNormal];
    [_detalexpbtnlbl  setTitle:appreqmdl.expdate forState:UIControlStateNormal];
    [_vendrnamebtnlbl  setTitle:appreqmdl.vendorname forState:UIControlStateNormal];

    
    
    if ([appreqmdl.verifictnstatus isEqualToString:@"true"]) {
         [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        check=1;
    }
    else{
          [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        check=0;
    }
    
    
}
- (IBAction)detailexpbtn:(id)sender {
    dateselctor=11;
    [self createCalenderPopover];
}

- (IBAction)vendorbtn:(id)sender {
     webtype=2;
    poptype=4;
    
    [self createpopover];
    [self ReqVendorselect];
}

-(IBAction)selectstatus:(id)sender{
     webtype=1;
     poptype=3;
    [self createpopover];
    [self Statusselect];
    
}
-(IBAction)verifiedaction:(id)sender{
   
    if (check==0) {
         [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        check=1;
    }
    else if (check==1){
         [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        check=0;
    }
    
    
      // Appreqmdl *appreqmdl=(Appreqmdl *)[_requirmntarray objectAtIndex:indexPath.row];
    
//    if ([appreqmdl.verifictnstatus isEqualToString:@"0"])
//        
//        
//    {
//        
//        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        
//        
//        check=1;
//        
//        
//    }
//    else
//    {
//        [_checkbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        check=0;
//        
//    }

}

//-(IBAction)selectfileaction:(id)sender{
//    
//    
//    if ([UIImagePickerController isSourceTypeAvailable:
//         UIImagePickerControllerSourceTypeCamera])
//    {
//        
//        
//        UIImagePickerController *imagePicker =
//        [[UIImagePickerController alloc] init];
//        imagePicker.delegate =(id) self;
//        imagePicker.sourceType =
//        UIImagePickerControllerSourceTypeCamera;
//        imagePicker.showsCameraControls=YES;
//        
//        imagePicker.mediaTypes = [NSArray arrayWithObjects:
//                                  (NSString *) kUTTypeImage,
//                                  nil];
//        imagechecker=1;
//        imagePicker.allowsEditing = NO;
//        // imagePicker.cameraCaptureMode=YES;
//        [self presentViewController:imagePicker animated:YES completion:nil];
//        _newMedia = YES;
//    }
//}
- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    
    //handle pinch...
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        _imagePicker =
        [[UIImagePickerController alloc] init];
        _imagePicker.delegate =(id) self;
        _imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        _imagePicker.showsCameraControls=YES;
        
        _imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagechecker=1;
        _imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
        _newMedia = YES;
    }
    
        
    
}

#pragma mark-ImagePicker
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
        switch (image.imageOrientation) {
            case UIImageOrientationDown:
            case UIImageOrientationDownMirrored:
            case UIImageOrientationLeft:
            case UIImageOrientationLeftMirrored:
            case UIImageOrientationRight:
            case UIImageOrientationRightMirrored:
                image = [UIImage imageWithCGImage:image.CGImage
                                            scale:image.scale
                                      orientation:UIImageOrientationUp]; // change this if you need another orientation
                break;
            case UIImageOrientationUp:
            case UIImageOrientationUpMirrored:
                // The image is already in correct orientation
                break;
        }
        
        
        _previewimg.image=nil;
        _previewimg.image=image;

        
        imagechecker=1;
        
       
        // [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController dismissViewControllerAnimated: YES completion: nil];
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    

    
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:_resultstring]) {
        
        
        
        if (buttonIndex==0) {
            
             _updatereqbtnlbl.enabled=YES;
            _documentnametextfld.text=@"";
            [_statuslbl  setTitle:@"Select" forState:UIControlStateNormal];
            [_vendrnamebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
            [_detalexpbtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
            [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            _editview.hidden=YES;
        }
    }
    
    if ([alertView.message isEqualToString:@"Inserted Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            
            _uplddocbtnlbl.enabled=YES;

            _documentnametextfld.text=@"";
           // [_statuslbl  setTitle:@"Select" forState:UIControlStateNormal];
           // [_vendrnamebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
            //[_detalexpbtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
           // [_verfictnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            //_editview.hidden=YES;
        }
    }

}



@end
