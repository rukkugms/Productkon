//
//  DrawingViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController
@synthesize delegate,newdelegate;

@synthesize drawingView = _drawingView;
@synthesize eraserButton = _eraserButton;
@synthesize eraserActived = _eraserActived;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _activityindctr.hidden=YES;
    
    // Do any additional setup after loading the view from its nib.
        if (_viewclck==1) {
            
            
            _deletebtnlbl.hidden=YES;
            _savebtnlbl.hidden=YES;
            _eraserButton.hidden=YES;
            
//            if (_tabtype==3||_tabtype==4) {
//                _deletebtnlbl.hidden=YES;
//                _savebtnlbl.hidden=YES;
//                _eraserButton.hidden=YES;
//            }
         [self.view setBackgroundColor:[UIColor whiteColor]];
       // [self.mylineview removeFromSuperview];
        //_mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
       // _mylineview.backgroundColor=[UIColor clearColor];
       // [self.newview addSubview:_mylineview];
        
        
      //  [_mylineview setBackgroundColor:[UIColor colorWithPatternImage:_editedimage]];
             self.drawingView.userInteractionEnabled=NO;
 //[self.drawingView removeFromSuperview];
             [_drawingView setBackgroundColor:[UIColor colorWithPatternImage:_editedimage]];
           
            
    }
    else{
//        [self.view setBackgroundColor:[UIColor whiteColor]];
//        
//        brush=1;
//        
//        btnclick=0;
//        
//        // Do any additional setup after loading the view from its nib.
//        red = 0.0/255.0;
//        green = 0.0/255.0;
//        blue = 0.0/255.0;
//        brush = 15.0;
//        opacity = 1.0;
//        
//        _newview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
//        _newview.layer.borderWidth=5.0;
//        
//        
//        _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 939)];
//        _mylineview.backgroundColor=[UIColor clearColor];
//        _mylineview.delegate = self;
//        //_mylineview.delegate=newbdelegate;
//    
//        
//        _mylineview.brushPattern=[UIColor colorWithRed:102.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1];
//        [self.newview addSubview:_mylineview];
        
        _drawingView=[[BezierInterpView alloc]init];
        
        self.drawingView.userInteractionEnabled=YES;
         [self.view setBackgroundColor:[UIColor whiteColor]];
        _newview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
        _newview.layer.borderWidth=5.0;
        [self.newview addSubview:_drawingView];
         _eraserActived = YES;
       


    }
    
}




-(void)viewWillAppear:(BOOL)animated{
   
    [super viewWillAppear:animated];
    _activityindctr.hidden=YES;
}
-(void)viewDidLayoutSubviews{
    myPath=[[UIBezierPath alloc]init];
    myPath.lineCapStyle=kCGLineCapRound;
    myPath.miterLimit=0;
    myPath.lineWidth=6;
    
    
    
}
- (void)viewDidUnload
{
    [self setMainimg:nil];
    [self setTempimg:nil];
    [super viewDidUnload];
      // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-webservice

-(void)AccebilityUploadPlanDrawings{
    recordResults = FALSE;
   NSString*filename;
    
    NSString *soapMessage;
    
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];
        //filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",curntdate,_savename];
    }
    else
    {
        filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
        //  filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",_datestrg,_savename];
    }

    
   //  NSString*filename=[NSString stringWithFormat:@"%@.jpg",_savename];
     NSString * plantrimmestrg=[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
   //  NSString *filename =[NSString stringWithFormat:@"Drawings/%@-%@-%@.jpg",plantrimmestrg,@"Accessibility",_savename];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,plantrimmestrg,@"Accessibility"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmentUploadPlanDrawings{
    recordResults = FALSE;
    
       NSString * trimmestrg=[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSString*filename;
    
   
    
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];
        //filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",curntdate,_savename];
    }
    else
    {
        filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
        //  filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",_datestrg,_savename];
    }
    

    NSString *soapMessage;
  //  NSString*filename=[NSString stringWithFormat:@"%@.jpg",_savename];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,trimmestrg,@"Equipment"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MeetingUploadPlanDrawings{
    recordResults = FALSE;
    NSString*filename;
    
    NSString *soapMessage;
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
    filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];
//filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",curntdate,_savename];
    }
    else
    {
    filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
       //  filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",_datestrg,_savename];
}
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:filename forKey:@"filename"];
    [defaults synchronize];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,_planid,@"Meeting"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)NotesUploadPlanDrawings{
    recordResults = FALSE;
    NSString*filename;
    
    NSString *soapMessage;
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];
        // filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",curntdate,_savename];
    }
    else
    {
        filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
         //filename=[NSString stringWithFormat:@"%@-%@-%@-%@.jpg",[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],@"Meeting",_datestrg,_savename];
    }

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:filename forKey:@"filename"];
    [defaults synchronize];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,_planid,@"Notes"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
   
    
    }
