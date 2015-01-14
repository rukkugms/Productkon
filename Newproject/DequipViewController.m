//
//  DequipViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 23/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DequipViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30

@interface DequipViewController ()

@end

@implementation DequipViewController

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
    self.equiptouchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
   _equipsrctitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
   _equipdesttitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.equipeditview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    // Do any additional setup after loading the view from its nib.
    self.equipsourcetable.layer.borderWidth=3.0;
    self.equipsourcetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.equipdesttable.layer.borderWidth=3.0;
    self.equipdesttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.equiptouchview addGestureRecognizer:panGesture];
    
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
    [self equipsetupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
    [self equipsetupDestinationTableWithFrame:CGRectMake(0, 0, 682, 533)];
    [self planEquipmentCrewSetUpSelect];
    //[self SelectAllEquipment];
    [self GeneralResourceDetailselect];
    
}

- (IBAction)clsbtn:(id)sender {
}
- (IBAction)closeequip:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)deleteequip:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_equipdesttable setEditing:NO animated:NO];
        [_equipdesttable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_equipdesttable setEditing:YES animated:YES];
        [_equipdesttable reloadData];
        
        
    }
    
}
- (IBAction)editequip:(id)sender
{   option=1;
    [self PlanHoursSelect];

    _EQdgupdate.enabled=YES;
    _equipeditview.hidden=NO;
    equipbtn = (UIButton *)sender;
    CGPoint center= equipbtn.center;
    CGPoint rootViewPoint = [equipbtn.superview convertPoint:center toView:self.equipdesttable];
    NSIndexPath *textFieldIndexPath = [self.equipdesttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Drageqmodel*dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:btnindex];
    _equipitemcodetextfield.text=dmodel.EquipmentCrewName;
    _equipitemdesctextfield.text=[NSString stringWithFormat:@"%.2f",[dmodel.hours doubleValue]];
    _equipqtytextfield.text=dmodel.qty;
   
//    if ([dmodel.ratestring isEqualToString:@"Hourly Rate"]) {
//        [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        
//    }
//    if ([dmodel.ratestring isEqualToString:@"Daily Rate"]) {
//        
//        [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//    }
//    if ([dmodel.ratestring isEqualToString:@"Weekly Rate"]) {
//        
//        [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//    }
//    if ([dmodel.ratestring isEqualToString:@"Monthly Rate"]) {
//        
//        [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//        [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//    }
    

    _hratecheck=@"";
    _mratecheck=@"";
    _wratecheck=@"";
    _dratecheck=@"";
    
}
- (IBAction)closeequipeditview:(id)sender
{
    _EQdgupdate.enabled=YES;
    _equipeditview.hidden=YES;
}
- (IBAction)updateequip:(id)sender
{
    NSLog(@"%.2f",[planhours doubleValue]);
     NSLog(@"%.2f",[_equipitemdesctextfield.text doubleValue]);
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_equipqtytextfield.text];
        int value2=[val isNumeric:_equipitemdesctextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    
    
       else if(value2==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
    else if ([_equipitemdesctextfield.text doubleValue]  > [planhours doubleValue])
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Equipment hours must be less than or equal to Man Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        _equipitemdesctextfield.text=@"";
    }
    else
    {
        _EQdgupdate.enabled=NO;

    [self GeneralResourceDetailUpdate];
    }
}
- (IBAction)hratecheckaction:(id)sender
{
    _hratecheck=@"h";
    if (hcheck==0) {
        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        hcheck=1;
        dcheck=0;
        wcheck=0;
        mcheck=0;
        
    }
    
    else{
        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        hcheck=0;
        
    }
    
}
-(IBAction)dratecheckaction:(id)sender
{
    _dratecheck=@"d";
    if (dcheck==0) {
        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        dcheck=1;
        hcheck=0;
        wcheck=0;
        mcheck=0;
        
    }
    
    else{
        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        dcheck=0;
        
    }
    
}
-(IBAction)wratecheckaction:(id)sender
{
    _wratecheck=@"w";
    if (wcheck==0) {
        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        wcheck=1;
        dcheck=0;
        hcheck=0;
        mcheck=0;
        
    }
    
    else{
        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        wcheck=0;
        
    }
    
}
-(IBAction)mratecheckaction:(id)sender
{
    _mratecheck=@"m";
    if (mcheck==0) {
        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        mcheck=1;
        dcheck=0;
        wcheck=0;
        hcheck=0;
        
    }
    
    else{
        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        mcheck=0;
        
    }
    
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_equipsourcetable) {
        return [_crenamearray count];
        
        
    }
    if (tableView==_equipdesttable) {
        
        return [_equipdestarray count];
        
    }
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_equipsourcetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Srcequcell" owner:self options:nil];
            cell=_equipsourcecell;
            
        }
        if (tableView==_equipdesttable) {
            [[NSBundle mainBundle]loadNibNamed:@"Destequcell" owner:self options:nil];
            
            cell=_equipdestcell;
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    if (tableView==_equipsourcetable) {
        //cell.textLabel.text=[srcData objectAtIndex:indexPath.row];
        
        //Equpmntmdl *emdl=(Equpmntmdl *)[_equipsrcarray objectAtIndex:indexPath.row];
        
        _equipitemlabel=(UILabel *)[cell viewWithTag:1];
        _equipitemlabel.text=[_crenamearray objectAtIndex:indexPath.row];
//        _equideslabel=(UILabel *)[cell viewWithTag:2];
//        _equideslabel.text=emdl.itemdescptn;
        
        
    }
    if (tableView==_equipdesttable) {
        
        Drageqmodel *dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:indexPath.row];
        
        _equipitemdestlabel=(UILabel *)[cell viewWithTag:1];
        _equipitemdestlabel.text=dmodel.EquipmentCrewName;
        _equipdescdestlabel=(UILabel *)[cell viewWithTag:2];
        _equipdescdestlabel.text=[NSString stringWithFormat:@"%.2f",[dmodel.hours doubleValue]];
        _equipquantdestlabel=(UILabel *)[cell viewWithTag:3];
        _equipquantdestlabel.text=dmodel.qty;
           NSLog(@"%@",dmodel.ratestring);
//        if ([dmodel.ratestring isEqualToString:@"Hourly Rate"]) {
//            [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//            [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            
//        }
//         if ([dmodel.ratestring isEqualToString:@"Daily Rate"]) {
//        
//             [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//             [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//             [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//             [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//         }
//        if ([dmodel.ratestring isEqualToString:@"Weekly Rate"]) {
//            
//            [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//            [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        }
//        if ([dmodel.ratestring isEqualToString:@"Monthly Rate"]) {
//            
//            [_mratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//            [_hratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_wratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//            [_dratecellcheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        }
//
//
        
        
        
        
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        eqdeletepath=indexPath.row;
        
        if (tableView==_equipdesttable) {
            [self GeneralGroupDetailDelete];
            [_equipdestarray removeObject:indexPath];
            
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
        
        
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_equipsourcetable)
        
    {
        return self.editing ;
    }
    return YES;
    
}
#pragma mark-webservices
-(void)planEquipmentCrewSetUpSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<planEquipmentCrewSetUpSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</planEquipmentCrewSetUpSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/planEquipmentCrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)SelectAllEquipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</PlanEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PlanEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmentHoursSelect
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<NewEqHoursSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<maingeneralId>%d</maingeneralId>\n"
                   "</NewEqHoursSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_generalid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/NewEqHoursSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)PlanHoursSelect{
    webtype=5;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<PlanHoursSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "</PlanHoursSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_generalid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/PlanHoursSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)GeneralResourceDetailselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceDetailselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>"
                   "</GeneralResourceDetailselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_generalid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceDetailselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GeneralResourceDetailInsert{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    NSString *cid=[_crewdict objectForKey:[_crenamearray objectAtIndex:equippath]];
   // Equpmntmdl *emodel=(Equpmntmdl *)[_equipsrcarray objectAtIndex:equippath];
   // NSString *etype=@"EQ";
    NSString *ename=@"Equipment Group";
    NSString *quantity=@"1";
   // NSString *hours=@"7";
