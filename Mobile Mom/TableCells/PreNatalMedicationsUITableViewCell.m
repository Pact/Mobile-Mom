//
//  PreNatalMedicationsUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PreNatalMedicationsUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"
#import "Catalyze.h"

@implementation PreNatalMedicationsUITableViewCell

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
    
    [_switchPrescription initSwitch];
    [_switchNonPrescription initSwitch];
    [_switchVitamins initSwitch];
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLPrescriptionMedications] boolValue]) {
        [_switchPrescription toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLNonPrescriptionMedications] boolValue]) {
        [_switchNonPrescription toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLPreNatalVitamins] boolValue]) {
        [_switchVitamins toggleOn];
    }
    
    [_txtPrescription setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtNonPrescription setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtVitamins setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtPrescription setText:[[CatalyzeUser currentUser] extraForKey:kPrescriptionMedications]];
    [_txtNonPrescription setText:[[CatalyzeUser currentUser] extraForKey:kNonPrescriptionMedications]];
    [_txtVitamins setText:[[CatalyzeUser currentUser] extraForKey:kPreNatalVitamins]];
    
    [_sliderNonPrescription setValue:[[[CatalyzeUser currentUser] extraForKey:kNonPrescriptionMedicationsTrimester] floatValue]];
    [_sliderPrescription setValue:[[[CatalyzeUser currentUser] extraForKey:kPrescriptionMedicationsTrimester] floatValue]];
    [_sliderVitamins setValue:[[[CatalyzeUser currentUser] extraForKey:kPreNatalVitaminsTrimester] floatValue]];
    
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

- (IBAction)sliderValueChanged:(id)sender {
    if (sender == _sliderPrescription) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderPrescription.value] forKey:kPrescriptionMedicationsTrimester];
    } else if (sender == _sliderNonPrescription) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderNonPrescription.value] forKey:kNonPrescriptionMedicationsTrimester];
    } else if (sender == _sliderVitamins) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithFloat:(int)_sliderVitamins.value] forKey:kPreNatalVitaminsTrimester];
    }
    [self checkForFinish];
}

- (IBAction)clickedPrescriptionSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchPrescription.isOn] forKey:kBOOLPrescriptionMedications];
    [self checkForFinish];
}

- (float)expandedHeight {
    return 640.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPrescription setUserInteractionEnabled:enabled];
    [_txtPrescription setHidden:!enabled];
    
    [_txtNonPrescription setUserInteractionEnabled:enabled];
    [_txtNonPrescription setHidden:!enabled];
    
    [_txtVitamins setUserInteractionEnabled:enabled];
    [_txtVitamins setHidden:!enabled];
    
    [_switchPrescription setUserInteractionEnabled:enabled];
    [_switchPrescription setHidden:!enabled];
    
    [_switchNonPrescription setUserInteractionEnabled:enabled];
    [_switchNonPrescription setHidden:!enabled];
    
    [_switchVitamins setUserInteractionEnabled:enabled];
    [_switchVitamins setHidden:!enabled];
    
    [_sliderPrescription setUserInteractionEnabled:enabled];
    [_sliderPrescription setHidden:!enabled];
    
    [_sliderNonPrescription setUserInteractionEnabled:enabled];
    [_sliderNonPrescription setHidden:!enabled];
    
    [_sliderVitamins setUserInteractionEnabled:enabled];
    [_sliderVitamins setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    [[CatalyzeUser currentUser] setExtra:_txtPrescription.text forKey:kPrescriptionMedications];
    [[CatalyzeUser currentUser] setExtra:_txtNonPrescription.text forKey:kNonPrescriptionMedications];
    [[CatalyzeUser currentUser] setExtra:_txtVitamins.text forKey:kPreNatalVitamins];
    
    [self checkForFinish];
    return YES;
}

- (IBAction)clickedNonPrescriptionSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchNonPrescription.isOn] forKey:kBOOLNonPrescriptionMedications];
    [self checkForFinish];
}

- (IBAction)clickedVitaminsSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchVitamins.isOn] forKey:kBOOLPreNatalVitamins];
    [self checkForFinish];
}

- (void)checkForFinish {
    BOOL done = YES;
    if (_switchPrescription.isOn) {
        if (_txtPrescription.text.length == 0 || [[[CatalyzeUser currentUser] extraForKey:kPrescriptionMedicationsTrimester] floatValue] == 0) {
            done = NO;
        }
    }
    if (_switchNonPrescription.isOn) {
        if (_txtNonPrescription.text.length == 0 || [[[CatalyzeUser currentUser] extraForKey:kNonPrescriptionMedicationsTrimester] floatValue] == 0) {
            done = NO;
        }
    }
    if (_switchVitamins.isOn) {
        if (_txtVitamins.text.length == 0 || [[[CatalyzeUser currentUser] extraForKey:kPreNatalVitaminsTrimester] floatValue] == 0) {
            done = NO;
        }
    }
    if (done) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
