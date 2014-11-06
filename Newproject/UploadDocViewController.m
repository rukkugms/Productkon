//
//  UploadDocViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/26/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "UploadDocViewController.h"
#import "PDFImageConverter.h"
@interface UploadDocViewController ()

@end

@implementation UploadDocViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Upload Documents", @"Upload Documents");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
    
//    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self action:@selector(handlePinch:)];
//    pgr.delegate = (id)self;
//    [_imageview addGestureRecognizer:pgr];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handlePinch
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate =(id) self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls=YES;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentModalViewController:imagePicker
                                animated:YES];
        _newMedia = YES;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // [self.popoverController dismissPopoverAnimated:true];
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
        
        
        _imageview.image =image;
        [self dismissModalViewControllerAnimated:YES];
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
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    // [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)prevewbtn:(id)sender {
    [self handlePinch];
    
   }

- (IBAction)uploadbtn:(id)sender {
    
    UIImage *imagename =_imageview.image;
  //  NSData *data = UIImagePNGRepresentation(imagename);
    
    // NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    
  
    
   // NSLog(@"result%@",_encodedstring);
    
    
    
    CGSize pageSize = CGSizeMake(700, 1004);
    CGRect imageBoundsRect =CGRectMake(200, 200, 700, 700);
    
    
    NSData *pdfData = [PDFImageConverter convertImageToPDF:imagename
                                            withResolution:50 maxBoundsRect: imageBoundsRect pageSize: pageSize];
    
    
    NSString*filename=[NSString stringWithFormat:@"%@_%@.pdf",_docnametxt.text,_ssnstring];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:filename];
    NSLog(@"path%@",path);
    [pdfData writeToFile:path atomically:NO];

    NSLog(@"data%@",pdfData);
    NSData*data= [NSData dataWithContentsOfFile:path];
    
    
  _encodedstring = [data base64EncodedString];
    [self UploadDocs];
    
    
}

-(void)createpop
{
   // poptype=3;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
    //    UIButton *button = (UIButton *)sender;
    //
    //    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    //    UITableView *table = (UITableView *)[cell superview];
    //    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    
    
    
    [self.popOverController presentPopoverFromRect:_popoverbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    
    
}

- (IBAction)popoverbtn:(id)sender {
    [self createpop];
    [self selectdocs];
}


#pragma mark-webservice


-(void)UploadDocs{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    NSString *imagename=[NSString stringWithFormat:@"%@_%@.pdf",_docnametxt.text,_ssnstring];
    
    
    // NSString *cmpnyname=@"arvin";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadDocs xmlns=\"http://arvin.kontract360.com/\">\n"
                   
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<docName>%@</docName>\n"
                   "<appid>%d</appid>\n"
                   "</UploadDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedstring,imagename,_docnametxt.text,_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/UploadDocs" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)selectdocs
{
   
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   "<soap:Body>\n"
                   "<SelectDocs xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SelectDocs" forHTTPHeaderField:@"Soapaction"];
    
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
    }

#pragma mark-XmlParser


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
       if([elementName isEqualToString:@"UploadDocsResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
        
    
    if([elementName isEqualToString:@"RESULT"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SelectDocsResult"])
    {
        // _DoculistArray=[[NSMutableArray alloc]init];
        _DocumentDictionary=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FolderName"])
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
    if([elementName isEqualToString:@"RESULT"])
    {
        recordResults = FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        _soapResults=nil;
        
    }
    if([elementName isEqualToString:@"Column1"])
    {
        recordResults = FALSE;
        _Unitstring=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"FolderName"])
    {
        
        recordResults = FALSE;
        [_DocumentDictionary setObject:_Unitstring forKey:_soapResults];
        
        
        _soapResults=nil;
    }

   }


#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_DocumentDictionary count];

}
    // Return the number of rows in the section.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
        
          }
    
    _DoculistArray=[_DocumentDictionary allKeys];
    cell.textLabel.text=[_DoculistArray objectAtIndex:indexPath.row];

    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 _DoculistArray=[_DocumentDictionary allKeys];
_doc=[_DocumentDictionary objectForKey:[_DoculistArray objectAtIndex:indexPath.row]];
// NSLog(@"%@",_doc);
if (!self.webctrl) {
    _webctrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
}
_webctrl.docpdf=_doc;
[self.navigationController pushViewController:_webctrl animated:YES];
[self.popOverController dismissPopoverAnimated:YES];
}

@end