//    NSInteger hrate=0;
//    NSInteger drate=0;
//    NSInteger wrate=0;
//    NSInteger mrate=0;
//    NSInteger yrate=0;
    NSString *ratestring=@"Hourly Rate";
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceDetailInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainGeneralId>%d</MainGeneralId>\n"
                   "<SubGeneralCrewId>%d</SubGeneralCrewId>\n"
                   "<GroupDescription>%@</GroupDescription>\n"
                   "<Houres>%f</Houres>\n"
                   "<Rate>%@</Rate>\n"
                   "<Quantity>%d</Quantity>\n"
                   "</GeneralResourceDetailInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_generalid integerValue],[cid integerValue],ename,[planhours floatValue],ratestring,[quantity integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceDetailInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GeneralResourceDetailUpdate{
    NSString *ratestring;
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    Drageqmodel *dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:btnindex];
    NSString *cid=[_crewdict objectForKey:dmodel.EquipmentCrewName];
   // NSString *etype=@"EQ";
    NSString *ename=@"Equipment Group";
    NSString *quantity=_equipqtytextfield.text;
    NSString *hours=_equipitemdesctextfield.text;
    ratestring=@"Hourly Rate";
  //  NSInteger hrate;
   // NSInteger drate;
   // NSInteger wrate;
  //  NSInteger mrate;
   // NSInteger yrate;
   // yrate=0;
   // NSLog(@"%@",_hratecheck);
