//
//  DateOfBirthUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ParentsDateOfBirthUITableViewCell.h"
#import "Constants.h"
#import "Catalyze.h"

@implementation ParentsDateOfBirthUITableViewCell

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
    [_txtMotherMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMotherDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMotherYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFatherYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtMotherMonth setText:[[CatalyzeUser currentUser] extraForKey:kMotherMonth]];
    [_txtMotherDay setText:[[CatalyzeUser currentUser] extraForKey:kMotherDay]];
    [_txtMotherYear setText:[[CatalyzeUser currentUser] extraForKey:kMotherYear]];
    [_txtFatherMonth setText:[[CatalyzeUser currentUser] extraForKey:kFatherMonth]];
    [_txtFatherDay setText:[[CatalyzeUser currentUser] extraForKey:kFatherDay]];
    [_txtFatherYear setText:[[CatalyzeUser currentUser] extraForKey:kFatherYear]];
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
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

- (float)expandedHeight {
    return 200.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtMotherMonth setUserInteractionEnabled:enabled];
    [_txtMotherMonth setHidden:!enabled];
    
    [_txtMotherDay setUserInteractionEnabled:enabled];
    [_txtMotherDay setHidden:!enabled];
    
    [_txtMotherYear setUserInteractionEnabled:enabled];
    [_txtMotherYear setHidden:!enabled];
    
    [_txtFatherMonth setUserInteractionEnabled:enabled];
    [_txtFatherMonth setHidden:!enabled];
    
    [_txtFatherDay setUserInteractionEnabled:enabled];
    [_txtFatherDay setHidden:!enabled];
    
    [_txtFatherYear setUserInteractionEnabled:enabled];
    [_txtFatherYear setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtMotherMonth) {
        [_txtMotherDay becomeFirstResponder];
    } else if (textField == _txtMotherDay) {
        [_txtMotherYear becomeFirstResponder];
    } else if (textField == _txtMotherYear) {
        [_txtFatherMonth becomeFirstResponder];
    } else if (textField == _txtFatherMonth) {
        [_txtFatherDay becomeFirstResponder];
    } else if (textField == _txtFatherDay) {
        [_txtFatherYear becomeFirstResponder];
    }
    
    [[CatalyzeUser currentUser] setExtra:_txtMotherMonth.text forKey:kMotherMonth];
    [[CatalyzeUser currentUser] setExtra:_txtMotherDay.text forKey:kMotherDay];
    [[CatalyzeUser currentUser] setExtra:_txtMotherYear.text forKey:kMotherYear];
    [[CatalyzeUser currentUser] setExtra:_txtFatherMonth.text forKey:kFatherMonth];
    [[CatalyzeUser currentUser] setExtra:_txtFatherDay.text forKey:kFatherDay];
    [[CatalyzeUser currentUser] setExtra:_txtFatherYear.text forKey:kFatherYear];
    
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    if (_txtFatherDay.text.length > 0 && _txtFatherMonth.text.length > 0 && _txtFatherYear.text.length > 0 && _txtMotherDay.text.length > 0 && _txtMotherMonth.text.length > 0 && _txtMotherYear.text.length > 0) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
