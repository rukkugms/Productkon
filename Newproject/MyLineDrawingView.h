//
//  MyLineDrawingView.h
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyLineDrawingView : UIView {
  id delegate;
    UIBezierPath * myPath;
    UIColor *brushPattern;
    NSMutableArray *patharray;
    NSMutableDictionary *pathdictionary;
    
    
    
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
}
@property(readwrite)NSInteger newbrushtype;
@property(strong,nonatomic) UIColor *brushPattern;
@property (nonatomic, retain) UIColor *lineColor;
@property(strong,nonatomic)id delegate;
@property CGFloat brush;
@property CGFloat opacity;

@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;
-(void)setColor:(float)r g:(float)g b:(float)b a:(float)a;
@end
