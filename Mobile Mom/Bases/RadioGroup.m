//
//  RadioGroup.m
//  Clearify.me
//
//  Created by dev on 5/17/13.
//  Copyright (c) 2013 Catalyze.io. All rights reserved.
//

#import "RadioGroup.h"

@implementation RadioGroup

- (void)registerButton:(RadioButton *)button {
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc] init];
    }
    [_buttons addObject:button];
}

- (void)clickedButton:(RadioButton *)button {
    for (RadioButton *b in _buttons) {
        [b turnOff];
    }
    [button turnOn];
}

- (RadioButton *)getSelectedButton {
    RadioButton *rb = nil;
    for (RadioButton *b in _buttons) {
        if (b.isSelected) {
            rb = b;
        }
    }
    return rb;
}

@end
