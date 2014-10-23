//
//  GeneralViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 4/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GeneralViewController.h"

@interface GeneralViewController ()

@end

@implementation GeneralViewController
@synthesize delegate;

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
    if (_optionidentfr==1) {
        
        _navitm.title=@"Create";
        
              _unittxtfld.text=@"";
        _subunittxtfld.text=@"";
        _equipmnttxtfld.text=@"";
        _prjcthdrtxtfld.text=@"";
        //_quantytxtfld.text=@"";
         _destextview.text=@"";
        [_phasebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        [_projectheaderbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
    }

   else if (_optionidentfr==2) {
       _manbtn.hidden=NO;
       _matbtn.hidden=NO;
       _eqmntbtn.hidden=NO;
          _navitm.title=@"Edit";
        
        _generalmdl=(Generalmodel *)[_generalarray objectAtIndex:0];
        _unittxtfld.text=_generalmdl.Unit;
        _subunittxtfld.text=_generalmdl.SubUnit;
        _equipmnttxtfld.text=_generalmdl.Equipment;
        _prjcthdrtxtfld.text=_generalmdl.ProjectHeader;
        //_quantytxtfld.text=_generalmdl.Quantity;
        _destextview.text=_generalmdl.genDescription;
        [_phasebtnlbl setTitle:_generalmdl.Phase forState:UIControlStateNormal];
        [_projectheaderbtnlbl setTitle:_generalmdl.sequence forState:UIControlStateNormal];

        }
    
    
    
    NSLog(@"%d",_optionidentfr);
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.destextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.destextview layer] setBorderWidth:2];
    [[self.destextview layer] setCornerRadius:10];
    _autocompletearray=[[NSMutableArray alloc]init];
    _autotable = [[UITableView alloc] initWithFrame:CGRectMake(58, 138, 266, 100) style:UITableViewStylePlain];
    
    _autotable.delegate = (id)self;
    _autotable.dataSource =(id) self;
    _autotable.scrollEnabled = YES;
    _autotable.hidden = YES;
    _autotable.layer.borderColor=[UIColor blackColor].CGColor ;
    _autotable.layer.borderWidth=2.0f;
    _autotable.rowHeight=30;
    [self.view addSubview:_autotable];
    
    _autotable1 = [[UITableView alloc] initWithFrame:CGRectMake(448, 138, 266, 100) style:UITableViewStylePlain];
    
    _autotable1.delegate = (id)self;
    _autotable1.dataSource =(id) self;
    _autotable1.scrollEnabled = YES;
    _autotable1.hidden = YES;
    _autotable1.layer.borderColor=[UIColor blackColor].CGColor ;
    _autotable1.layer.borderWidth=2.0f;
    _autotable1.rowHeight=30;
    [self.view addSubview:_autotable1];
    
    _autotable2 = [[UITableView alloc] initWithFrame:CGRectMake(58, 210, 266, 100) style:UITableViewStylePlain];
    
    _autotable2.delegate = (id)self;
    _autotable2.dataSource =(id) self;
    _autotable2.scrollEnabled = YES;
    _autotable2.hidden = YES;
    _autotable2.layer.borderColor=[UIColor blackColor].CGColor ;
    _autotable2.layer.borderWidth=2.0f;
    _autotable2.rowHeight=30;
    [self.view addSubview:_autotable2];
    _autotable3 = [[UITableView alloc] initWithFrame:CGRectMake(448, 210, 266, 100) style:UITableViewStylePlain];
    
    _autotable3.delegate = (id)self;
    _autotable3.dataSource =(id) self;
    _autotable3.scrollEnabled = YES;
    _autotable3.hidden = YES;
    _autotable3.layer.borderColor=[UIColor blackColor].CGColor ;
    _autotable3.layer.borderWidth=2.0f;
    _autotable3.rowHeight=30;
    [self.view addSubview:_autotable3];
 
  
    
   

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     _updatebtn.enabled=YES;
   // [self Checknetavailabilty];
   [self JobsequenceSelect];
    
    [self SelectAllPhases];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    if (txtfldtype==1) {
    
    
    [_autocompletearray removeAllObjects];
    for(NSString * curString in _unitarray) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            
            [_autocompletearray addObject:curString];
            NSLog(@"%@",_autocompletearray);
            
        }
    }
    [_autotable reloadData];
    }
    
    if (txtfldtype==2) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _subunitarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable1 reloadData];
    }

    if (txtfldtype==3) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _equipmentarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable2 reloadData];
    }
    if (txtfldtype==4) {
        
        
        [_autocompletearray removeAllObjects];
        for(NSString * curString in _projectheaderarray) {
            NSRange substringRange = [curString rangeOfString:substring];
            if (substringRange.location == 0) {
                
                [_autocompletearray addObject:curString];
                NSLog(@"%@",_autocompletearray);
                
            }
        }
        [_autotable3 reloadData];
    }


}

