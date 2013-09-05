//
//  UIButton+Icon.m
//  away.MD
//
//  Created by dev on 3/25/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import "UIButton+Icon.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UIButton (Icon)

//static char overviewKey;

- (void)initBorder {
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
}

@end
