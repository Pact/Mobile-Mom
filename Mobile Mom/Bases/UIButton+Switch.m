//
//  UIButton+Switch.m
//  away.MD
//
//  Created by dev on 4/12/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import "UIButton+Switch.h"
#import <objc/runtime.h>

@implementation UIButton (Switch)

static char onKey;

- (void)initSwitch {
    [self setOn:[NSNumber numberWithBool:YES]];
    [self toggleOn];
}

- (void)toggleOn {
    [self setOn:[NSNumber numberWithBool:!self.on.boolValue]];
    if (self.on.boolValue == YES) {
        [self setImage:[UIImage imageNamed:@"yes@2x"] forState:UIControlStateNormal];
    } else {
        [self setImage:[UIImage imageNamed:@"no@2x"] forState:UIControlStateNormal];
    }
}

- (BOOL)isOn {
    return self.on.boolValue;
}

- (void)setOn:(NSNumber *)on {
    objc_setAssociatedObject(self, &onKey,on,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)on {
    return objc_getAssociatedObject(self, &onKey);
}

@end
