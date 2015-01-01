//
//  MarkupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MarkupViewController.h"

@interface MarkupViewController ()

@end

@implementation MarkupViewController

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
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    

     self.openviewindex=NSNotFound;
    
    self.markuptableviewtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    self.recordtableviewtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];

    _markuptable.layer.borderWidth=2;
    _markuptable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f].CGColor;
    _recordtable.layer.borderWidth=2;
    _recordtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{[_markupbutton setTitle:@"Select" forState:UIControlStateNormal];
    _defaultlbl.text=@"";
    _markuptablearray=[[NSMutableArray alloc]init];
    _detailmarkuparray=[[NSMutableArray alloc]init];
     self.openviewindex=NSNotFound;
    [super viewWillAppear:animated];
    [self SelectMarkupMaster];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closemarkuppage:(id)sender
{
    [_markupbutton setTitle:@"Select" forState:UIControlStateNormal];
    self.openviewindex=NSNotFound;
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)markupselection:(id)sender
{
    [self createpopover];
}

-(void)createpopover
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    self.popovercontroller.popoverContentSize=CGSizeMake(210.0f, 200.0f);
    self.popovercontroller=_popovercontroller;
    [self.popovercontroller presentPopoverFromRect:_markupbutton.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

}
#pragma mark-Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popovertableview) {
        return [_markuparray count];
    }
    if (tableView==_markuptable) {
        return [_markuptablearray count];
    }
    if (tableView==_recordtable) {
        return [_detailmarkuparray count];
    }
           return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (tableView==_markuptable) {
        [[NSBundle mainBundle]loadNibNamed:@"markupcell" owner:self options:nil];
        cell=_markupcell;
    }
    if (tableView==_recordtable) {
        [[NSBundle mainBundle]loadNibNamed:@"Recordcustomcell" owner:self options:nil];
        cell=_recordcell;
    }

    
    
    if (tableView==_popovertableview)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[_markuparray objectAtIndex:indexPath.row]];
        
        
    }
    if (tableView==_markuptable)
    {
        Mastermarkmodel *markmdl=(Mastermarkmodel*)[_markuptablearray objectAtIndex:indexPath.row];
        _markupnamelabel=(UILabel*)[cell viewWithTag:1];
        _markupnamelabel.text=mark;
        _stpercentlabel=(UILabel*)[cell viewWithTag:2];
        _stpercentlabel.text=markmdl.STPer;
        _stdollerlabel=(UILabel*)[cell viewWithTag:3];
        _stdollerlabel.text=[NSString stringWithFormat:@"$%@",markmdl.STDoll];
        _otpercentlabel=(UILabel*)[cell viewWithTag:4];
        _otpercentlabel.text=markmdl.OTPer;
        _otdollerlabel=(UILabel*)[cell viewWithTag:5];
        _otdollerlabel.text=[NSString stringWithFormat:@"$%@",markmdl.OTDoll];
       

    }
    if (tableView==_recordtable)
    {
         Markupmainmodel *mainmark=(Markupmainmodel*)[_detailmarkuparray objectAtIndex:indexPath.row];
        _mainheaderlabel=(UILabel*)[cell viewWithTag:1];
        _mainheaderlabel.text=mainmark.MainHeader;
        _variablepercentlabel=(UILabel*)[cell viewWithTag:2];
        _variablepercentlabel.text=mainmark.VariablePercent;
        _fixeddollerlabel=(UILabel*)[cell viewWithTag:3];
        _fixeddollerlabel.text=[NSString stringWithFormat:@"$%@",mainmark.FixedDollar];
        _STPERlabel=(UILabel*)[cell viewWithTag:4];
        _STPERlabel.text=mainmark.STPer;
        _STDOLLlabel=(UILabel*)[cell viewWithTag:5];
        _STDOLLlabel.text=[NSString stringWithFormat:@"$%@",mainmark.STDoll];
        _OTPERlabel=(UILabel*)[cell viewWithTag:6];
        _OTPERlabel.text=mainmark.OTPer;
        _STDOLLlabel=(UILabel*)[cell viewWithTag:7];
        _STDOLLlabel.text=[NSString stringWithFormat:@"$%@",mainmark.OTDoll];
        carbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        [carbutton setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
        carbutton.tag=indexPath.row;
        [carbutton addTarget:self action:@selector(showactions:) forControlEvents:UIControlEventTouchUpInside];
        carbutton.frame = CGRectMake(230.0, 1.0, 50.0, 40.0);
        [cell.contentView addSubview:carbutton];
    }

    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview)
    {
        Fstmarkmdl *first=(Fstmarkmdl*)[_listarray objectAtIndex:indexPath.row];
        if ([first.CompanyStd isEqualToString:@"true"]) {
            [_markupbutton setTitle:[_markuparray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
            mark=[_markuparray objectAtIndex:indexPath.row];
            _defaultlbl.text=@"Default Mark Up";
            
        }
        else
        {
        [_markupbutton setTitle:[_markuparray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
            mark=[_markuparray objectAtIndex:indexPath.row];
            _defaultlbl.text=@"";

        }
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
    [self TotalMarkupselect];
    [self MarkupMain1select];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_recordtable) {
        
    
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
    }
}

-(void)showactions:(UIButton*)sender{
        button = (UIButton *)sender;
       // UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
        CGPoint center= button.center;
        CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.recordtable];
        NSIndexPath *textFieldIndexPath = [self.recordtable indexPathForRowAtPoint:rootViewPoint];
        NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
        btnindex=textFieldIndexPath.row;
    Markupmainmodel *mainmark=(Markupmainmodel*)[_detailmarkuparray objectAtIndex:btnindex];
    if (!self.markVctrlr) {
        self.markVctrlr=[[DetailmarkupsectionViewController alloc]initWithNibName:@"DetailmarkupsectionViewController" bundle:nil];
    }
    _markVctrlr.modalPresentationStyle = UIModalPresentationPageSheet;
    _markVctrlr.mainid=mainmark.EntryId;
    _markVctrlr.mainheader=mainmark.MainHeader;
    [self presentViewController:_markVctrlr
                       animated:YES completion:NULL];

}
//    // [_animatedview removeFromSuperview];
//    _detaillabel.hidden=YES;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//        .frame =  CGRectMake(260, 10, 0, 0);} completion:nil];
//    
//    _animatedview.hidden=YES;
//    //Empmdl *empmdl=(Empmdl *)[_employeelistarray objectAtIndex:sender.tag];
//    
//    
//    
//    
//    button = (UIButton *)sender;
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    CGPoint center= button.center;
//    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.recordtable];
//    NSIndexPath *textFieldIndexPath = [self.recordtable indexPathForRowAtPoint:rootViewPoint];
//    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//    btnindex=textFieldIndexPath.row;
//    
//    
//    
//    //create uiview
//    _animatedview=[[UIView alloc]initWithFrame:CGRectMake(260, 10, 0, 25)];
//    _animatedview.backgroundColor=[UIColor colorWithRed:99.0/255.0f green:184.0/255.0f blue:255.0/255.0f alpha:1.0f];
//    _detaillabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 25)];
//    _detaillabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
//    _detaillabel.textColor=[UIColor blackColor];
//    _detaillabel.text=@"Subheaders";
//    [self.animatedview addSubview:_detaillabel];
//    
//    _detaillabel.hidden=YES;
//    
//    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(opendetailpage)];
//    [self.animatedview addGestureRecognizer:tap];
//    [cell addSubview:_animatedview];
//    
//    _animatedview.hidden=NO;
//    [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
//        .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
//    
//    _detaillabel.hidden=NO;
//    //    NSLog(@"%@",empmdl.badgeflag);
//    //    if ([empmdl.badgeflag isEqualToString:@"true"]) {
//    //        //_badgelbl.enabled=NO;
//    //        _animatedview.userInteractionEnabled=NO;
//    //        //_animatedview.
//    //
//    //    }
//    
//    [self showviewWithUserAction:YES];
//}
//
//-(void)showviewWithUserAction:(BOOL)userAction{
//    
//    // Toggle the disclosure button state.
//    
//    carbutton.selected = !carbutton.selected;
//    
//    if (userAction) {
//        if (carbutton.selected) {
//            _animatedview.hidden=NO;
//            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
//                .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
//            [self viewopened:btnindex];
//            _detaillabel.hidden=NO;
//            
//            
//            
//        }
//        else{
//            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
//                .frame =  CGRectMake(260, 10, 70, 25);} completion:nil];
//            [self viewclosed:btnindex];
//            //_venderlbl.hidden=YES;
//            
//        }
//        
//        
//    }
//}
//-(void)viewopened:(NSInteger)viewopened{
//    
//    
//    selectedcell=viewopened;
//    NSInteger previousOpenviewIndex = self.openviewindex;
//    
//    if (previousOpenviewIndex != NSNotFound) {
//        [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{  _animatedview
//            .frame =  CGRectMake(260, 10, 0, 0);} completion:nil];
//        
//        _animatedview.hidden=YES;
//        
//        
//        // }
//        
//        
//    }
//    
//    self.openviewindex=viewopened;
//    
//    
//    
//    
//    
//    
//}
//-(void)viewclosed:(NSInteger)viewclosed
//{
//    
//    viewclosed=btnindex;
//    
//    self.openviewindex = NSNotFound;
//    
//    
//}
-(void)opendetailpage
{Markupmainmodel *mainmark=(Markupmainmodel*)[_detailmarkuparray objectAtIndex:selectedcell];
    if (!self.markVctrlr) {
        self.markVctrlr=[[DetailmarkupsectionViewController alloc]initWithNibName:@"DetailmarkupsectionViewController" bundle:nil];
    }
    _markVctrlr.modalPresentationStyle = UIModalPresentationPageSheet;
    _markVctrlr.mainid=mainmark.EntryId;
    [self presentViewController:_markVctrlr
                       animated:YES completion:NULL];
    

}


#pragma mark-Webservices
-(void)SelectMarkupMaster
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectMarkupMaster xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectMarkupMaster>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectMarkupMaster" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
-(void)TotalMarkupselect
{
    NSString *markupid=[_markupdict objectForKey:mark];
    NSLog(@"%@",mark);

    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<TotalMarkupselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MarkupID>%d</MarkupID>\n"
                   "</TotalMarkupselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[markupid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/TotalMarkupselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}

-(void)MarkupMain1select
{
    
    NSString *markupid=[_markupdict objectForKey:mark];
    NSLog(@"%@",mark);
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<MarkupMain1select xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MarkupID>%d</MarkupID>\n"
                   "</MarkupMain1select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[markupid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/MarkupMain1select" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}

#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webdata setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webdata appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Your Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webdata length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webdata mutableBytes] length:[_webdata length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webdata];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_popovertableview reloadData];
    [_markuptable reloadData];
    [_recordtable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"SelectMarkupMasterResponse"])
    {
        _markuparray=[[NSMutableArray alloc]init];
        _markupdict=[[NSMutableDictionary alloc]init];
        _listarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupEntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"MarkUpName"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CompanyStd"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"TotalMarkupselectResponse"])
    {
        _markuptablearray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STDoll"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTDoll"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupMain1selectResponse"])
    {
        _detailmarkuparray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"MarkupID"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"MainHeader"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"VariablePercent"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"FixedDollar"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STPER"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STDOLL"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTPER"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTDOLL"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }



   





    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"MarkupEntryId"]) {
        
        recordResults=FALSE;
        _firstmdl=[[Fstmarkmdl alloc]init];
        _firstmdl.MarkupEntryId=_soapresults;
        _markupstring=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MarkUpName"]) {
        
        recordResults=FALSE;
        [_markupdict setObject:_markupstring forKey:_soapresults];
        [_markuparray addObject:_soapresults];
        _firstmdl.MarkUpName=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"CompanyStd"]) {
        
        recordResults=FALSE;
         _firstmdl.CompanyStd=_soapresults;
        [_listarray addObject:_firstmdl];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"TotalMarkupselectResult"]) {
       
        recordResults=FALSE;
        
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STPer"]) {
        _master=[[Mastermarkmodel alloc]init];
        recordResults=FALSE;
        _master.STPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STDoll"]) {
        
        recordResults=FALSE;
        _master.STDoll=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"OTPer"]) {
        
        recordResults=FALSE;
        _master.OTPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"OTDoll"]) {
        
        recordResults=FALSE;
        _master.OTDoll=_soapresults;
        [_markuptablearray addObject:_master];
        _soapresults=nil;
    }
    
    if ([elementName isEqualToString:@"MarkupMain1selectResponse"])
    {
        recordResults=FALSE;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"EntryId"])
    {
        _mainmarkmodel=[[Markupmainmodel alloc]init];
        
        recordResults=FALSE;
        _mainmarkmodel.EntryId=[_soapresults integerValue];
        _soapresults=nil;

        
    }
    
    if ([elementName isEqualToString:@"MarkupID"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.MarkupID=[_soapresults integerValue];
        _soapresults=nil;
    }
    
    if ([elementName isEqualToString:@"MainHeader"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.MainHeader=_soapresults;
        _soapresults=nil;
        
    }
    
    if ([elementName isEqualToString:@"VariablePercent"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.VariablePercent=_soapresults;
        _soapresults=nil;
        
    }
    
    if ([elementName isEqualToString:@"FixedDollar"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.FixedDollar=_soapresults;
        _soapresults=nil;    }
    
    if ([elementName isEqualToString:@"STPER"])
    {
        recordResults=FALSE;
        _mainmarkmodel.STPer=_soapresults;
        _soapresults=nil;    }
    
    if ([elementName isEqualToString:@"STDOLL"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.STDoll=_soapresults;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"OTPER"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.OTPer=_soapresults;
        _soapresults=nil;
        
    }
    if ([elementName isEqualToString:@"OTDOLL"])
    {
        
        recordResults=FALSE;
        _mainmarkmodel.OTDoll=_soapresults;
        [_detailmarkuparray addObject:_mainmarkmodel];
        _soapresults=nil;
        
    }


}



@end