//    if([_hratecheck isEqualToString:@""]&&[_dratecheck isEqualToString:@""]&&[_mratecheck isEqualToString:@""]&&[_wratecheck isEqualToString:@""])
//    {
//        mrate=dmodel.mrate;
//        drate=dmodel.drate;
//        wrate=dmodel.wrate;
//        hrate=dmodel.hrate;
//        ratestring=dmodel.ratestring;
//    }
//    else
//    {
//
////    if([_hratecheck isEqualToString:@"h"])
////    {
//        if (hcheck==0) {
//            hrate=0;
//        }
//        else{
//            hrate=1;
//            ratestring=@"Hourly Rate";
//            drate=0;
//            wrate=0;
//            mrate=0;
//        }
////        _hratecheck=@"";
////    }
////    else
////    {
////        hrate=dmodel.hrate;
////    }
//    
////    if([_dratecheck isEqualToString:@"d"])
////   {
//        if (dcheck==0) {
//            drate=0;
//        }
//        else{
//            drate=1;
//            ratestring=@"Daily Rate";
//            mrate=0;
//            wrate=0;
//            hrate=0;
//            
//        }
////        _dratecheck=@"";
////    }
////    else
////    {
////        drate=dmodel.drate;
////    }
//    
//    
//    if([_wratecheck isEqualToString:@"w"])
//    {
//        if (wcheck==0) {
//            
//            wrate=0;
//        }
//        else{
//            wrate=1;
//            ratestring=@"Weekly Rate";
//            drate=0;
//            hrate=0;
//            mrate=0;
//            
//        }
////        _wratecheck=@"";
//   }
////    else
////    {
////        wrate=dmodel.wrate;
////    }
//    
//    
////   if([_mratecheck isEqualToString:@"m"])    {
//        if (mcheck==0) {
//            mrate=0;
//        }
//        else{
//            mrate=1;
//            ratestring=@"Monthly Rate";
//            drate=0;
//            wrate=0;
//            hrate=0;
//            
////        }
////        _mratecheck=@"";
//}
//    
////    else
////    {
////        mrate=dmodel.mrate;
////    }
//    }
      soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralResourceDetailUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                    "<MainGeneralId>%d</MainGeneralId>\n"
                    "<SubGeneralCrewId>%d</SubGeneralCrewId>\n"
                    "<GroupDescription>%@</GroupDescription>\n"
                    "<Houres>%f</Houres>\n"
                    "<Rate>%@</Rate>\n"
                    "<Quantity>%d</Quantity>\n"
                   "</GeneralResourceDetailUpdate>\n"
                   "</soap:Body>\n"
                     "</soap:Envelope>\n",dmodel.idvalue,dmodel.mainGeneralId,[cid integerValue],dmodel.GroupDescription,[hours floatValue],ratestring,[quantity integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralResourceDetailUpdate" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)GeneralGroupDetailDelete{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    Drageqmodel *dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:eqdeletepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralGroupDetailDelete xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "</GeneralGroupDetailDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",dmodel.idvalue];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];

    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralGroupDetailDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    [_equipsourcetable reloadData];
    [_equipdesttable reloadData];
//    if (webtype==1||webtype==2) {
//        [self GeneralResourceDetailselect];
//        webtype=0;
//    }
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    
    if([elementName isEqualToString:@"planEquipmentCrewSetUpSelectResponse"])
    {
        _equipsrcarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"GeneralEntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GeneralDescription"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"GeneralItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GeneralResourceDetailselectResponse"])
    {
        _equipdestarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"mainGeneralId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ResourceEquipmentCrewName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GroupDescription"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Houres"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Rate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Quantity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

        if([elementName isEqualToString:@"GeneralResourceDetailUpdateResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GeneralResourceDetailInsertResult"])
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
    if([elementName isEqualToString:@"planEquipmentCrewSetUpSelectResponse"])
    {_crenamearray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        _revcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EquipmentCrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EquipmentCrewName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PlanHoursSelectResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"Column1"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GeneralGroupDetailDeleteResult"])
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
    if([elementName isEqualToString:@"GeneralEntryId"])
    {
        
        _eqmdl=[[Equpmntmdl alloc]init];
        recordResults = FALSE;
        
        _eqmdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"GeneralDescription"])
    {
        
        recordResults = FALSE;
        _eqmdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"GeneralItemCode"])
    {
        
        recordResults = FALSE;
        _eqmdl.itemcode=_soapResults;
        [_equipsrcarray addObject:_eqmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        _dmdl=[[Drageqmodel alloc]init];
        recordResults = FALSE;
        
        _dmdl.idvalue=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"mainGeneralId"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.mainGeneralId=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"ResourceEquipmentCrewName"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.EquipmentCrewName=_soapResults;
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"GroupDescription"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.GroupDescription=_soapResults;
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"Houres"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.hours=_soapResults;
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"Rate"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.ratestring=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"Quantity"])
    {
        
        
        recordResults = FALSE;
        
        _dmdl.qty=_soapResults;
        [_equipdestarray addObject:_dmdl];
        _soapResults = nil;    }
