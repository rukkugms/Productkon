//
//  AppDelegate.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController;
@class HomeViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) HomeViewController *homeVctrl;
@property (strong, nonatomic) UINavigationController*navgcntrl;
@end
