//
//  MyLineDrawingView.m
//  DrawLines
//
//  Created by Reetu Raj on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyLineDrawingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyLineDrawingView
CGPoint midPoint(CGPoint p1, CGPoint p2);

@synthesize delegate,lineColor;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        self.backgroundColor=[UIColor whiteColor];
        myPath=[[UIBezierPath alloc]init];
        myPath.lineCapStyle=kCGLineCapRound;
        myPath.miterLimit=0;
        myPath.lineWidth=4;
        patharray=[[NSMutableArray alloc]init];
    lineColor=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
        
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
   
    NSLog(@"color%@",lineColor);

    
//    for (int i=0; i<[patharray count]; i++) {
//        
//        
//        pathdictionary=[patharray objectAtIndex:i];
//        
//        UIBezierPath *_path = [pathdictionary valueForKey:@"path"];
//        //[[dic valueForKey:@"fColor"] setFill];
//          NSLog(@"PATH%@",_path);
//        [[pathdictionary valueForKey:@"sColor"] setStroke];
//            NSLog(@"colur%@",[pathdictionary valueForKey:@"sColor"]);
//        [_path stroke];
//    
//        
//    }

       CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [lineColor CGColor]);
  
     
    [lineColor setStroke];
    if (_newbrushtype==2) {
        [myPath strokeWithBlendMode:kCGBlendModeClear
                              alpha:1.0f];
        
    }
    else{
         [myPath strokeWithBlendMode:kCGBlendModeDifference alpha:1.0];
    }
   
    // Drawing code
   //[myPath stroke];
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"color%@",lineColor);
       UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
      [myPath moveToPoint:[mytouch locationInView:self]];
    //pathdictionary = [[NSMutableDictionary alloc] init];
    //[pathdictionary setObject:lineColor forKey:@"fColor"];
    //[pathdictionary setObject:lineColor forKey:@"sColor"];
   // NSLog(@"PATH%@",myPath);
   // [pathdictionary setObject:myPath forKey:@"path"];
    //[patharray addObject:pathdictionary];
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
     NSLog(@"color%@",brushPattern);
    [lineColor setStroke];
 
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
  
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
 

    
    
}
-(void)setColor:(float)r g:(float)g b:(float)b a:(float)a
{
    self.lineColor = [UIColor colorWithRed:r green:g blue:b alpha:a];
      NSLog(@"color%@",lineColor);
    //self.lineAlpha = a;
}

@end