//    if([elementName isEqualToString:@"Qty"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        _dmdl.qty=_soapResults;
//        
//        _soapResults = nil;    }
//    if([elementName isEqualToString:@"HourlyRate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        if ([_soapResults isEqualToString:@"false"]) {
//            _dmdl.hrate=0;
//            //checkbtnclick=0;
//            
//        }
//        else{
//            _dmdl.hrate=1;
//            //checkbtnclick=1;
//        }
//
//        
//        _soapResults = nil;    }
//    if([elementName isEqualToString:@"DailyRate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        
//        if ([_soapResults isEqualToString:@"false"]) {
//            _dmdl.drate=0;
//            //checkbtnclick=0;
//            
//        }
//        else{
//            _dmdl.drate=1;
//            //checkbtnclick=1;
//        }
//        
//        _soapResults = nil;    }
//    
//    if([elementName isEqualToString:@"WeeklyRate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        if ([_soapResults isEqualToString:@"false"]) {
//            _dmdl.wrate=0;
//            //checkbtnclick=0;
//            
//        }
//        else{
//            _dmdl.wrate=1;
//            //checkbtnclick=1;
//        }
//
//        
//        _soapResults = nil;    }
//    if([elementName isEqualToString:@"MonthlyRate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        if ([_soapResults isEqualToString:@"false"]) {
//            _dmdl.mrate=0;
//            //checkbtnclick=0;
//            
//        }
//        else{
//            _dmdl.mrate=1;
//            //checkbtnclick=1;
//        }
//
//        //[_equipdestarray addObject:_dmdl];
//        
//        _soapResults = nil;    }
//    if([elementName isEqualToString:@"Rate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        _dmdl.ratestring=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        [_equipdestarray addObject:_dmdl];
//        
//        _soapResults = nil;    }
//
//
//    if([elementName isEqualToString:@"YearlyRate"])
//    {
//        
//        
//        recordResults = FALSE;
//        
//        _dmdl.yrate=_soapResults;
//        [_equipdestarray addObject:_dmdl];
//        _soapResults = nil;
//    }
    if([elementName isEqualToString:@"result"])
    {
        
        
        recordResults = FALSE;
        _result=_soapResults;
        _EQdgupdate.enabled=YES;
        if (webtype==1||webtype==2) {
            if ([_result isEqualToString:@"Group Already Exists in this work. Change the Quantity  of existing Group"]) {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Group Already Exists in this work. Change the Quantity/Hours of existing Group" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                [self EquipmentHoursSelect];
                [self GeneralResourceDetailselect];
                
            }
            else
            {
                 if ([_result isEqualToString:@"Updated Successfully"]) {
                     UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_result delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                     [alert show];
                    
                 }
            

            dcheck=0;
            mcheck=0;
            hcheck=0;
            wcheck=0;
            [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            _equipitemcodetextfield.text=@"";
            _equipitemdesctextfield.text=@"";
            _equipqtytextfield.text=@"";
            webtype=0;
            [self EquipmentHoursSelect];
            [self GeneralResourceDetailselect];
            }
        }
         if (webtype==5)
         {
             
             [self GeneralResourceDetailselect];
         }
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EquipmentCrewId"])
    {
        recordResults =FALSE;
        crewid=_soapResults;
        _soapResults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"EquipmentCrewName"])
    {
        
        recordResults = FALSE;
        [_crenamearray addObject:_soapResults];
        [_crewdict setObject:crewid forKey:_soapResults];
        [_revcrewdict setObject:_soapResults forKey:crewid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        recordResults = FALSE;
        if (option==1) {
            planhours=_soapResults;
        }
        else
        {
        planhours=_soapResults;
        [self GeneralResourceDetailInsert];
        }
        _soapResults = nil;
    }

    
    
    
}
//#pragma mark-Alertview Delegate
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    if ([alertView.message isEqualToString:_result]) {
//        dcheck=0;
//        mcheck=0;
//        hcheck=0;
//        wcheck=0;
//        [_hratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_mratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_dratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_wratecheckbutton setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        _equipitemcodetextfield.text=@"";
//        _equipitemdesctextfield.text=@"";
//        _equipqtytextfield.text=@"";
//        
//    }
//    
//    
//}

#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self equipstartDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self equipstopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark Helper methods for dragging
- (void)equipstartDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint pointInSrc = [gestureRecognizer locationInView:_equipsourcetable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_equipdesttable];
    
    if([_equipsourcetable pointInside:pointInSrc withEvent:nil])
    {
        [self equipstartDraggingFromSrcAtPoint:pointInSrc];
        equipdragFromSource = YES;
    }
    else if([_equipdesttable pointInside:pointInDst withEvent:nil])
    {
        //[self equipstartDraggingFromDstAtPoint:pointInDst];
        equipdragFromSource = NO;
    }
}

- (void)equipstartDraggingFromSrcAtPoint:(CGPoint)point
{
    _EQdgupdate.enabled=YES;
    NSIndexPath* indexPath = [_equipsourcetable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_equipsourcetable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _equipsourcetable.frame.origin.x;
        origin.y += _equipsourcetable.frame.origin.y;
        
        [self equipinitDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(equipdraggedData != nil)
        {
            //[draggedData release];
            equipdraggedData = nil;
        }
        
        equippath=indexPath.row;
        
       // Equpmntmdl *emdl=(Equpmntmdl *)[_equipsrcarray objectAtIndex:equippath];
        NSString *cid=[_crenamearray objectAtIndex:equippath];
        equipdraggedData = cid;
        NSLog(@"name2%@",cid);
        NSLog(@"apath%d",equippath);
    }
}
- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(equipdraggedCell != nil && equipdraggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[equipdraggedCell superview]];
        [equipdraggedCell setCenter:CGPointMake([equipdraggedCell center].x + translation.x,
                                                [equipdraggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[equipdraggedCell superview]];
    }
}
- (void)equipstopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(equipdraggedCell != nil && equipdraggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);
        
        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [equipdropArea pointInside:[gestureRecognizer locationInView:equipdropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_equipdesttable indexPathForRowAtPoint:[gestureRecognizer locationInView:_equipdesttable]];
            if(indexPath != nil)
            {
                Drageqmodel *dmdl=(Drageqmodel *)[_equipdestarray objectAtIndex:indexPath.row];
                dmdl.EquipmentCrewName=equipdraggedData;
                [_equipdestarray addObject:dmdl];

                //[_equipdestarray insertObject:equipdraggedData atIndex:indexPath.row];
                [_equipdesttable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                [self PlanHoursSelect];
            }
            else
            {
                if ([_equipdestarray count]==0) {
                    Drageqmodel *dmdl=[[Drageqmodel alloc]init];
                    dmdl.EquipmentCrewName=equipdraggedData;
                    [_equipdestarray addObject:dmdl];

                }
                else
                {
                
                Drageqmodel *dmdl=(Drageqmodel *)[_equipdestarray objectAtIndex:indexPath.row];
                dmdl.EquipmentCrewName=equipdraggedData;
                [_equipdestarray addObject:dmdl];
                }
                [self PlanHoursSelect];
               // [self GeneralResourceDetailInsert];
            }
        }
        else if(!equipdragFromSource && equippathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_equipdestarray insertObject:equipdraggedData atIndex:equippathFromDstTable.row];
            [_equipdesttable insertRowsAtIndexPaths:[NSArray arrayWithObject:equippathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            equippathFromDstTable = nil;
        }
        if ([_result isEqualToString:@"Group Already Exists in this work. Change the Quantity  of existing Group"]) {
            [equipdraggedCell removeFromSuperview];
            //[draggedCell release];
            equipdraggedCell = nil;
            
            //[draggedData release];
            equipdraggedData = nil;
        }
        else
        {
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _equipdesttable.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _equipdesttable.frame = frame;
         }];
        
        [equipdraggedCell removeFromSuperview];
        //[draggedCell release];
        equipdraggedCell = nil;
        
        //[draggedData release];
        equipdraggedData = nil;
        }
    }
}
- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_equipdesttable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_equipdesttable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += equipdropArea.frame.origin.x;
        origin.y += equipdropArea.frame.origin.y;
        
        [self equipinitDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(equipdraggedData != nil)
        {
            //[draggedData release];
            equipdraggedData = nil;
        }
        Equpmntmdl*emdl=(Equpmntmdl *)[_equipsrcarray objectAtIndex:indexPath.row];
        equipdraggedData = emdl.itemcode;
        
        // remove old cell
        [_equipdestarray removeObjectAtIndex:indexPath.row];
        [_equipdesttable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        equippathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _equipdesttable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _equipdesttable.frame = frame;
         }];
        
    }
}