#pragma mark-webservice
-(void)SelectAllPhases{
    p=@"Phase";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Phasesbasedonworktypeselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                    "<ServicesId>%d</ServicesId>\n"
                   "</Phasesbasedonworktypeselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_wrktypid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/Phasesbasedonworktypeselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UnitSelect{
   p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UnitSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</UnitSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/UnitSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SubUnitSelect{
    p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SubUnitSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SubUnitSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/SubUnitSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GeneralEquipmentSelect{
    p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralEquipmentSelect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</GeneralEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/GeneralEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ProjectHeaderselect{
    p=@"Other";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ProjectHeaderselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</ProjectHeaderselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/ProjectHeaderselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)JobsequenceSelect{
    p=@"Sequence";
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ServiceJobSequenceselect xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<SkillId>%d</SkillId>\n"
                   "</ServiceJobSequenceselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_skillsid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/ServiceJobSequenceselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)GeneralInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *totalhrs=0;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralInsert xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<Unit>%@</Unit>\n"
                   "<SubUnit>%@</SubUnit>\n"
                   "<Equipment>%@</Equipment>\n"
                   "<ProjectHeader>%@</ProjectHeader>\n"
                   "<Phase>%d</Phase>\n"
                   "<Description>%@</Description>\n"
                   "<TotalHoures>%f</TotalHoures>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<SequenceId>%d</SequenceId>\n"
                   "<Quantity>%d</Quantity>\n"
                   "<EquipmentHours>%d</EquipmentHours>\n"
                   "<GenPSItemCode>%@</GenPSItemCode>\n"
                   "</GeneralInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_unittxtfld.text,_subunittxtfld.text,_equipmnttxtfld.text,_prjcthdrtxtfld.text,[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue ],_destextview.text,[totalhrs floatValue],_Planid,[[_sequncedict objectForKey:_projectheaderbtnlbl.titleLabel.text]integerValue ],0,0,_psitemcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/GeneralInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)GeneralUpdates{
    recordResults = FALSE;
    NSString *soapMessage;
    
    NSString *totalhrs=0;
   _generalmdl=(Generalmodel *)[_generalarray objectAtIndex:0];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralUpdates xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "<Unit>%@</Unit>\n"
                   "<SubUnit>%@</SubUnit>\n"
                   "<Equipment>%@</Equipment>\n"
                   "<ProjectHeader>%@</ProjectHeader>\n"
                   "<Phase>%d</Phase>\n"
                   "<Description>%@</Description>\n"
                   
                   "<TotalHoures>%f</TotalHoures>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<SequenceId>%d</SequenceId>\n"
                   "<Quantity>%d</Quantity>\n"
                   "<EquipmentHours>%d</EquipmentHours>\n"
                    "<GenPSItemCode>%@</GenPSItemCode>\n"
                   "</GeneralUpdates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_genralid integerValue],_unittxtfld.text,_subunittxtfld.text,_equipmnttxtfld.text,_prjcthdrtxtfld.text,[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue ],_destextview.text,[_generalmdl.TotalHoures floatValue],_Planid,[[_sequncedict objectForKey:_projectheaderbtnlbl.titleLabel.text]integerValue ],[_generalmdl.Quantity integerValue],[_generalmdl.EquipmentHours integerValue],_psitemcode];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/GeneralUpdates" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
   
    if ([p isEqualToString:@"Phase"]) {
        
        //[self createphasedata];
        [_popovertableview reloadData];
        
        [self JobsequenceSelect];
        
           }
   else if([p isEqualToString:@"Sequence"])
    {
        //[self createsequenceDB];
        [_popovertableview reloadData];
        [self UnitSelect];
        [self SubUnitSelect];
        [self GeneralEquipmentSelect];
        [self ProjectHeaderselect];

    }
    else if([p isEqualToString:@"Other"])
    {
        [_popovertableview reloadData];
    }
   
        
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ProjectHeaderselectResult"])
    {
        _projectheaderarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"UnitSelectResult"])
    {
           _unitarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"SubUnitSelectResult"])
    {
        _subunitarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"GeneralEquipmentSelectResult"])
    {
        _equipmentarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"PhasesbasedonworktypeselectResponse"])
    {
        _phasearray=[[NSMutableArray alloc]init];
        _phasedict=[[NSMutableDictionary alloc]init];
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

    if([elementName isEqualToString:@"ServiceJobSequenceselectResponse"])
    {
        _sequencearray=[[NSMutableArray alloc]init];
          _sequncedict=[[NSMutableDictionary alloc]init];
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

    if([elementName isEqualToString:@"JobTask"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"GeneralInsertResult"])
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
    if([elementName isEqualToString:@"mainId"])
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
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        recordResults = FALSE;
        
        [_projectheaderarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        recordResults = FALSE;
        
        [_unitarray addObject:_soapResults];
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        recordResults = FALSE;
        [_subunitarray addObject:_soapResults];
        _soapResults = nil;


        
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        recordResults = FALSE;
        [_equipmentarray addObject:_soapResults];
        _soapResults = nil;
        
        }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        phasestrg=_soapResults;
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"PhaseName"])
    {
        
        recordResults = FALSE;
        [_phasearray addObject:_soapResults];
        [_phasedict setObject:phasestrg forKey:_soapResults];
        _soapResults = nil;

        
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        recordResults = FALSE;
        jobsequnce=_soapResults;
        _soapResults = nil;

        
    }
    
    if([elementName isEqualToString:@"JobTask"])
    {
        
        recordResults = FALSE;
        [_sequencearray addObject:_soapResults];
        [_sequncedict setObject:jobsequnce forKey:_soapResults];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        recordResults = FALSE;
     
        _soapResults = nil;
        
        
    }


    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        msgstrg=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:msgstrg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
         _updatebtn.enabled=YES;
