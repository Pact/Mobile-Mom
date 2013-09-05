//
//  MobicraticNavigationBar.m
//  Mobicratic
//
//  Created by Josh Holtz on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClearifyNavigationBar.h"

@interface ClearifyNavigationBar()

@property (nonatomic, strong) UILabel *lblTitle;

@end

@implementation ClearifyNavigationBar

- (id)init {
    self = [super init];
    if (self) {
        [self addTitle];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTitle];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTitle];
    }
    return self;
}

- (void)addTitle {
    _lblTitle = [[UILabel alloc] init];
    [_lblTitle setText:@"Clearify.ME"];
    [_lblTitle setTextColor:[UIColor whiteColor]];
    [_lblTitle setFrame:self.frame];
    [_lblTitle setBackgroundColor:[UIColor clearColor]];
    [_lblTitle setFont:[UIFont boldSystemFontOfSize:20]];
    [_lblTitle setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:_lblTitle];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIImage imageNamed:@"navbar"] drawInRect:rect];
}

- (void)setTitle:(NSString *)title {
    [_lblTitle setText:title];
}

@end