#pragma mark-XML Parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"UploadPlanDrawingsResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"msg"])
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
    if([elementName isEqualToString:@"msg"])
    {
        recordResults = FALSE;
//        [self.mylineview removeFromSuperview];
//        _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
//        _mylineview.backgroundColor=[UIColor clearColor];
//        [self.newview addSubview:_mylineview];
        

        [self saveaction];
       
        
        _soapResults = nil;
        
        }
    
}
- (IBAction)clsebtn:(id)sender {
           [self dismissViewControllerAnimated:YES completion:nil];
    
   
   
}
-(void)saveaction{
    
    _activityindctr.hidden=YES;
    [_activityindctr stopAnimating];
//    if ([_textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length==0) {
//        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
    //else{
    
//    if (_tabtype==1) {
//        
//if ([self.delegate respondsToSelector:@selector(toreloaddrawings)]) {
//        [self.delegate toreloaddrawings];
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//    
//    }
//    
//      }
    
    if (_tabtype==3||_tabtype==4||_tabtype==2||_tabtype==1) {
        
        if ([self.newdelegate respondsToSelector:@selector(updatingtables)]) {
            [self.newdelegate updatingtables];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
                  }
        
    }
 

    
}


- (IBAction)deletebtn:(id)sender {
   
   // [self.drawingView clearview];
    //[self.newview removeFromSuperview];
    
  
    
       //[_drawingView setNeedsDisplay];
    
    //_drawingView.incrementalImage=nil;
       
//    if(_drawingView.incrementalImage){
//        _drawingView.incrementalImage = FALSE;
//        [_drawingView setNeedsDisplay];
//        
//        _eraserActived = NO;
//    
//        
//        [self sendNotification];
//        
//    }
    
    
  
    
    


}

- (IBAction)savebtn:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save As" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
  
    CGRect frame = CGRectMake(14, 45, 255, 23);
    _textField = [[UITextField alloc] initWithFrame:frame];
    _textField.placeholder = @"";
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.autocorrectionType = UITextAutocorrectionTypeDefault;
    _textField.keyboardType = UIKeyboardTypeAlphabet;
   _textField.returnKeyType = UIReturnKeyDone;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing; // has 'x' button to the right
    _textField.delegate=self;
    [alertView addSubview:_textField];
    
    [alertView show];

}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [_textField resignFirstResponder];
//    NSLog(@"test");
//    return YES;
//}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    [_textField resignFirstResponder];
//    return YES;
//}

#pragma mark-UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //[self resignFirstResponder];
   // [_textField resignFirstResponder];
    if (buttonIndex==1) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            UIAlertView *newalert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [newalert show];
            
            }
        else{
            
            
            //[self.view endEditing:YES];
            _activityindctr.hidden=NO;
            [_activityindctr startAnimating];
        UIGraphicsBeginImageContext(_newview.bounds.size);
        [_newview.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        // UIImage *imagename =_mainimgeview.image;
        //NSData *data = UIImagePNGRepresentation(imagename);
        
        NSData *data = UIImageJPEGRepresentation(viewImage, 1.0);
        
        
        _encodedString = [data base64EncodedString];
        
        NSLog(@"result%@",_encodedString);
        
        
        
        _savename=[alertView textFieldAtIndex:0].text;
        
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:_savename forKey:@"Imagename"];
        [defaults synchronize];
        
       // [self UploadDocs];
        switch (_tabtype) {
            case 1:
                [self EquipmentUploadPlanDrawings];
               // _mylineview.userInteractionEnabled=NO;
                break;

            case 2:
                [self AccebilityUploadPlanDrawings];
               // _mylineview.userInteractionEnabled=NO;
                break;
            case 3:
               [self MeetingUploadPlanDrawings];
                //_mylineview.userInteractionEnabled=NO;
                break;
            case 4:
               [self NotesUploadPlanDrawings];
               // _mylineview.userInteractionEnabled=NO;
                break;
                
            default:
                break;
        }

    }
      
    }
}


- (IBAction)erasebtn:(id)sender {
    
    //_brushtype=2;
   
   // if ([self.newbdelegate respondsToSelector:@selector(toselectbrush:)]) {
        
           // [self.newbdelegate toselectbrush:2];
        
  //  }
      [self sendNotification];

        //[self.newbdelegate sectionHeaderView:self sectionOpened:self.section];
   
       //_mylineview.brushPattern=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
   // _mylineview.newbrushtype=_brushtype;
    // opacity = 1.0;
}

- (void)sendNotification
{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
   
    
    if (_eraserActived) {
        _brushtype=1;
        _eraserActived = NO;
        
        [_eraserButton setImage:[UIImage imageNamed:@"pencil.png"] forState:UIControlStateNormal];
        
        [dict setValue:[NSString stringWithFormat:@"%d", 0] forKey:@"eraser"];
        
    }else{
        _eraserActived = YES;
         _brushtype=2;
        
        [_eraserButton setImage:[UIImage imageNamed:@"eraser.png"] forState:UIControlStateNormal];
        
        [dict setValue:[NSString stringWithFormat:@"%d", 1] forKey:@"eraser"];
    }
   // [_drawingView eraserflag:dict];
    _drawingView.flag=[[dict objectForKey:@"eraser"]integerValue];
    NSLog(@"%d",_drawingView.flag);
    _drawingView.newbrushtype=_brushtype;
     NSLog(@"%d",_drawingView.newbrushtype);
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:dict forKey:@"Brushcolor"];
    [defaults synchronize];
    
    
   
   }

@end