//        _unittxtfld.text=@"";
//        _subunittxtfld.text=@"";
//        _equipmnttxtfld.text=@"";
//        _prjcthdrtxtfld.text=@"";
//        //_quantytxtfld.text=@"";
//        _destextview.text=@"";
        _manbtn.hidden=NO;
       _matbtn.hidden=NO;
        _eqmntbtn.hidden=NO;
//        [_phasebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
//        [_projectheaderbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"mainId"])
    {
        recordResults = FALSE;
        _insertedgeneralid=_soapResults;
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
    if(tableView==_autotable||tableView==_autotable1||tableView==_autotable2||tableView==_autotable3)
    {
               return [_autocompletearray count];
    }
    if (tableView==_popovertableview) {
        switch (poptype) {
            case 1:
                  return [_phasearray count];
                break;
            case 2:
                return [_sequencearray count];
                break;

            default:
                break;
        }
        
      
    }
   
     return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    }
    if (tableView==_autotable||tableView==_autotable1||tableView==_autotable2||tableView==_autotable3) {
      
        cell.textLabel.text=[_autocompletearray objectAtIndex:indexPath.row];
    }
    if (tableView==_popovertableview) {
        switch (poptype) {
            case 1:
               cell.textLabel.text=[_phasearray objectAtIndex:indexPath.row];
                break;
            case 2:
                 cell.textLabel.text=[_sequencearray objectAtIndex:indexPath.row];
               
                break;
                
            default:
                break;
        }

        
        
    }
    return cell;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView==_autotable) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _unittxtfld.text = selectedCell.textLabel.text;
       
        _autotable.hidden = YES;
    }
    if (tableView==_autotable1) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _subunittxtfld.text = selectedCell.textLabel.text;
        
        _autotable1.hidden = YES;
    }
    if (tableView==_autotable2) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _equipmnttxtfld.text = selectedCell.textLabel.text;
        
        _autotable2.hidden = YES;
    }

    if (tableView==_autotable3) {
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        _prjcthdrtxtfld.text = selectedCell.textLabel.text;
        
        _autotable3.hidden = YES;
    }
    if (tableView==_popovertableview) {
        switch (poptype) {
            case 1:
                [_phasebtnlbl setTitle:[_phasearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                break;
            case 2:
                [_projectheaderbtnlbl setTitle:[_sequencearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

                
                break;
                
            default:
                break;
        }

        [self.popovercontroller dismissPopoverAnimated:YES];
     
    }
    

    }




#pragma mark-Textfield Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_unittxtfld)
    {
         txtfldtype=1;
        
        _autotable.hidden = NO;
       
        NSString *substring = [NSString stringWithString:_unittxtfld.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_unittxtfld.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;

        
      
    }
    
    if(textField==_subunittxtfld)
    {
        txtfldtype=2;
        
        _autotable1.hidden = NO;
        
        
    
        NSString *substring = [NSString stringWithString:_subunittxtfld.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_subunittxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;

    }
    
    if(textField==_equipmnttxtfld)
    {
        txtfldtype=3;
        
        _autotable2.hidden = NO;
                     
        
        NSString *substring = [NSString stringWithString:_equipmnttxtfld.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_equipmnttxtfld.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;

        
    }
    if(textField==_prjcthdrtxtfld)
    {
        txtfldtype=4;
        
        _autotable3.hidden = NO;
        
        
        
        NSString *substring = [NSString stringWithString:_prjcthdrtxtfld.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteEntriesWithSubstring:substring];
        NSUInteger newLength = [_prjcthdrtxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
//    if(textField==_quantytxtfld)
//    {
//        NSUInteger newLength = [_quantytxtfld.text length] + [string length] - range.length;
//        return (newLength > 3) ? NO : YES;
//
//
//    }
    

    

    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    //Validation*val=[[Validation alloc]init];
    if(textField==_unittxtfld)
    {
        
        _autotable.hidden = YES;
    }
    if(textField==_subunittxtfld)
    {
        _autotable1.hidden = YES;
        
    }
    if(textField==_equipmnttxtfld)
    {
         _autotable2.hidden = YES;
    }
    if(textField==_prjcthdrtxtfld)
    {
         _autotable3.hidden = YES;
    }
//    if (textField==_quantytxtfld) {
//        
//        int value1=[val isNumeric:_quantytxtfld.text];
//        if (value1==0) {
//            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Qunatity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert1 show];
//            
//        }}

    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popovertableview)
        
    {
        return self.editing ;
    }
    return YES;
    
}

#pragma mark-textview Delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return _destextview.text.length + (text.length - range.length) <= 100;
}
#pragma mark-AlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Invalid Qunatity"]) {
        //_quantytxtfld.text=@"";
        
    }
    
    if([alertView.message isEqualToString:@"Updated Successfully"]){
        //[self dismissViewControllerAnimated:YES completion:nil];
        
    }

}
#pragma mark- Button Action
-(IBAction)closegeneralpage:(id)sender
{ _updatebtn.enabled=YES;
    if ([self.delegate respondsToSelector:@selector(updatedata)]) {
        [self.delegate updatedata];
        [self dismissViewControllerAnimated:YES completion:nil];

    }

   
    
   
}

- (IBAction)manpowerbtn:(id)sender {
    _updatebtn.enabled=YES;
    dragbutnindx=1;
    
        self.gdVCtrl=[[GdargViewController alloc]initWithNibName:@"GdargViewController" bundle:nil];
        if (_optionidentfr==1) {
        _gdVCtrl.generalid=[_insertedgeneralid integerValue];
    
}
else{
    _gdVCtrl.generalid=[_genralid integerValue];
  
}

  
    _gdVCtrl.dragbtnindx=dragbutnindx;
    self.gdVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_gdVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)equpmntbtn:(id)sender {
     _updatebtn.enabled=YES;
    self.deqctrl=[[DequipViewController alloc]initWithNibName:@"Dragequip" bundle:nil];
    _deqctrl.generalid=_genralid;
    [self presentViewController:_deqctrl
                       animated:YES completion:NULL];
    

}

- (IBAction)matreialbtn:(id)sender {
     _updatebtn.enabled=YES;
     dragbutnindx=2;
            self.gdVCtrl=[[GdargViewController alloc]initWithNibName:@"Gmateralview" bundle:nil];
   
    if (_optionidentfr==1) {
        _gdVCtrl.generalid=[_insertedgeneralid integerValue];
        
    }
    else{
        _gdVCtrl.generalid=[_genralid integerValue];
           }

      _gdVCtrl.dragbtnindx=dragbutnindx;
    self.gdVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_gdVCtrl
                       animated:YES completion:NULL];
}

- (IBAction)phasebtn:(id)sender {
    _autotable.hidden =YES;
    _autotable1.hidden=YES;
    _autotable2.hidden=YES;
    _autotable3.hidden=YES;
    
    poptype=1;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 300)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 260, 300)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(260, 300);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_phasebtnlbl.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
   
}

