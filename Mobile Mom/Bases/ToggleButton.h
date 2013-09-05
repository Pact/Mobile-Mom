//
//  ToggleButton.h
//  away.MD
//
//  Created by dev on 3/25/13.
//  Copyright (c) 2013 Mobicratic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToggleButtonDelegate;

@interface ToggleButton : UIButton

@property BOOL isSelected;
@property (strong, nonatomic) id<ToggleButtonDelegate> delegate;
@property (nonatomic, strong) NSString *selectedImageName;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, weak) ToggleButton *oppositeButton;

- (void)registerOppositeButton:(ToggleButton *)oppositeButton;

- (void)turnOn;
- (void)turnOff;

@end

@protocol ToggleButtonDelegate <NSObject>

- (void)toggleButtonDidChange:(ToggleButton *)btn;

@end
