//
//  UserRightViewController.m
//  Newproject
//
//  Created by Riya on 8/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UserRightViewController.h"

@interface UserRightViewController ()

@end

@implementation UserRightViewController

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
    _activatebtnlbl.enabled=NO;

    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _editview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _usertable.layer.borderWidth=3.0;
    _usertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
   

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
viewcheck=0;
    _editupdatebtnlbl.enabled=YES;
    _actvtybtn.hidden=YES;
    [_actvtybtn stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-popover
-(void)createpopover{
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 200);
    popoverContent.preferredContentSize=CGSizeMake(200, 200);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    switch (popover) {
        case 1:
            [self.popOverController presentPopoverFromRect:_userbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];

            break;
        case 2:
            [self.popOverController presentPopoverFromRect:_masterbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 3:
            [self.popOverController presentPopoverFromRect:_subbtnlbl.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;
        case 4:
            [self.popOverController presentPopoverFromRect:_subsubbtnlbl.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            break;

        default:
            break;
            
            }
    
    
    
    
}

#pragma mark-WebServices
-(void)AllUsersselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllUsersselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</AllUsersselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/AllUsersselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Mainmoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Mainmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Mainmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Mainmoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Submoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Submoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<subof>%d</subof>\n"
                   "</Submoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_maintiledict objectForKey:[_maintilearray objectAtIndex:mastrpath]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Submoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)SubSubmoduleselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SubSubmoduleselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<subof>%d</subof>\n"
                   "</SubSubmoduleselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_subtiledict objectForKey:[_subtilearray objectAtIndex:subpath]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SubSubmoduleselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserRightsselect{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "</UserRightsselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserRightsforMainTileselect{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforMainTileselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "</UserRightsforMainTileselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforMainTileselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserRightsforsubTileselect{
    webtype=3;
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforsubTileselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<subof>%d</subof>\n"
                   "</UserRightsforsubTileselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue],[[_maintiledict objectForKey:masterbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforsubTileselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Checksubmenuselect{
    webtype=7;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Checksubmenuselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<moduleid>%d</moduleid>\n"
                 
                   "</Checksubmenuselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_subtiledict objectForKey:subbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Checksubmenuselect" forHTTPHeaderField:@"Soapaction"];
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

-(void)SubUserRightsforsubTileselect{
    webtype=4;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforsubTileselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<subof>%d</subof>\n"
                   "</UserRightsforsubTileselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue],[[_subtiledict objectForKey:subbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforsubTileselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserRightsforparticularmodule2select{
    webtype=5;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmodule2select xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmodule2select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue],[[_subtiledict objectForKey:subbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmodule2select" forHTTPHeaderField:@"Soapaction"];
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
-(void)SubUserRightsforparticularmoduleselect{
    webtype=6;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserRightsforparticularmodule2select xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</UserRightsforparticularmodule2select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath]]integerValue],[[_subsubtiledict objectForKey:subsubbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserRightsforparticularmodule2select" forHTTPHeaderField:@"Soapaction"];
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

-(void)Userrightssave{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    UserRightsmdl*usrmdl=(UserRightsmdl *)[_usertablearray objectAtIndex:btnindex];
    
    if (viewclck==0) {
        
        viewcheck=[usrmdl.viewrights integerValue];
    }
    if (editclck==0) {
        
        editcheck=[usrmdl.editrights integerValue];
    }
    if (deleteclck==0) {
        
        deletecheck=[usrmdl.deleterights integerValue];
    }
    if (printclck==0) {
        printcheck=[usrmdl.printrightes integerValue];
    }
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightssave xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "<ViewModule>%d</ViewModule>\n"
                   "<EditModule>%d</EditModule>\n"
                   "<DeleteModule>%d</DeleteModule>\n"
                   "<PrintModule>%d</PrintModule>\n"
                   "<subof>%d</subof>\n"
                   "</Userrightssave>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[usrmdl.userid integerValue],[usrmdl.moduleid integerValue],viewcheck,editcheck,deletecheck,printcheck,[usrmdl.subof integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightssave" forHTTPHeaderField:@"Soapaction"];
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
-(void)Allrightssave{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    j=0;
     msgcount=[_usertablearray count];
    for (int i=0; i<[_usertablearray count]; i++) {
        
       
      _usertable.userInteractionEnabled=NO;
    UserRightsmdl*usrmdl=(UserRightsmdl *)[_usertablearray objectAtIndex:i];
        if (Allviewclckd==1) {
            if (checkviewstrg==1) {
                
                viewcheck=1;
                         }
            else{
               viewcheck=0;
            }

        }
        
        else{
            viewcheck=[usrmdl.viewrights integerValue];
        }
        if (Alleditclckd==1) {
            if (checkeditstrg==1) {
                
                editcheck=1;
            }
            else{
                editcheck=0;
            }
            
        }
        
        else{
            editcheck=[usrmdl.editrights integerValue];
        }

        if (Alldeleteclckd==1) {
            if (checkdeletestrg==1) {
                
                deletecheck=1;
            }
            else{
                deletecheck=0;
            }
            
        }
        
        else{
           deletecheck=[usrmdl.deleterights integerValue];
        }
        
        if (Allprintclckd==1) {
            if (checkprintstrg==1) {
                
                printcheck=1;
            }
            else{
                printcheck=0;
            }
            
        }
        
        else{
            printcheck=[usrmdl.printrightes integerValue];
        }


       soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightssave xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "<ViewModule>%d</ViewModule>\n"
                   "<EditModule>%d</EditModule>\n"
                   "<DeleteModule>%d</DeleteModule>\n"
                   "<PrintModule>%d</PrintModule>\n"
                   "<subof>%d</subof>\n"
                   "</Userrightssave>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[usrmdl.userid integerValue],[usrmdl.moduleid integerValue],viewcheck,editcheck,deletecheck,printcheck,[usrmdl.subof integerValue] ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightssave" forHTTPHeaderField:@"Soapaction"];
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
}
-(void)Useractivateselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Useractivateselect xmlns=\"http://ios.kontract360.com/\">\n"
                     "<UserId>%d</UserId>\n"
                   "</Useractivateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     //   NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Useractivateselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserActivateUpdate{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserActivateUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<Activate>%d</Activate>\n"
                   "</UserActivateUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],activate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserActivateUpdate" forHTTPHeaderField:@"Soapaction"];
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
-(void)UserLogmainupdate{
    
    recordResults = FALSE;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // NSLog(@"Date %@",[formatter stringFromDate:date]);
    NSString*curntdate=[formatter stringFromDate:date];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*useridname = [defaults objectForKey:@"Userid"];
    NSString*extnalip=[defaults objectForKey:@"Externalip"];
    NSString*intrnalip=[defaults objectForKey:@"Internalip"];
    NSString*Udid=[defaults objectForKey:@"UDID"];
    
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UserLogmaininsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<dateandtime>%@</dateandtime>\n"
                   "<userid>%d</userid>\n"
                   "<moduleid>%d</moduleid>\n"
                   "<Action>%@</Action>\n"
                   "<platform>%@</platform>\n"
                   "<externalip>%@</externalip>\n"
                   "<internalip>%@</internalip>\n"
                   "<devicenumber>%@</devicenumber>\n"
                   "<documentId>%d</documentId>\n"
                   "</UserLogmaininsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",curntdate,[useridname integerValue],_moduleid,@"Create",@"test",extnalip,intrnalip,Udid,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UserLogmaininsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Userrighttickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrighttickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   
                   "</Userrighttickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
        NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
   //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrighttickselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Userrightsuboftickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightsuboftickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                    "<subof>%d</subof>\n"
                   "</Userrightsuboftickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],[[_maintiledict objectForKey:masterbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightsuboftickselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)SubUserrightsuboftickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightsuboftickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<subof>%d</subof>\n"
                   "</Userrightsuboftickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],[[_subtiledict objectForKey:subbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightsuboftickselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)SubSubUserrightsuboftickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightsuboftickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<subof>%d</subof>\n"
                   "</Userrightsuboftickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],[[_subsubtiledict objectForKey:subsubbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightsuboftickselect" forHTTPHeaderField:@"Soapaction"];
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

-(void)Userrightsubofmastertickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightsubofmastertickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                  
                   "</Userrightsubofmastertickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightsubofmastertickselect" forHTTPHeaderField:@"Soapaction"];
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
-(void)Userrightmoduletickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightmoduletickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</Userrightmoduletickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],[[_subtiledict objectForKey:subbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightmoduletickselect" forHTTPHeaderField:@"Soapaction"];
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

-(void)SubUserrightmoduletickselect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Userrightmoduletickselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<UserId>%d</UserId>\n"
                   "<ModuleId>%d</ModuleId>\n"
                   "</Userrightmoduletickselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_userdict objectForKey:[_userarray objectAtIndex:userpath] ]integerValue],[[_subsubtiledict objectForKey:subsubbtnstrg]integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
       NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    //    NSURL *url = [NSURL URLWithString:@"http://192.168.0.175/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Userrightmoduletickselect" forHTTPHeaderField:@"Soapaction"];
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
    [_usertable reloadData];
    
}

#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        switch (popover) {
            case 1:
                 return [_userarray count];
                break;
            case 2:
                return [_maintilearray count];
                break;
            case 3:
                return [_subtilearray count];
                break;
                
            case 4:
                return [_subsubtilearray count];
                break;


            default:
                break;
        }
       
    }
    else if (tableView==_usertable) {
        return [_usertablearray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
          cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
         if (tableView==_usertable) {
        [[NSBundle mainBundle]loadNibNamed:@"Userrightscell" owner:self options:nil];
                //[[NSBundle mainBundle]loadNibNamed:@"Newuserrightscell" owner:self options:nil];
            
          cell=_usercell;
         }
    }
    
    if (tableView==_popOverTableView) {
        switch (popover) {
            case 1:
                 cell.textLabel.text=[_userarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_maintilearray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_subtilearray objectAtIndex:indexPath.row];
                break;
            case 4:
                cell.textLabel.text=[_subsubtilearray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
       
    }
    
      if (tableView==_usertable) {
          UserRightsmdl*usrmdl=(UserRightsmdl *)[_usertablearray objectAtIndex:indexPath.row];
          _namelbl=(UILabel *)[cell viewWithTag:1];
          _namelbl.text=[_revuserdict objectForKey:usrmdl.userid];
          _companylbl=(UILabel *)[cell viewWithTag:2];
          _companylbl.text=usrmdl.modulename;
         // [cell.contentView addSubview:_newbtn];
        //  _viewbtnlbl=(UIButton *)[cell viewWithTag:3];
          
          if ([usrmdl.viewonly isEqualToString:@"true"]) {
              _viewbtnlbl.enabled=YES;
              _editbtnlbl.enabled=NO;
             _deletebtnlbl.enabled=NO;
             _printbtnlbl.enabled=NO;
             
              [_editbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              [_deletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              [_printbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              if ([usrmdl.viewrights isEqualToString:@"1"]) {
                  // [_newbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                  
                  [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                  viewcheck=1;
                  
              }
              else{
                  // [_newbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                  [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                  viewcheck=0;
              }

              if (Allviewclckd==1) {
                  
                  
                  if (checkviewstrg==1) {
                         [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
                   
                      //              for (int i=0; i<[_usertablearray count]; i++) {
                      //
                      //              }
                      
                  }
                  else{
                      [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                  }
                  

              
          }
          }
          else{
              
              _viewbtnlbl.enabled=YES;
              _editbtnlbl.enabled=YES;
              _deletebtnlbl.enabled=YES;
              _printbtnlbl.enabled=YES;
          
          
          if ([usrmdl.viewrights isEqualToString:@"1"]) {
              // [_newbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
             
               [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
              viewcheck=1;
              
          }
          else{
             // [_newbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               viewcheck=0;
          }
          if ([usrmdl.editrights isEqualToString:@"1"]) {
              [_editbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
          }
          else{
              [_editbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
          }
          if ([usrmdl.deleterights isEqualToString:@"1"]) {
              [_deletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
          }
          else{
              [_deletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
          }
          if ([usrmdl.printrightes isEqualToString:@"1"]) {
              [_printbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
          }
          else{
              [_printbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
          }
              
          
          
          
          if (Allviewclckd==1) {
              
          
          if (checkviewstrg==1) {
             
              [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//              for (int i=0; i<[_usertablearray count]; i++) {
//                  
//              }
              
          }
          else{
                [_viewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
          }

          
      }
          if (Alleditclckd==1) {
              
              
              if (checkeditstrg==1) {
                     [_editbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
              
                  //              for (int i=0; i<[_usertablearray count]; i++) {
                  //
                  //              }
              }
              else{
               
                      [_editbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              }
              
              
          }
          if (Alldeleteclckd==1) {
              
              
              if (checkdeletestrg==1) {
                    [_deletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
               
                  //              for (int i=0; i<[_usertablearray count]; i++) {
                  //
                  //              }
              }
              else{
                   [_deletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              }
              
              
          }
          if (Allprintclckd==1) {
              
              
              if (checkprintstrg==1) {
                  [_printbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];

             
                  //              for (int i=0; i<[_usertablearray count]; i++) {
                  //
                  //              }
              }
              else{
                            [_printbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              }
              
              
          }
          
          }
      }
              
    
    return cell;
    
    
}
#pragma mark-Tableview datasources
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
   
    if (tableView==_usertable) {
        
    
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     path=indexPath.row;
    
    if (tableView==_popOverTableView) {
        
        
        
          if (popover==1) {
              
              userpath=indexPath.row;
              [_userbtn setTitle:[_userarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
              _masterbtn.enabled=YES;
              
              _activatebtnlbl.enabled=YES;
              _subbtnlbl.enabled=NO;
              _subsubbtnlbl.enabled=NO;
              
              [_masterbtn setTitle:@"Select" forState:UIControlStateNormal];
              [_subbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
              [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];

              [self Useractivateselect];
               [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            
              
          }
        
        else if (popover==2) {
             mastrpath=indexPath.row;
            [_subbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
              [_masterbtn setTitle:[_maintilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
             masterbtnstrg=[_maintilearray objectAtIndex:indexPath.row];
            _subbtnlbl.enabled=YES;
             _subsubbtnlbl.enabled=NO;
            if (indexPath.row==12) {
                 [self UserRightsforMainTileselect];
            }
            else{
                [self UserRightsforsubTileselect];
            }
        }
        
        else if (popover==3) {
              subpath=indexPath.row;
            _subsubbtnlbl.enabled=YES;

            [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             [_subbtnlbl setTitle:[_subtilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
         
            subbtnstrg=[_subtilearray objectAtIndex:indexPath.row];
            [self Checksubmenuselect];
            //[self SubUserRightsforsubTileselect];
        }

        else if (popover==4) {
            subsubpath=indexPath.row;
            [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             [_subsubbtnlbl setTitle:[_subsubtilearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            subsubbtnstrg=[_subsubtilearray objectAtIndex:indexPath.row];
            [self SubUserRightsforparticularmoduleselect];
        }
        
        
  
                
                
[self.popOverController dismissPopoverAnimated:YES];
}
}

#pragma mark - XML Parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"AllUsersselectResponse"])
    {
        _userarray=[[NSMutableArray alloc]init];
        _userdict=[[NSMutableDictionary alloc]init];
        _revuserdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MainmoduleselectResponse"])
    {
        _maintilearray=[[NSMutableArray alloc]init];
        _maintiledict=[[NSMutableDictionary alloc]init];
         _revmaintiledict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ModuleName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ModuleName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubmoduleselectResponse"])
    {
        _subtilearray=[[NSMutableArray alloc]init];
        _subtiledict=[[NSMutableDictionary alloc]init];
        _revsubtiledict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"submoduleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"submodulename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubSubmoduleselectResponse"])
    {
        _subsubtilearray=[[NSMutableArray alloc]init];
        _subsubtiledict=[[NSMutableDictionary alloc]init];
         _revsubsubtiledict=[[NSMutableDictionary alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subsubmoduleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subsubmodulename"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserRightsselectResponse"])
    {
        [self Userrighttickselect];
        _usertablearray=[[NSMutableArray alloc]init];
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
    
    if([elementName isEqualToString:@"UserUserId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserModuleId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"userModulename"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"viewonly"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subof"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"UserRightsforMainTileselectResponse"])
    {    [self Userrightsubofmastertickselect];
        _usertablearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserRightsforsubTileselectResponse"])
    {
        
        if (popover==3) {
            
               [self SubUserrightsuboftickselect];
        }
        
        else{
       
     [self Userrightsuboftickselect];
         }
        
      
        _usertablearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"UserrightssaveResponse"])
    {
        j++;
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

    if([elementName isEqualToString:@"UserRightsforparticularmodule2selectResponse"])
    {
      
        if(popover==4){
              [self SubUserrightmoduletickselect];
            //[self SubSubUserrightsuboftickselect];
        }
        else{
            
              [self Userrightmoduletickselect];
            //[self SubUserrightsuboftickselect];
        
        }

        
       
        _usertablearray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"UseractivateselectResponse"])
    {
          [self UserRightsselect];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Activate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UserrighttickselectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Tickview"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TickEdit"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TickDelete"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TickPrint"])
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
    if([elementName isEqualToString:@"UserId"])
    {
        
        recordResults = FALSE;
        userid=_soapResults;
        
       _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserName"])
    {
        
        recordResults = FALSE;
        [_userdict setObject:userid forKey:_soapResults];
        [_revuserdict setObject:_soapResults forKey:userid];
        [_userarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ModuleId"])
    {
        
        recordResults = FALSE;
        mainid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"ModuleName"])
    {
        
         recordResults = FALSE;
        [_maintiledict setObject:mainid forKey:_soapResults];
        [_revmaintiledict setObject:_soapResults forKey:mainid];
        [_maintilearray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"submoduleId"])
    {
        
       recordResults = FALSE;
        subid=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"submodulename"])
    {
        
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"->"];
        
        [_subtilearray addObject:[array objectAtIndex:1]];
        [_subtiledict setObject:subid forKey:[array objectAtIndex:1]];
        [_revsubtiledict setObject:[array objectAtIndex:1] forKey:subid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"subsubmoduleId"])
    {
        
        recordResults = FALSE;
        subsubid=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"subsubmodulename"])
    {
        
        recordResults = FALSE;
        NSArray*array=[_soapResults componentsSeparatedByString:@"->"];
        
        [_subsubtilearray addObject:[array objectAtIndex:2]];
        [_subsubtiledict setObject:subsubid forKey:[array objectAtIndex:2]];
          [_revsubsubtiledict setObject:[array objectAtIndex:2] forKey:subsubid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"UserUserId"])
    {
        _usermdl=[[UserRightsmdl alloc]init];
        recordResults = FALSE;
        _usermdl.userid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UserModuleId"])
    {
        recordResults = FALSE;
        _usermdl.moduleid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"userModulename"])
    {
        recordResults = FALSE;
        _usermdl.modulename=_soapResults;
        _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"ViewModule"])
    {
        
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _usermdl.viewrights=@"1";
        }
        else{
             _usermdl.viewrights=@"0";
        }
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EditModule"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _usermdl.editrights=@"1";
        }
        else{
            _usermdl.editrights=@"0";
        }

        _soapResults = nil;

    }
    if([elementName isEqualToString:@"DeleteModule"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _usermdl.deleterights=@"1";
        }
        else{
            _usermdl.deleterights=@"0";
        }
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"PrintModule"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"true"]) {
            _usermdl.printrightes=@"1";
        }
        else{
            _usermdl.printrightes=@"0";
        }

      
        
        _soapResults = nil;

    }

    if([elementName isEqualToString:@"viewonly"])
    {
        
        recordResults = FALSE;
        _usermdl.viewonly=_soapResults;
        
        [_usertablearray addObject:_usermdl];

         _soapResults = nil;
    }
    if([elementName isEqualToString:@"subof"])
    {
        
        recordResults = FALSE;
        _usermdl.subof=_soapResults;

       
      
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"0"]) {
            if (webtype==7) {
                tileschecking=1;
                [self UserRightsforparticularmodule2select];
            }
            else
            {
                
            }
            
        }
        else if ([_soapResults integerValue]>0){
            tileschecking=2;
               _subsubbtnlbl.enabled=YES;
                [self SubUserRightsforsubTileselect];
        }
        
        
        else  if ([_soapResults isEqualToString:@"Updated Successfully"]) {
            
            
            if (optnidntfr==1) {
                
            
          UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [alert show];
           // [self UserRightsselect];
                  _usertable.userInteractionEnabled=YES;
                if(![[_subsubbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                    
                    [self SubUserRightsforparticularmoduleselect];
                    
                }
                else{
                    
                    if(![[_subbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                        if(tileschecking==1){
                            [self UserRightsforparticularmodule2select];
                            
                        }
                        else{
                            [self SubUserRightsforsubTileselect];
                        }
                        
                        
                    }
                    else{
                        if(![[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                            
                            if([_masterbtn.titleLabel.text isEqualToString:@"Master Tiles"]){
                                
                                [self UserRightsforMainTileselect];
                            }
                            else{
                                [self UserRightsforsubTileselect];
                            }}
                        
                        else{
                            
                            if(![[_userbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                                
                                [self UserRightsselect];
                            }
                            
                            
                        }
                    }
                    
                    
                }

            
                
            }
            else{
                
                _actvtybtn.hidden=NO;
                [_actvtybtn startAnimating];
                _userbtn.enabled=NO;
                _masterbtn.enabled=NO;
                _subbtnlbl.enabled=NO;
                _subsubbtnlbl.enabled=NO;
                _Alldeletebtnlbl.enabled=NO;
                _Alleditbtnlbl.enabled=NO;
                _Allprintbtnlbl.enabled=NO;
                _Allviewbtnlbl.enabled=NO;
                _activatebtnlbl.enabled=NO;
                
//                UIView *dimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 768)];
//                dimView.backgroundColor = [UIColor clearColor];
//                dimView.alpha = 0.5f;
//                dimView.tag = 1111;
//                dimView.userInteractionEnabled = NO;
//                [self.view addSubview:dimView];
                
                
                if(j==msgcount){
                    _usertable.userInteractionEnabled=YES;
                    j=0;
                    _actvtybtn.hidden=YES;
                    [_actvtybtn stopAnimating];
                    _userbtn.enabled=YES;
                    _masterbtn.enabled=YES;
                    
                    _Alldeletebtnlbl.enabled=YES;
                    _Alleditbtnlbl.enabled=YES;
                    _Allprintbtnlbl.enabled=YES;
                    _Allviewbtnlbl.enabled=YES;
                      _activatebtnlbl.enabled=YES;
                    
//                     if([_masterbtn.titleLabel.text isEqualToString:@"Select"]){
//                         
//                         _subbtnlbl.enabled=NO;
//                          _subsubbtnlbl.enabled=NO;
//
//                     }
                    
                      if([[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                          _subbtnlbl.enabled=NO;
                          _subsubbtnlbl.enabled=NO;
                      
                      }
                      else{
                          
                          
                      if([[_subbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                        
                        _subbtnlbl.enabled=YES;
                        _subsubbtnlbl.enabled=NO;
                        
                    }
                    else{
                        _subbtnlbl.enabled=YES;
                        _subsubbtnlbl.enabled=YES;
                    }
                     
                      }

//                    for (UIView *view in [self.view subviews]) {
//                        if (view.tag == 1111) {
//                            [dimView removeFromSuperview];
//                        }
//                    }
                   
                    
//                    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//                    CGRect maskRect = CGRectMake(0, 0, 50, 100);
//                    
//                    // Create a path with the rectangle in it.
//                    CGPathRef path1 = CGPathCreateWithRect(maskRect, NULL);
//                    
//                    // Set the path to the mask layer.
//                    maskLayer.path = path1;
//                    
//                    // Release the path since it's not covered by ARC.
//                    CGPathRelease(path1);
//                    
//                    // Set the mask of the view.
//                self.view.layer.mask = maskLayer;
                    //  [self UserRightsselect];
                    if(![[_subsubbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                        
                         [self SubUserRightsforparticularmoduleselect];
                        
                    }
                    else{
                        
                        NSLog(@"%@",_subbtnlbl.titleLabel.text);
                        NSString*s=[_subbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                        if(![s isEqualToString:@"Select"]){
                            if(tileschecking==1){
                                [self UserRightsforparticularmodule2select];
                                
                            }
                            else{
                                  [self SubUserRightsforsubTileselect];
                            }
                           
                            
                        }
                         else{
                             if(![[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                                 
                                 if([[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Master Tiles"]){
                                     
                                     [self UserRightsforMainTileselect];
                                 }
                                 else{
                                     [self UserRightsforsubTileselect];
                                 }}

                             else{
                                 
                                 if(![[_userbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                                     
                                     [self UserRightsselect];
                                 }

                                 
                             }
                         }

                        
                    }
                    
                    
                        
                        
    }
           
            
            
            }
        }

              else{
                  
                  
           
                  switch (webtype) {
                      case 1:
                          [self UserRightsselect];
                          break;
                      case 2:
                          [self UserRightsforMainTileselect];
                          break;
                      case 3:
                          [self UserRightsforsubTileselect];
                          break;
                      case 4:
                          [self SubUserRightsforsubTileselect];
                          break;
                      case 5:
                          [self UserRightsforparticularmodule2select];
                          break;
                      case 6:
                          [self SubUserRightsforparticularmoduleselect];
                          break;
                      default:
                          break;
                  }
              
        }
    
    
              _soapResults = nil;
    }
    

    if([elementName isEqualToString:@"Activate"])
    {
        recordResults = FALSE;
        if([_soapResults isEqualToString:@"true"]){
            [_activatebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            activate=1;
            _usertable.userInteractionEnabled=YES;
            _userbtn.enabled=YES;
            _masterbtn.enabled=YES;
            //_subbtnlbl.enabled=YES;
            //_subsubbtnlbl.enabled=YES;
            _Alldeletebtnlbl.enabled=YES;
            _Alleditbtnlbl.enabled=YES;
            _Allprintbtnlbl.enabled=YES;
            _Allviewbtnlbl.enabled=YES;
            _activatebtnlbl.enabled=YES;


        }
        else{
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"" message:@"User is not activated please contact admin" delegate:self
                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];

             [_activatebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            activate=0;
            _usertable.userInteractionEnabled=NO;
           // _userbtn.enabled=NO;
            _masterbtn.enabled=NO;
            _subbtnlbl.enabled=NO;
            _subsubbtnlbl.enabled=NO;
            _Alldeletebtnlbl.enabled=NO;
            _Alleditbtnlbl.enabled=NO;
            _Allprintbtnlbl.enabled=NO;
            _Allviewbtnlbl.enabled=NO;
            //_activatebtnlbl.enabled=NO;
        }
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Tickview"])
    {
       
        //[_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
       // [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
       // [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"0"]) {
             [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            checkviewstrg=1;

        }
        else{
              [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               checkviewstrg=0;
        }
        _soapResults = nil;
}
    if([elementName isEqualToString:@"TickEdit"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"0"]) {
            [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TickDelete"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"0"]) {
            [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TickPrint"])
    {
        recordResults = FALSE;
        if ([_soapResults isEqualToString:@"0"]) {
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        }
        else{
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        }

        _soapResults = nil;
    }


}
#pragma mark-IBActions
- (IBAction)activatebtn:(id)sender {
    if(activate==1){
        [_activatebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        activate=0;
        _usertable.userInteractionEnabled=NO;
        // _userbtn.enabled=NO;
        _masterbtn.enabled=NO;
        _subbtnlbl.enabled=NO;
        _subsubbtnlbl.enabled=NO;
        _Alldeletebtnlbl.enabled=NO;
        _Alleditbtnlbl.enabled=NO;
        _Allprintbtnlbl.enabled=NO;
        _Allviewbtnlbl.enabled=NO;
       // [_masterbtn setTitle:@"Select" forState:UIControlStateNormal];
        //[_subbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
       // [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
      
//        [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];



    }
    else{
        [_activatebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        activate=1;
        _usertable.userInteractionEnabled=YES;
        _userbtn.enabled=YES;
         _masterbtn.enabled=YES;
      
        _Alldeletebtnlbl.enabled=YES;
        _Alleditbtnlbl.enabled=YES;
        _Allprintbtnlbl.enabled=YES;
        _Allviewbtnlbl.enabled=YES;
        _activatebtnlbl.enabled=YES;
        
       // [_masterbtn setTitle:@"Select" forState:UIControlStateNormal];
       // [_subbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
       // [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
        
//        [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//        [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];


    }
    
    [self UserActivateUpdate];
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)userbtn:(id)sender {
     popover=1;
         _activatebtnlbl.enabled=NO;
   
    
    [self createpopover];
    [self AllUsersselect];
}

- (IBAction)masterbtn:(id)sender {
    popover=2;
     Allviewclckd=0;
    Alleditclckd=0;
    Alldeleteclckd=0;
    Allprintclckd=0;
        //_subbtnlbl.enabled=NO;
   // _subsubbtnlbl.enabled=NO;

    [self createpopover];
    [self Mainmoduleselect];
}

- (IBAction)subbtn:(id)sender {
    popover=3;
    Allviewclckd=0;
    Alleditclckd=0;
    Alldeleteclckd=0;
    Allprintclckd=0;
   
   
   // _subsubbtnlbl.enabled=NO;
    [self createpopover];
    [self Submoduleselect];

}

- (IBAction)subsubbtn:(id)sender {
    popover=4;
    Allviewclckd=0;
    Alleditclckd=0;
    Alldeleteclckd=0;
    Allprintclckd=0;
    [self createpopover];
    [self SubSubmoduleselect];
}

- (IBAction)allviewcheckbtn:(id)sender {
      optnidntfr=2;
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else{

        _Allviewbtnlbl.enabled=NO;
    Allviewclckd=1;
      btnclck++;
      // if(btnclck%2!=0){
           if (checkviewstrg==1) {
               
               [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               checkviewstrg=0;
               [_usertable reloadData];
               [self Allrightssave];
         
           
           
       }
       else
       {
           [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
           checkviewstrg=1;
           [_usertable reloadData];
           [self Allrightssave];
           
       }
    }
   // Allviewclckd=0;
}

- (IBAction)alleditcheckbtn:(id)sender {
     optnidntfr=2;
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else
    {
_Alleditbtnlbl.enabled=NO;
    Alleditclckd=1;
    btnclck1++;
   // if(btnclck1%2!=0){
           if (checkeditstrg==1) {
               [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
               checkeditstrg=0;
               [_usertable reloadData];
               [self Allrightssave];

       
        
        
    }
    else
    {
        [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checkeditstrg=1;
        [_usertable reloadData];
        [self Allrightssave];
        
         }
    }

}

- (IBAction)Alldeletecheckbtn:(id)sender {
     optnidntfr=2;
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else
    {
        _Alldeletebtnlbl.enabled=NO;

    Alldeleteclckd=1;
    btnclck2++;
    //if(btnclck2%2!=0){
         if (checkdeletestrg==1) {
             
             [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
             checkdeletestrg=0;
             [_usertable reloadData];
             [self Allrightssave];
    }
    else
    {
        [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checkdeletestrg=1;
        [_usertable reloadData];
        [self Allrightssave];

      
    }
    }

}

- (IBAction)Allprintcheckbtn:(id)sender {
     optnidntfr=2;
    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else
    {
   _Allprintbtnlbl.enabled=NO;
    Allprintclckd=1;
    btnclck3++;
    //if(btnclck3%2!=0){
        if (checkprintstrg==1) {
            
            [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            checkprintstrg=0;
            [_usertable reloadData];
            [self Allrightssave];
       
        
        
    }
    else
    {
        [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        checkprintstrg=1;
        [_usertable reloadData];
        [self Allrightssave];
       
    }
    }

}

- (IBAction)viewbtn:(id)sender {
  
    viewclck=1;
    Allviewclckd=0;
    
  
    if (viewcheck==1)
        
        
    {
                [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        viewcheck=0;
       
    }
    else{
        
        
       [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
               viewcheck=1;
    }

    }


- (IBAction)editbtn:(id)sender {
    
    editclck=1;
    Alleditclckd=0;
 
    if (editcheck==1)
        
        
    {
        [_editeditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    
        editcheck=0;
    }
    else{
        
        
      
        [_editeditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        editcheck=1;
    }
  
    

}

- (IBAction)deletebtn:(id)sender {
  
    deleteclck=1;
    Alldeleteclckd=0;
    
  
    if (deletecheck==1)
        
        
    {
        [_editdeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
       
        deletecheck=0;
        
    }
    else{
        
        
      
        [_editdeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        deletecheck=1;
    }
   
    
}

- (IBAction)printbtn:(id)sender {
  
    printclck=1;
    Allprintclckd=0;
    
       if (printcheck==1)
        
        
    {
        [_editprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
                printcheck=0;
    }
    else{
        
        
                [_editprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
         printcheck=1;
    }
   
    


}
- (IBAction)newbtn:(id)sender {
}
- (IBAction)updatebtn:(id)sender {

    Rightscheck*rightsmodel=(Rightscheck *)[_userrightsarray objectAtIndex:0];
    
    if (rightsmodel.EditModule==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"You dont have rights to edit this record" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
    }
    else
    {
        _editupdatebtnlbl.enabled=NO;
     optnidntfr=1;
      [self Userrightssave];
    [_usertable reloadData];
    }
    
}
- (IBAction)celleditbtn:(id)sender {
    
    optnidntfr=1;
    _editview.hidden=NO;
    _editupdatebtnlbl.enabled=YES;
     _usertable.userInteractionEnabled=NO;
    _userbtn.enabled=NO;
    _masterbtn.enabled=NO;
    _subbtnlbl.enabled=NO;
    _subsubbtnlbl.enabled=NO;
    _Alldeletebtnlbl.enabled=NO;
    _Alleditbtnlbl.enabled=NO;
    _Allprintbtnlbl.enabled=NO;
    _Allviewbtnlbl.enabled=NO;
    _activatebtnlbl.enabled=NO;


    [_Allviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_Alleditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_Alldeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    [_Allprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
    viewclck=0;
    editclck=0;
    deleteclck=0;
    printclck=0;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.usertable];
    NSIndexPath *textFieldIndexPath = [self.usertable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    UserRightsmdl*usrmdl=(UserRightsmdl *)[_usertablearray objectAtIndex:textFieldIndexPath.row];
    btnindex=textFieldIndexPath.row;
    _editnamelbl.text=usrmdl.modulename;
    
    if ([usrmdl.viewonly isEqualToString:@"true"]){
        
        _editviewbtnlbl.enabled=YES;
        _editeditbtnlbl.enabled=NO;
        _editdeletebtnlbl.enabled=NO;
        _editprintbtnlbl.enabled=NO;
          //[_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        if ([usrmdl.viewrights isEqualToString:@"1"])
            
            
        {
            [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            
            viewcheck=0;
            
        }
        else{
            
            [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            
            
            viewcheck=1;
        }

         [_editeditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
          [_editdeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            [_editprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        }
    else{
        _editviewbtnlbl.enabled=YES;
        _editeditbtnlbl.enabled=YES;
        _editdeletebtnlbl.enabled=YES;
        _editprintbtnlbl.enabled=YES;
        
    
        
    
    if ([usrmdl.viewrights isEqualToString:@"1"])
        
        
    {
        [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
     
        viewcheck=0;
        
    }
    else{
        
    [_editviewbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        
        viewcheck=1;
    }
    
    if ([usrmdl.editrights isEqualToString:@"1"])
        
        
    {
          [_editeditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        editcheck=0;
    }
    else{
         [_editeditbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
     
        editcheck=1;
    }
    
    if ([usrmdl.deleterights isEqualToString:@"1"])
        
        
    {
       
          [_editdeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        deletecheck=0;
        
    }
    else{
      
         [_editdeletebtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        deletecheck=1;
    }
    if ([usrmdl.printrightes isEqualToString:@"1"])
        
        
    {
         [_editprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
       
        printcheck=0;
    }
    else{
        [_editprintbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        printcheck=1;
    }
    }
    
    
    }

- (IBAction)editclsebtn:(id)sender {
    _editview.hidden=YES;
    _usertable.userInteractionEnabled=YES;
    _userbtn.enabled=YES;
    _masterbtn.enabled=YES;
    if([[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
        _subbtnlbl.enabled=NO;
        _subsubbtnlbl.enabled=NO;
        
    }
    else{
        
        
        if([[_subbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
            
            _subbtnlbl.enabled=YES;
            _subsubbtnlbl.enabled=NO;
            
        }
        else{
            _subbtnlbl.enabled=YES;
            _subsubbtnlbl.enabled=YES;
        }
        
    }

    _Alldeletebtnlbl.enabled=YES;
    _Alleditbtnlbl.enabled=YES;
    _Allprintbtnlbl.enabled=YES;
    _Allviewbtnlbl.enabled=YES;
    _activatebtnlbl.enabled=YES;

  
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    if ([alertView.message isEqualToString:@"Updated Successfully"]) {
        
        
        
        if (buttonIndex==0) {
            
            _editview.hidden=YES;
            _editupdatebtnlbl.enabled=YES;
           // [_masterbtn setTitle:@"Select" forState:UIControlStateNormal];
          //  [_subbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
           // [_subsubbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
            _usertable.userInteractionEnabled=YES;
            _userbtn.enabled=YES;
            _masterbtn.enabled=YES;
            if([[_masterbtn.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                _subbtnlbl.enabled=NO;
                _subsubbtnlbl.enabled=NO;
                
            }
            else{
                
                
                if([[_subbtnlbl.titleLabel.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"Select"]){
                    
                    _subbtnlbl.enabled=YES;
                    _subsubbtnlbl.enabled=NO;
                    
                }
                else{
                    _subbtnlbl.enabled=YES;
                    _subsubbtnlbl.enabled=YES;
                }
                
            }

            _Alldeletebtnlbl.enabled=YES;
            _Alleditbtnlbl.enabled=YES;
            _Allprintbtnlbl.enabled=YES;
            _Allviewbtnlbl.enabled=YES;
            _activatebtnlbl.enabled=YES;
           
        }
    }
    
    
}

@end
