//
//  SmokingUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "SmokingUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"
#import "Catalyze.h"

@implementation SmokingUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    [_switchSmoke initSwitch];
    [_switchSecondHand initSwitch];
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLSmokedDuringPregnancy] boolValue]) {
        [_switchSmoke toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLSecondHandSmokeDuringPregnancy] boolValue]) {
        [_switchSecondHand toggleOn];
    }
    
    [_txtPacksPerDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtPacksPerDay setText:[[CatalyzeUser currentUser] extraForKey:kPacksPerDay]];
    
    [_sliderSmoke setValue:[[[CatalyzeUser currentUser] extraForKey:kSmokedDuringPregnancyTrimester] floatValue]];
    [_sliderSecondHand setValue:[[[CatalyzeUser currentUser] extraForKey:kSecondHandSmokeDuringPregnancyTrimester] floatValue]];
    
    [_lblPlus setFont:[UIFont fontWithName:@"Raleway" size:26.0f]];
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    [_lblTitle setText:title];
    
    [self checkForFinish];
}

- (void)cover:(AnimationBlock)block {
    [[CatalyzeUser currentUser] saveInBackground];
    [UIView animateWithDuration:0.2 animations:^{
        [self enableTextFields:NO];
        
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
    [self enableTextFields:YES];
    
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

- (IBAction)clickedSmokeSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchSmoke.isOn] forKey:kBOOLSmokedDuringPregnancy];
    [self checkForFinish];
}

- (IBAction)clickedSecondHandSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchSecondHand.isOn] forKey:kBOOLSecondHandSmokeDuringPregnancy];
    [self checkForFinish];
}

- (IBAction)sliderValueChanged:(id)sender {
    if (sender == _sliderSmoke) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderSmoke.value] forKey:kSmokedDuringPregnancyTrimester];
    } else if (sender == _sliderSecondHand) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderSecondHand.value] forKey:kSecondHandSmokeDuringPregnancyTrimester];
    }
    [self checkForFinish];
}

- (float)expandedHeight {
    return 425.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPacksPerDay setUserInteractionEnabled:enabled];
    [_txtPacksPerDay setHidden:!enabled];
    
    [_sliderSmoke setUserInteractionEnabled:enabled];
    [_sliderSmoke setHidden:!enabled];
    
    [_sliderSecondHand setUserInteractionEnabled:enabled];
    [_sliderSecondHand setHidden:!enabled];
    
    [_switchSmoke setUserInteractionEnabled:enabled];
    [_switchSmoke setHidden:!enabled];
    
    [_switchSecondHand setUserInteractionEnabled:enabled];
    [_switchSecondHand setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[CatalyzeUser currentUser] setExtra:_txtPacksPerDay.text forKey:kPacksPerDay];
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    BOOL done = YES;
    if (_switchSmoke.isOn) {
        if (_txtPacksPerDay.text.length == 0 || [[[CatalyzeUser currentUser] extraForKey:kSmokedDuringPregnancyTrimester] floatValue] == 0) {
            done = NO;
        }
    }
    if (_switchSecondHand.isOn && [[[CatalyzeUser currentUser] extraForKey:kSecondHandSmokeDuringPregnancyTrimester] floatValue] == 0) {
        done = NO;
    }
    if (done) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
