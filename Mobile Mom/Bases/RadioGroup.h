//
//  RadioGroup.h
//  Clearify.me
//
//  Created by dev on 5/17/13.
//  Copyright (c) 2013 Catalyze.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RadioButton.h"

@interface RadioGroup : NSObject

@property (nonatomic, strong) NSMutableArray *buttons;

- (void)registerButton:(RadioButton *)button;
- (void)clickedButton:(RadioButton *)button;
- (RadioButton *)getSelectedButton;

@end
