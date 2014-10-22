//
//  Timeoutmdl.h
//  Newproject
//
//  Created by Riya on 10/22/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
// # of minutes before application times out
#define kApplicationTimeoutInMinutes 5

// Notification that gets sent when the timeout occurs
#define kApplicationDidTimeoutNotification @"ApplicationDidTimeout"

/**
 * This is a subclass of UIApplication with the sendEvent: method
 * overridden in order to catch all touch events.
 */

@interface Timeoutmdl : UIApplication{
    NSTimer *_idleTimer;
}
- (void)resetIdleTimer;
@end
