//
//  AppDelegate.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "HomeViewController.h"
#import "Sessionout.h"

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.navgcntrl=[[UINavigationController alloc]initWithRootViewController:_viewController];
    self.window.rootViewController = self.navgcntrl;
    [self.window makeKeyAndVisible];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];

return YES;
}

- (void) applicationDidTimeout:(NSNotification *) notif {
    [self targetMethod];
   

    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   [(Sessionout *)[UIApplication sharedApplication] resetIdleTimer];
//      _timer=   [NSTimer scheduledTimerWithTimeInterval:600.0
//                                               target:self
//                                             selector:@selector(targetMethod)
//                                             userInfo:nil
//                                              repeats:NO];
    

    
// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   
  

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    self.navgcntrl=[[UINavigationController alloc]initWithRootViewController:_viewController];
//    self.window.rootViewController = self.navgcntrl;
//    [self.window makeKeyAndVisible];
    
  
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
      }

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   
}
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return UIInterfaceOrientationMaskAll;
}
-(void)targetMethod{
    
//    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"Time Out" message:@"5 mins....." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
       NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotification:[NSNotification notificationWithName:@"appDidEnterForeground" object:nil]];
    
    
}

@end
