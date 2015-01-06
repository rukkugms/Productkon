//
//  WebViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
     [self.view addSubview:_webview];
   // _activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
   // UIBarButtonItem*barbutton=[[UIBarButtonItem alloc]initWithCustomView:_activity];
    
    
    //[self.navigationItem setRightBarButtonItem:barbutton];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *encodedString=[_urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSURL *weburl = [NSURL URLWithString:encodedString];
    
    NSString*urls=[_urlstring stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  // NSString*urls=[NSString stringWithFormat:@"http://google.com"];
  //  NSLog(@"url%@",urls);
    NSURL *targetURL = [NSURL URLWithString:encodedString];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webview loadRequest:request];

    
      [self.view addSubview:_webview];
//    //_webview= [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
//    NSString *path = [[NSBundle mainBundle] pathForResource:urlstring ofType:nil];
//    NSURL *targetURL = [NSURL fileURLWithPath:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
//    [_webview loadRequest:request];
    
  
       
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activity startAnimating];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView 
{
   [_activity stopAnimating];
    _activity.hidden=YES;

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   
    
    NSLog(@"ef%@",error);

}



- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
