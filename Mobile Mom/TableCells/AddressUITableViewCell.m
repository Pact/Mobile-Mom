//
//  AddressUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "AddressUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"
#import "Catalyze.h"

@implementation AddressUITableViewCell

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

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchPregnancy.isOn] forKey:kBOOLAddressDuringPregnancy];
    [self checkForFinish];
}

- (void)updateCellWithTitle:(NSString *)title {
    [_switchPregnancy initSwitch];
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAddressDuringPregnancy] boolValue]) {
        [_switchPregnancy toggleOn];
    }
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_txtAddress setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtCity setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtState setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtZip setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    if ([[CatalyzeUser currentUser] addresses].count > 0) {
        [_txtAddress setText:[((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) addressLine1]];
        [_txtCity setText:[((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) city]];
        [_txtState setText:[((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) state]];
        [_txtZip setText:[((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) zipCode]];
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
    return 220.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtAddress setUserInteractionEnabled:enabled];
    [_txtAddress setHidden:!enabled];
    
    [_txtCity setUserInteractionEnabled:enabled];
    [_txtCity setHidden:!enabled];
    
    [_txtState setUserInteractionEnabled:enabled];
    [_txtState setHidden:!enabled];
    
    [_txtZip setUserInteractionEnabled:enabled];
    [_txtZip setHidden:!enabled];
    
    [_switchPregnancy setUserInteractionEnabled:enabled];
    [_switchPregnancy setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtAddress) {
        [_txtCity becomeFirstResponder];
    } else if (textField == _txtCity) {
        [_txtState becomeFirstResponder];
    } else if (textField == _txtState) {
        [_txtZip becomeFirstResponder];
    }
    
    [[[CatalyzeUser currentUser] addresses] addObject:[[Address alloc] init]];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setAddressLine1:_txtAddress.text];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setCity:_txtCity.text];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setState:_txtState.text];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setZipCode:_txtZip.text];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setCountry:@"US"];
    [((Address *)[[[CatalyzeUser currentUser] addresses] objectAtIndex:0]) setType:@"home"];
    
    [self checkForFinish];
    return YES;
}

- (void)checkForFinish {
    if (_txtAddress.text.length > 0 && _txtCity.text.length > 0 && _txtState.text.length > 0 && _txtZip.text.length > 0) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
