//
//  RadioButton.m
//  Clearify.me
//
//  Created by dev on 5/17/13.
//  Copyright (c) 2013 Catalyze.io. All rights reserved.
//

#import "RadioButton.h"

@implementation RadioButton

- (id)init {
    self = [super init];
    if (self) {
        _isSelected = NO;
        _selectedImageName = @"btn-press-long";
        _imageName = @"btn-long";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _isSelected = NO;
        _selectedImageName = @"btn-press-long";
        _imageName = @"btn-long";
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isSelected = NO;
        _selectedImageName = @"btn-press-long";
        _imageName = @"btn-long";
    }
    return self;
}

- (void)turnOn {
    _isSelected = YES;
    [self setBackgroundImage:[UIImage imageNamed:_selectedImageName] forState:UIControlStateNormal];
}

- (void)turnOff {
    _isSelected = NO;
    [self setBackgroundImage:[UIImage imageNamed:_imageName] forState:UIControlStateNormal];
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