#pragma mark Helper methods for initialization

- (void)equipsetupSourceTableWithFrame:(CGRect)frame
{
    
    [self.equiptouchview addSubview:_equipsourcetable];
}

- (void)equipsetupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect equipdropAreaFrame = frame;
    equipdropAreaFrame.origin.y = kNavBarHeight;
    equipdropAreaFrame.size.height -= kNavBarHeight;
    
    equipdropArea = [[UIView alloc] initWithFrame:CGRectMake(350, 35, 638, 700)];
    [equipdropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    //[equipdropArea setBackgroundColor:[UIColor redColor]];
    [self.equiptouchview addSubview:equipdropArea];
    
    CGRect contentFrame = equipdropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* equipdropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    equipdropAreaLabel.backgroundColor = [UIColor clearColor];
    equipdropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    equipdropAreaLabel.textAlignment = NSTextAlignmentCenter;
    equipdropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [equipdropArea addSubview:equipdropAreaLabel];
    
    [equipdropArea addSubview:_equipdesttable];
}
- (void)equipinitDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_equipsourcetable indexPathForRowAtPoint:point];
    NSLog(@"name1%d",indexPath.row);
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(equipdraggedCell != nil)
    {
        [equipdraggedCell removeFromSuperview];
        // [draggedCell release];
        equipdraggedCell = nil;
    }
    CGRect frame;
    if(point.y>=489){
        
        frame= CGRectMake(point.x, 250, cell.frame.size.width-5, cell.frame.size.height-10);
    }
    else{
        frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    }

   // CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    equipdraggedCell = [[UITableViewCell alloc] init];
    equipdraggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
   // Equpmntmdl *emdl=(Equpmntmdl *)[_equipsrcarray objectAtIndex:indexPath.row];
    equipdraggedCell.textLabel.text =[_crenamearray objectAtIndex:indexPath.row];
    //NSLog(@"name1%@",emdl.itemcode);
    NSLog(@"apath%d",indexPath.row);
    equipdraggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    equipdraggedCell.textLabel.textColor = cell.textLabel.textColor;
    equipdraggedCell.highlighted = YES;
    equipdraggedCell.frame = frame;
    equipdraggedCell.alpha = 0.8;
    
    [self.equiptouchview addSubview:equipdraggedCell];
}




#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_equipqtytextfield)
    {
        NSUInteger newLength = [_equipqtytextfield.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_equipitemdesctextfield)
    {
        NSUInteger newLength = [_equipitemdesctextfield.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    return YES;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_equipqtytextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_equipqtytextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_equipitemdesctextfield)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_equipitemdesctextfield.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
       if ([alertView.message isEqualToString:@"Invalid Hours"]) {
        
        
        
        if (buttonIndex==0) {
            
            Drageqmodel*dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:btnindex];
            
            _equipitemdesctextfield.text=dmodel.hours;
            
            
        }
    }
    if ([alertView.message isEqualToString:@"Invalid Quantity"]) {
        
        
        
        if (buttonIndex==0) {
            
            Drageqmodel*dmodel=(Drageqmodel *)[_equipdestarray objectAtIndex:btnindex];
            
           
            _equipqtytextfield.text=dmodel.qty;
            
        }
    }
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        
        _equipeditview.hidden=YES;
        
    }
    
    
    
    
}


@end


