//
//  UIButton+Switch.h
//  away.MD
//
//  Created by dev on 4/12/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Switch)

@property (nonatomic, strong) NSNumber *on;

- (void)toggleOn;

- (BOOL)isOn;

- (void)initSwitch;

@end
