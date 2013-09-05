//
//  UITextField+DashedBorder.m
//  PH-Log
//
//  Created by dev on 6/20/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DashedBorderUITextField.h"
#import <QuartzCore/QuartzCore.h>

#define dotRadius 2

@implementation DashedBorderUITextField
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAShapeLayer *shapelayer = [[CAShapeLayer alloc] init];
    [self.layer addSublayer:shapelayer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //draw a line
    [path moveToPoint:CGPointMake(0, self.frame.size.height-1)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height-1)];// add yourEndPoint here
    //[path stroke];
    
    float dashPattern[] = {3,3}; //make your pattern here
    [path setLineDash:dashPattern count:4 phase:0];
    
    UIColor *fill = [UIColor blackColor];
    shapelayer.strokeStart = 0.0;
    shapelayer.strokeColor = fill.CGColor;
    shapelayer.lineWidth = 1.0;
    shapelayer.lineJoin = kCALineJoinMiter;
    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:3], nil];
    shapelayer.lineDashPhase = 0.0f;
    shapelayer.path = path.CGPath;
}

@end
