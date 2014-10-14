//
//  UIViewController+OrientaionFix.m
//  Newproject
//
//  Created by Riya on 10/14/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UIViewController+OrientaionFix.h"

@implementation UIViewController (OrientaionFix)


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
