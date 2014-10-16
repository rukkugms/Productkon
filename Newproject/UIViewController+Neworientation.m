//
//  UIViewController+Fixorientation.m
//  Newproject
//
//  Created by Riya on 10/16/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UIViewController+Neworientation.h"

@implementation UIViewController (Neworientation)
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end
