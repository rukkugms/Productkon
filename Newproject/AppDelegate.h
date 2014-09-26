//
//  AppDelegate.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ViewController;

@protocol mynewDelegate <NSObject>


-(void)inactivelogoutaction;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,weak)id<mynewDelegate>delegate;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController*navgcntrl;
@end
