//
//  ToggleButton.m
//  away.MD
//
//  Created by dev on 3/25/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import "ToggleButton.h"

@implementation ToggleButton
@synthesize selectedImageName = _selectedImageName;
@synthesize imageName = _imageName;
@synthesize isSelected = _isSelected;
@synthesize oppositeButton = _oppositeButton;

- (id)init {
    self = [super init];
    if (self) {
        _isSelected = NO;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnOn)]];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _isSelected = NO;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnOn)]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isSelected = NO;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnOn)]];
    }
    return self;
}

- (void)turnOn {
    if (!_isSelected) {
        _isSelected = YES;
        [self setImage:[UIImage imageNamed:_selectedImageName] forState:UIControlStateNormal];
        if (_delegate) {
            [_delegate toggleButtonDidChange:self];
        }
        [_oppositeButton turnOff];
    } else {
        [self turnOff];
    }
}

- (void)turnOff {
    _isSelected = NO;
    [self setImage:[UIImage imageNamed:_imageName] forState:UIControlStateNormal];
    if (_delegate) {
        [_delegate toggleButtonDidChange:self];
    }
}

- (void)registerOppositeButton:(ToggleButton *)oppositeButton {
    _oppositeButton = oppositeButton;
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
