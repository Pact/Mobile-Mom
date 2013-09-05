//
//  DateOfBirthUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DateOfBirthUITableViewCell.h"
#import "Constants.h"
#import "Catalyze.h"

@implementation DateOfBirthUITableViewCell

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
    
    [_txtMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtDueDateMonth setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDueDateDay setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtDueDateYear setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtMonth setText:[[CatalyzeUser currentUser] extraForKey:kChildMonth]];
    [_txtDay setText:[[CatalyzeUser currentUser] extraForKey:kChildDay]];
    [_txtYear setText:[[CatalyzeUser currentUser] extraForKey:kChildYear]];
    [_txtDueDateMonth setText:[[CatalyzeUser currentUser] extraForKey:kDueDateMonth]];
    [_txtDueDateDay setText:[[CatalyzeUser currentUser] extraForKey:kDueDateDay]];
    [_txtDueDateYear setText:[[CatalyzeUser currentUser] extraForKey:kDueDateYear]];
    
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
    return 170.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    
    [_txtMonth setUserInteractionEnabled:enabled];
    [_txtMonth setHidden:!enabled];
    
    [_txtDay setUserInteractionEnabled:enabled];
    [_txtDay setHidden:!enabled];
    
    [_txtYear setUserInteractionEnabled:enabled];
    [_txtYear setHidden:!enabled];
    
    [_txtDueDateMonth setUserInteractionEnabled:enabled];
    [_txtDueDateMonth setHidden:!enabled];
    
    [_txtDueDateDay setUserInteractionEnabled:enabled];
    [_txtDueDateDay setHidden:!enabled];
    
    [_txtDueDateYear setUserInteractionEnabled:enabled];
    [_txtDueDateYear setHidden:!enabled];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtMonth) {
        [_txtDay becomeFirstResponder];
    } else if (textField == _txtDay) {
        [_txtYear becomeFirstResponder];
    } else if (textField == _txtYear) {
        [_txtDueDateMonth becomeFirstResponder];
    } else if (textField == _txtDueDateMonth) {
        [_txtDueDateDay becomeFirstResponder];
    } else if (textField == _txtDueDateDay) {
        [_txtDueDateYear becomeFirstResponder];
    }
    
    [[CatalyzeUser currentUser] setExtra:_txtMonth.text forKey:kChildMonth];
    [[CatalyzeUser currentUser] setExtra:_txtDay.text forKey:kChildDay];
    [[CatalyzeUser currentUser] setExtra:_txtYear.text forKey:kChildYear];
    [[CatalyzeUser currentUser] setExtra:_txtDueDateMonth.text forKey:kDueDateMonth];
    [[CatalyzeUser currentUser] setExtra:_txtDueDateDay.text forKey:kDueDateDay];
    [[CatalyzeUser currentUser] setExtra:_txtDueDateYear.text forKey:kDueDateYear];
    
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    if (_txtDay.text.length > 0 && _txtMonth.text.length > 0 && _txtYear.text.length > 0 && _txtDueDateDay.text.length > 0 && _txtDueDateMonth.text.length > 0 && _txtDueDateYear.text.length > 0) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
