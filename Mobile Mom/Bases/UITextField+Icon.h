//
//  UITextField+Icon.h
//  away.MD
//
//  Created by dev on 3/24/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Icon)

#define kRightSide @"right"
#define kLeftSide @"left"

@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *side;

@end
