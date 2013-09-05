//
//  TermUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "TermUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "Catalyze.h"

@implementation TermUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initToggleButtons {
    _btnUnknown.layer.cornerRadius = 5;
    [_btnUnknown setSelectedImageName:@"check-white"];
    [_btnUnknown setImageName:@""];
    _btnUnknown.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [self initToggleButtons];
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLTermUnknown] boolValue]) {
        [_btnUnknown turnOn];
    }
    
    [_sliderTerm setValue:[[[CatalyzeUser currentUser] extraForKey:kTerm] floatValue]];
    [self updateSliderValue:nil];
    
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
    
    [self checkForFinish];
}

- (void)cover:(AnimationBlock)block {
    [[CatalyzeUser currentUser] saveInBackground];
    [UIView animateWithDuration:0.2 animations:^{
        [self enableToggleButtons:NO];
        
        CGRect frame = _background.frame;
        frame.origin.x = 0;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        [_lblPlus setText:@"+"];
        [_lblPlus setTextColor:[UIColor whiteColor]];
        [_lblTitle setTextColor:[UIColor whiteColor]];
        if (block != nil) {
            block(finished);
        }
    }];
}

- (void)uncover:(AnimationBlock)block {
    [self enableToggleButtons:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        [_lblPlus setText:@"-"];
        [_lblPlus setTextColor:[UIColor colorWithRed:137.0/255.0 green:191.0/255.0 blue:251.0/255.0 alpha:1.0f]];
        [_lblTitle setTextColor:[UIColor colorWithRed:137.0/255.0 green:191.0/255.0 blue:251.0/255.0 alpha:1.0f]];
        
        CGRect frame = _background.frame;
        frame.origin.x = self.frame.size.width;
        [_background setFrame:frame];
    } completion:^(BOOL finished) {
        if (block != nil) {
            block(finished);
        }
    }];
}

- (IBAction)updateSliderValue:(id)sender {
    CGRect frame = _lblSliderValue.frame;
    frame.origin.x = _sliderTerm.frame.origin.x + (_sliderTerm.currentThumbImage.size.width/2) - (_lblSliderValue.frame.size.width/2) + ((_sliderTerm.frame.size.width-_sliderTerm.currentThumbImage.size.width)*(_sliderTerm.value-_sliderTerm.minimumValue)/(_sliderTerm.maximumValue-_sliderTerm.minimumValue));
    
    [_lblSliderValue setFrame:frame];
    [_lblSliderValue setText:[NSString stringWithFormat:@"%.0f",_sliderTerm.value]];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderTerm.value] forKey:kTerm];
    [self checkForFinish];
}

- (float)expandedHeight {
    return 205.0f;
}

- (void)toggleButtonDidChange:(ToggleButton *)btn {
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_btnUnknown.isSelected] forKey:kBOOLTermUnknown];
    [self checkForFinish];
}

- (void)enableToggleButtons:(BOOL)enabled {
    [_btnUnknown setUserInteractionEnabled:enabled];
    [_btnUnknown setHidden:!enabled];
    
    [_sliderTerm setUserInteractionEnabled:enabled];
    [_sliderTerm setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLTermUnknown] boolValue] || [[CatalyzeUser currentUser] extraForKey:kTerm]) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
