//
//  CustomUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PediatricianUITableViewCell.h"
#import "Constants.h"
#import "Catalyze.h"

@interface PediatricianUITableViewCell()

@end

@implementation PediatricianUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    [_txtFirstName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtPhone setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtLastName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtFirstName setText:[[CatalyzeUser currentUser] extraForKey:kPediatricianFirstName]];
    [_txtPhone setText:[[CatalyzeUser currentUser] extraForKey:kPediatricianPhone]];
    [_txtLastName setText:[[CatalyzeUser currentUser] extraForKey:kPediatricianLastName]];
    
    [_txtLastName setNeedsLayout];
    [_txtFirstName setNeedsLayout];
    [_txtPhone setNeedsLayout];
    
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
    return 140.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtFirstName setUserInteractionEnabled:enabled];
    [_txtFirstName setHidden:!enabled];
    
    [_txtLastName setUserInteractionEnabled:enabled];
    [_txtLastName setHidden:!enabled];
    
    [_txtPhone setUserInteractionEnabled:enabled];
    [_txtPhone setHidden:!enabled];
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtFirstName) {
        [_txtLastName becomeFirstResponder];
    } else if (textField == _txtLastName) {
        [_txtPhone becomeFirstResponder];
    }
    
    [[CatalyzeUser currentUser] setExtra:_txtPhone.text forKey:kPediatricianPhone];
    [[CatalyzeUser currentUser] setExtra:_txtFirstName.text forKey:kPediatricianFirstName];
    [[CatalyzeUser currentUser] setExtra:_txtLastName.text forKey:kPediatricianLastName];
    
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    if (_txtFirstName.text.length > 0 && _txtLastName.text.length > 0 && _txtPhone.text.length > 0) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
