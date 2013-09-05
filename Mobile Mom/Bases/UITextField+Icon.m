//
//  UITextField+Icon.m
//  away.MD
//
//  Created by dev on 3/24/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import "UITextField+Icon.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UITextField (Icon)

static char overviewKey;
static char sideKey;

- (void)initWithIconSide:(NSString *)side {
    [self setSide:side];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
}

- (void)setIconName:(NSString *)iconName {
    if (!self.side) {
        [self setSide:kLeftSide];
    }
    [self initWithIconSide:self.side];
    objc_setAssociatedObject(self, &overviewKey,iconName,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.side isEqualToString:kRightSide]) {
        [self setRightViewMode:UITextFieldViewModeAlways];
    } else {
        [self setLeftViewMode:UITextFieldViewModeAlways];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    CGRect frame = imageView.frame;
    frame.origin.x+=10;
    frame.size.height = self.frame.size.height-10;
    [imageView setFrame:frame];
    
    UIView *outerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [iconName isEqualToString:@""] ? imageView.frame.size.width+10 : imageView.frame.size.width+20, imageView.frame.size.height)];
    [outerView setBackgroundColor:[UIColor clearColor]];
    [outerView setUserInteractionEnabled:NO];
    [outerView addSubview:imageView];
    
    if ([self.side isEqualToString:kRightSide]) {
        [self setRightView:outerView];
        [self setLeftViewMode:UITextFieldViewModeAlways];
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, imageView.frame.size.height)];
        [leftView setBackgroundColor:[UIColor clearColor]];
        [leftView setUserInteractionEnabled:NO];
        [self setLeftView:leftView];
    } else {
        [self setLeftView:outerView];
    }
    [self setNeedsDisplay];
}

- (NSString *)iconName {
    return objc_getAssociatedObject(self, &overviewKey);
}

- (void)setSide:(NSString *)side {
    objc_setAssociatedObject(self, &sideKey,side,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)side {
    return objc_getAssociatedObject(self, &sideKey);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
