//
//  UIViewController+Orientationfix.m
//  Newproject
//
//  Created by Riya on 10/15/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UIViewController+Orientationfix.h"

@implementation UIViewController (Orientationfix)

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
