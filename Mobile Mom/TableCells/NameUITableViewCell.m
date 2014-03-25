//
//  CustomUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "NameUITableViewCell.h"
#import "Constants.h"
#import "Catalyze.h"

@interface NameUITableViewCell()

@end

@implementation NameUITableViewCell

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
    [_txtMI setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtLastName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtFirstName setText:[[[CatalyzeUser currentUser] name] firstName]];
    [_txtMI setText:[[CatalyzeUser currentUser] extraForKey:kMiddleInitial]];
    [_txtLastName setText:[[[CatalyzeUser currentUser] name] lastName]];
    
    [_txtLastName setNeedsLayout];
    [_txtFirstName setNeedsLayout];
    [_txtMI setNeedsLayout];
    
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
    return 100.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtFirstName setUserInteractionEnabled:enabled];
    [_txtFirstName setHidden:!enabled];
    
    [_txtLastName setUserInteractionEnabled:enabled];
    [_txtLastName setHidden:!enabled];
    
    [_txtMI setUserInteractionEnabled:enabled];
    [_txtMI setHidden:!enabled];
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtFirstName) {
        [_txtMI becomeFirstResponder];
    } else if (textField == _txtMI) {
        [_txtLastName becomeFirstResponder];
    }
    
    [[CatalyzeUser currentUser] setExtra:_txtMI.text forKey:@"middle_initial"];
    [[[CatalyzeUser currentUser] name] setFirstName:_txtFirstName.text];
    [[[CatalyzeUser currentUser] name] setLastName:_txtLastName.text];
    
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    if (_txtFirstName.text.length > 0 && _txtLastName.text.length > 0 && _txtMI.text.length > 0) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
