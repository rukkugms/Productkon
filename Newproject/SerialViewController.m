//
//  SerialViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SerialViewController.h"

@interface SerialViewController ()

@end

@implementation SerialViewController

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
    _sequencetable.layer.borderWidth=3.0;
    _sequencetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _addview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self JobsequenceSelect];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Tableview UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    //return [_resurcearray count];
    return [_sequencearray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [[NSBundle mainBundle]loadNibNamed:@"Snumcell" owner:self options:nil];
        cell=_resurcecell;
    }
    
    NumbrSerMdl*seqmdl=(NumbrSerMdl *)[_sequencearray objectAtIndex:indexPath.row];
    
    _seqnolabel=(UILabel *)[cell viewWithTag:1];
    _seqnolabel.text=seqmdl.SequenceNumber;
    _jobtask=(UILabel*)[cell viewWithTag:2];
    _jobtask.text=seqmdl.JobTask;
    
    return cell;
    
    
}

#pragma mark-Tableview UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f]];
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self JobSequenceDelete];
        [_sequencearray removeObject:indexPath];
        
        
        
        
        
    }
    
}


#pragma mark - webservice
-(void)JobsequenceSelect{
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
                   "</soap:Envelope>\n",_skillid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     //NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
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

-(void)JobSequenceInsert
{
    webtype=1;
    recordResults = FALSE;
    NSString *seqno=_seqnotextfld.text;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobSequenceInsert xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<JobTask>%@</JobTask>\n"
                   "<SkillId>%d</SkillId>\n"
                   "<SequenceNumber>%d</SequenceNumber>\n"
                   "</JobSequenceInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_jobtasktextfld.text,_skillid,[seqno integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/JobSequenceInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)JobSequenceUpdate
{
    webtype=1;
    recordResults = FALSE;
    NumbrSerMdl*smdl=(NumbrSerMdl *)[_sequencearray objectAtIndex:btnindex];
    NSString *seqno=_seqnotextfld.text;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobSequenceUpdate xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<JobSequenceId>%d</JobSequenceId>\n"
                   "<JobTask>%@</JobTask>\n"
                   "<SkillId>%d</SkillId>\n"
                   "<SequenceNumber>%d</SequenceNumber>\n"
                   "</JobSequenceUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",smdl.JobSequenceId,_jobtasktextfld.text,_skillid,[seqno integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
   NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/JobSequenceUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)JobSequenceDelete
{    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    NumbrSerMdl*smdl=(NumbrSerMdl *)[_sequencearray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobSequenceDelete xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<JobSequenceId>%d</JobSequenceId>\n"
                   "</JobSequenceDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",smdl.JobSequenceId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://testUSA.kontract360.com/JobSequenceDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_sequencetable reloadData];
    if (webtype==1||webtype==3) {
        [self JobsequenceSelect];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ServiceJobSequenceselectResponse"])
    {
        _sequencearray=[[NSMutableArray alloc]init];
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

    if([elementName isEqualToString:@"SkillId"])
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
    if ([elementName isEqualToString:@"JobSequenceInsertResult"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"JobSequenceUpdate"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    
    
    if ([elementName isEqualToString:@"result"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
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
    if([elementName isEqualToString:@"ServiceJobSequenceselectResponse"])
    {
        
        recordResults = FALSE;
        
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobSequenceId"])
    {
        
        recordResults = FALSE;
        _seqmdl=[[NumbrSerMdl alloc]init];
        _seqmdl.JobSequenceId=[_soapResults integerValue];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobTask"])
    {
        
        recordResults = FALSE;
        _seqmdl.JobTask=_soapResults;
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"SkillId"])
    {
        
        recordResults = FALSE;
        _seqmdl.SkillId=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SequenceNumber"])
    {
        
        recordResults = FALSE;
        
        _seqmdl.SequenceNumber=_soapResults;
        [_sequencearray addObject:_seqmdl];
        _soapResults = nil;
    }
    if ([elementName isEqualToString:@"result"]) {
        
        recordResults=FALSE;
        _displaystring=_soapResults;
        if (webtype==1) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        _soapResults=nil;
    }




}


#pragma mark-IBAction

- (IBAction)addclsebtn:(id)sender {
    _addview.hidden=YES;
      _sequencetable.userInteractionEnabled=YES;
}

- (IBAction)editbtn:(id)sender {
    //[super setEditing:NO animated:NO];
    //[_sequencetable setEditing:NO animated:NO];
   // [_sequencetable reloadData];
    _sequencetable.userInteractionEnabled=NO;

    _addview.hidden=NO;
    optionidentifier=2;
    _navbar.title=@"Edit";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.sequencetable];
    NSIndexPath *textFieldIndexPath = [self.sequencetable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    NumbrSerMdl*smdl=(NumbrSerMdl *)[_sequencearray objectAtIndex:textFieldIndexPath.row];
    
    _seqnotextfld.text=smdl.SequenceNumber;
    _jobtasktextfld.text=smdl.JobTask;

}
-(IBAction)addsequence:(id)sender
{
    //[super setEditing:NO animated:NO];
  //  [_sequencetable setEditing:NO animated:NO];
      _sequencetable.userInteractionEnabled=NO;
   // [_sequencetable reloadData];
    _addview.hidden=NO;
    optionidentifier=1;
    _navbar.title=@"Create";
    _seqnotextfld.text=@"";
    _jobtasktextfld.text=@"";
    
}
- (IBAction)clsebtn:(id)sender {
    _seqnotextfld.text=@"";
    _jobtasktextfld.text=@"";
_addview.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancel:(id)sender
{
    _seqnotextfld.text=@"";
    _jobtasktextfld.text=@"";
}

- (IBAction)updatebtn:(id)sender {
    
    Validation*val=[[Validation alloc]init];
    int value1=[val isNumeric:_seqnotextfld.text];
    if(value1==0)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Sequence Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert1 show];
        
        
    }
    else if ([_seqnotextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Sequence Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else if ([_jobtasktextfld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length ==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Job Task is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    

    
    
    else
    {

    
    if (optionidentifier==1)
    {
        [self JobSequenceInsert];
    }
    
    else if (optionidentifier==2)
    {
        [self JobSequenceUpdate];
        
    }
  }
}
-(IBAction)deleteAction:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_sequencetable setEditing:NO animated:NO];
        [_sequencetable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_sequencetable setEditing:YES animated:YES];
        [_sequencetable reloadData];
        
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
       if ([alertView.message isEqualToString:_displaystring]) {
        
        
        
        if (buttonIndex==0) {
            if (optionidentifier==1) {
                
            
            
            
            _seqnotextfld.text=@"";
            _jobtasktextfld.text=@"";
                 _sequencetable.userInteractionEnabled=YES;
            }
            
            else if(optionidentifier==2)
            {
                _seqnotextfld.text=@"";
                _jobtasktextfld.text=@"";
                _addview.hidden=YES;
                  _sequencetable.userInteractionEnabled=YES;
            }
            
        }
    }
    if([alertView.message isEqualToString:@"Invalid Sequence Number"])
    {
        
        _seqnotextfld.text=@"";
    }

    
    
    
    
    
    
}
#pragma mark-Textfield Delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_seqnotextfld)
    {
        NSUInteger newLength = [_seqnotextfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    return YES;
}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    
//    Validation*val=[[Validation alloc]init];
//    if(textField==_seqnotextfld)
//    {
//        int value1=[val isBlank:_seqnotextfld.text];
//        if(value1==0)
//        {
//            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Sequence Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert1 show];
//            
//        }
//    }
//    return YES;
//}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_seqnotextfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_seqnotextfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Sequence Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }

}
@end