- (IBAction)projcthdrbtn:(id)sender {
    _autotable.hidden =YES;
    _autotable1.hidden=YES;
    _autotable2.hidden=YES;
    _autotable3.hidden=YES;

    poptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 260, 300)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 260, 300)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(260, 300);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_projectheaderbtnlbl.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
 

   }

- (IBAction)updatebtn:(id)sender {
    if (_optionidentfr==1) {
        
    if([_unittxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
                        
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Unit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
                    }

    else if ([_projectheaderbtnlbl.titleLabel.text isEqualToString:@"Select"]||[_projectheaderbtnlbl.titleLabel.text isEqualToString:@""])
                    {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Sequence is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                    
                    }

           else if([_phasebtnlbl.titleLabel.text isEqualToString:@"Select"]||[_phasebtnlbl.titleLabel.text isEqualToString:@""])
        {
           
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phase is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
                         else
                    {
                        _updatebtn.enabled=NO;
                        
                    [self GeneralInsert];
                        
                        
                    }
        
        
        
       
        
                   }

    
    else if (_optionidentfr==2){
        _manbtn.hidden=NO;
        _matbtn.hidden=NO;
        _eqmntbtn.hidden=NO;
        if([_unittxtfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Unit is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ([_projectheaderbtnlbl.titleLabel.text isEqualToString:@"Select"]||[_projectheaderbtnlbl.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Sequence is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
   
      else  if([_phasebtnlbl.titleLabel.text isEqualToString:@"Select"]||[_phasebtnlbl.titleLabel.text isEqualToString:@""])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phase is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
               else
        {
            _updatebtn.enabled=NO;
        [self GeneralUpdates];
        }
     
    }
}


//-(void)Checknetavailabilty{
//    /* for checking Connectivity*/
//    
//    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
//    _Availablityresult = [[NSString alloc] init];
//    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
//    NSLog(@"Internet connection availability : %@", _Availablityresult);
//    //    if ([_Availablityresult isEqualToString:@"Yes"]) {
//    //        //[self FetchManapowerdatasfromDB];
//    //
//    //        if ([_Sqlitearry count]>0) {
//    //            [self SynManpowertoserver];
//    //        }
//    //        else{
//    //            //[self Selectallmanpower];
//    //            [self AllSkills];
//    //        }
//    //
//    //
//    //    }
//         if([_Availablityresult isEqualToString:@"No"]){
//            [self Createdatabase];
//           [self fetchphase];
//             [self fetchsequencedata];
//             
//        
//            
//        }
//    else if ([_Availablityresult isEqualToString:@"Yes"])
//    
//        [self SelectAllPhases];
//    
//}


//#pragma mark-sqlite
//-(void)Createdatabase{
//    
//    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _docsDir = [_dirPaths objectAtIndex:0];
//    
//    /* Build the path to the database file*/
//    
//    _databasePath1 = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"GeneralList.db"]];
//    NSLog(@"Path %@",_databasePath1);
//    
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: _databasePath1 ] == NO)
//    {
//        const char *dbpath = [_databasePath1 UTF8String];
//        if (sqlite3_open(dbpath, &_newGenarallistDb) == SQLITE_OK)
//        {
//            char *errMsg;
//            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS GeneralList (ID INTEGER PRIMARY KEY AUTOINCREMENT, Unit TEXT, SubUnit TEXT, Equipment TEXT, ProjectHeader TEXT, Sequence TEXT, Phase TEXT, Description TEXT)";
//            
//            
//            if (sqlite3_exec(_newGenarallistDb, sql_stmt, NULL, NULL, &errMsg)
//                != SQLITE_OK)
//            {
//                
//                NSLog(@"Failed to create table");
//                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_newGenarallistDb));
//            }
//            sqlite3_close(_newGenarallistDb);
//            
//        }
//        
//        else {
//            NSLog( @"Failed to open/create database");
//            
//        }
//        
//    }
//}
//-(void)insertGeneralDetails{
//    sqlite3_stmt    *statement;
//    const char *dbpath = [_databasePath1 UTF8String];
//    
//    NSString *des=_destextview.text;
//    
//    if (sqlite3_open(dbpath, &_newGenarallistDb) == SQLITE_OK)
//    {
//        NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO GeneralList(Unit,SubUnit,Equipment,ProjectHeader,Sequence,Phase,Description) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",\"%d\",\"%d\",\"%@\")",_unittxtfld.text,_subunittxtfld.text,_equipmnttxtfld.text,_prjcthdrtxtfld.text,[[_sequncedict objectForKey:_projectheaderbtnlbl.titleLabel.text]integerValue],[[_phasedict objectForKey:_phasebtnlbl.titleLabel.text]integerValue ],des];
//       
//        
//        const char *insert_stmt = [InsertSQl UTF8String];
//        sqlite3_prepare_v2(_newGenarallistDb, insert_stmt, -1, &statement, NULL);
//        if (sqlite3_step(statement) == SQLITE_DONE)
//        {
//            
//            NSLog( @"Generaldata added");
//            
//        } else {
//            //status.text = @"Failed to add contact";
//            NSLog( @"Failed to add General Data ");
//        }
//        sqlite3_finalize(statement);
//        sqlite3_close(_newGenarallistDb);
//        
//    }
//   
//    
//}
//#pragma mark-sqlite
//-(void)createphasedata{
//    
//    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _docsDir = [_dirPaths objectAtIndex:0];
//    
//    /* Build the path to the database file*/
//    
//    _databasePath2 = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent:@"Phase.db"]];
//    NSLog(@"Path %@",_databasePath2);
//    
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: _databasePath2 ] == NO)
//    {
//        const char *dbpath = [_databasePath2 UTF8String];
//        if (sqlite3_open(dbpath, &_phasedb) == SQLITE_OK)
//        {
//            char *errMsg;
//            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS PhaseList (ID INTEGER PRIMARY KEY AUTOINCREMENT, PhaseID TEXT, PhaseName TEXT)";
//            
//            
//            if (sqlite3_exec(_phasedb, sql_stmt, NULL, NULL, &errMsg)
//                != SQLITE_OK)
//            {
//                
//                NSLog(@"Failed to create table");
//                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_phasedb));
//            }
//            sqlite3_close(_phasedb);
//            
//        }
//        
//        else {
//            NSLog( @"Failed to open/create database");
//            
//        }
//        
//    }
//    for (int i=0; i<[_phasearray count]; i++) {
//        _phasename = [_phasearray objectAtIndex:i];
//        _phaseid = [_phasedict objectForKey:[_phasearray objectAtIndex:i]];
//        [self insertphase];
//    }
//
//}
//-(void)createsequenceDB
//{
//    
//    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _docsDir = [_dirPaths objectAtIndex:0];
//    
//    /* Build the path to the database file*/
//    
//    _databasePath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent:@"Sequence.db"]];
//    NSLog(@"Path %@",_databasePath);
//    
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
//    {
//        const char *dbpath = [_databasePath UTF8String];
//        if (sqlite3_open(dbpath, &_sequenceDB) == SQLITE_OK)
//        {
//            char *errMsg;
//            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS SequenceList (ID INTEGER PRIMARY KEY AUTOINCREMENT, SequenceID TEXT, SequenceName TEXT)";
//            
//            
//            if (sqlite3_exec(_sequenceDB, sql_stmt, NULL, NULL, &errMsg)
//                != SQLITE_OK)
//            {
//                
//                NSLog(@"Failed to create table");
//                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_sequenceDB));
//            }
//            sqlite3_close(_sequenceDB);
//            
//        }
//        
//        else {
//            NSLog( @"Failed to open/create database");
//            
//        }
//        
//    }
//    for (int i=0; i<[_sequencearray count]; i++) {
//        _sequencename = [_sequencearray objectAtIndex:i];
//        _sequenceid = [_sequncedict objectForKey:[_sequencearray objectAtIndex:i]];
//        [self insertsequnecedatatodb];
//    }
//    
//}
//-(void)insertphase
//{
//    sqlite3_stmt    *statement;
//    const char *dbpath = [_databasePath2 UTF8String];
//    
//   
//    
//    if (sqlite3_open(dbpath, &_phasedb) == SQLITE_OK)
//    {
//        NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO PhaseList(PhaseID,PhaseName) VALUES (\"%@\",\"%@\")",_phaseid,_phasename];
//        
//        
//        const char *insert_stmt = [InsertSQl UTF8String];
//        sqlite3_prepare_v2(_phasedb, insert_stmt, -1, &statement, NULL);
//        if (sqlite3_step(statement) == SQLITE_DONE)
//        {
//            
//            NSLog( @"phasedata added");
//            
//        } else {
//            //status.text = @"Failed to add contact";
//            NSLog( @"Failed to add phase Data ");
//        }
//        sqlite3_finalize(statement);
//        sqlite3_close(_phasedb);
//        
//    }
//    
//    
//}
//-(void)insertsequnecedatatodb
//{
//    {
//        sqlite3_stmt    *statement;
//        const char *dbpath = [_databasePath UTF8String];
//        
//        
//        
//        if (sqlite3_open(dbpath, &_sequenceDB) == SQLITE_OK)
//        {
//            NSString *InsertSQl=[NSString stringWithFormat:@"INSERT INTO SequenceList(SequenceID,SequenceName) VALUES (\"%@\",\"%@\")",_sequenceid,_sequencename];
//            
//            
//            const char *insert_stmt = [InsertSQl UTF8String];
//            sqlite3_prepare_v2(_sequenceDB, insert_stmt, -1, &statement, NULL);
//            if (sqlite3_step(statement) == SQLITE_DONE)
//            {
//                
//                NSLog( @"SequenceData added");
//                
//            } else {
//                //status.text = @"Failed to add contact";
//                NSLog( @"Failed to add Sequence Data ");
//            }
//            sqlite3_finalize(statement);
//            sqlite3_close(_sequenceDB);
//            
//        }
//        
//        
//    }
//}
//-(void)fetchphase{
//    
//    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _docsDir = [_dirPaths objectAtIndex:0];
//    
//    /* Build the path to the database file*/
//    
//    _databasePath2 = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"Phase.db"]];
//    NSLog(@"Path %@",_databasePath2);
//    
//    const char *dbpath = [_databasePath2 UTF8String];
//    sqlite3_stmt    *statement;
//    
//    if (sqlite3_open(dbpath, &_phasedb) == SQLITE_OK)
//    {
//        
//        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM PhaseList"];
//        // NSLog(@"Sql%@",querySQL);
//        const char *query_stmt = [querySQL UTF8String];
//        
//        if (sqlite3_prepare_v2(_phasedb, query_stmt, -1, &statement, NULL) == SQLITE_OK)
//        {
//            // NSLog(@"sqlite %@",sqlite3_step(statement));
//            _phasearray=[[NSMutableArray alloc]init];
//             _phasedict=[[NSMutableDictionary alloc]init];
//            while (sqlite3_step(statement) == SQLITE_ROW)
//                
//                
//            {
//                
//                const char* key = (const char*)sqlite3_column_text(statement, 0);
//                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
//                
//                const char* pid = (const char*)sqlite3_column_text(statement, 1);
//               NSString *sqlitephase = pid == NULL ? nil : [[NSString alloc] initWithUTF8String:pid];
//                
//                
//                const char*pname = (const char*)sqlite3_column_text(statement, 2);
//                NSString *sqlitephasename= pname== NULL ? nil : [[NSString alloc] initWithUTF8String:pname];
//                [_phasedict setObject:sqlitephase forKey:sqlitephasename];
//                
//                
//                
//                [_phasearray addObject:sqlitephasename];
//                
//                
//            }
//            
//            
//            
//            
//            
//        }
//        sqlite3_finalize(statement);
//        
//    }
//    sqlite3_close(_phasedb);
//    [_popovertableview reloadData];
//
//    
//}
//-(void)fetchsequencedata
//{
//    
//    _dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _docsDir = [_dirPaths objectAtIndex:0];
//    
//    /* Build the path to the database file*/
//    
//    _databasePath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"Sequence.db"]];
//    NSLog(@"Path %@",_databasePath);
//    
//    const char *dbpath = [_databasePath UTF8String];
//    sqlite3_stmt    *statement;
//    
//    if (sqlite3_open(dbpath, &_sequenceDB) == SQLITE_OK)
//    {
//        
//        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM SequenceList"];
//        // NSLog(@"Sql%@",querySQL);
//        const char *query_stmt = [querySQL UTF8String];
//        
//        if (sqlite3_prepare_v2(_sequenceDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
//        {
//            // NSLog(@"sqlite %@",sqlite3_step(statement));
//            _sequencearray=[[NSMutableArray alloc]init];
//            _sequncedict=[[NSMutableDictionary alloc]init];
//            while (sqlite3_step(statement) == SQLITE_ROW)
//                
//                
//            {
//                
//                const char* key = (const char*)sqlite3_column_text(statement, 0);
//                NSString *pkey= key == NULL ? nil : [[NSString alloc] initWithUTF8String:key];
//                
//                const char* sid = (const char*)sqlite3_column_text(statement, 1);
//                NSString *sqliteSequence = sid == NULL ? nil : [[NSString alloc] initWithUTF8String:sid];
//                
//                
//                const char*sname = (const char*)sqlite3_column_text(statement, 2);
//                NSString *sqlitesequencename= sname== NULL ? nil : [[NSString alloc] initWithUTF8String:sname];
//                [_sequncedict setObject:sqliteSequence forKey:sqlitesequencename];
//                
//                
//                
//                [_sequencearray addObject:sqlitesequencename];
//                
//                
//            }
//            
//            
//            
//            
//            
//        }
//        sqlite3_finalize(statement);
//        
//    }
//    sqlite3_close(_sequenceDB);
//    [_popovertableview reloadData];
//    
//    
//}



@end
