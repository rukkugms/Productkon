//
//  UIImagePickerController+Orientaionfix.m
//  Newproject
//
//  Created by Riya on 10/15/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "UIImagePickerController+Orientaionfix.h"

@implementation UIImagePickerController (Orientaionfix)


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
