//
//  RadioButton.h
//  Clearify.me
//
//  Created by dev on 5/17/13.
//  Copyright (c) 2013 Catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioButton : UIButton

@property BOOL isSelected;
@property (nonatomic, strong) NSString *selectedImageName;
@property (nonatomic, strong) NSString *imageName;

- (void)turnOn;
- (void)turnOff;

@end
