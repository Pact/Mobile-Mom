//
//  SmokingUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MedicalConditionsUITableViewCell.h"
#import "UIButton+Switch.h"
#import "Constants.h"

@interface MedicalConditionsUITableViewCell()

@property (strong, nonatomic) HealthLookaheadUITextFieldDelegate *lookahead;

@end

@implementation MedicalConditionsUITableViewCell

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
    for (UIButton *b in _switches) {
        [b initSwitch];
    }
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    
    [_lblTitle setFont:[UIFont fontWithName:@"Raleway" size:18.0f]];
    
    [_txtComments setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtComments setText:[[CatalyzeUser currentUser] extraForKey:kChildsMedicalHistoryComments]];
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLCongenitalHeartDisease] boolValue]) {
        [_switchCongenitalHeartDisease toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAbnormalitiesOfAorta] boolValue]) {
        [_switchAbnormalitiesOfAorta toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAbnormalitiesOfBloodVessels] boolValue]) {
        [_switchAbnormalitiesOfBloodVessels toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLSeizures] boolValue]) {
        [_switchSeizures toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLDevelopmentalDelay] boolValue]) {
        [_switchDevelopmentalDelay toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLHypertension] boolValue]) {
        [_switchHypertension toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLStroke] boolValue]) {
        [_switchStroke toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMigraine] boolValue]) {
        [_switchMigraine toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLOcularAbnormalities] boolValue]) {
        [_switchOcularAbnormalities toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEndocrineAbnormalities] boolValue]) {
        [_switchEndocrineAbnormalities toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMastocytosis] boolValue]) {
        [_switchMastocytosis toggleOn];
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
    return 660.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtComments setUserInteractionEnabled:enabled];
    [_txtComments setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    for (UIButton *b in _switches) {
        [b setUserInteractionEnabled:enabled];
        [b setHidden:!enabled];
    }
}

- (IBAction)clickedSwitch:(id)sender {
    [sender toggleOn];
    
    if (sender == _switchAbnormalitiesOfAorta) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchAbnormalitiesOfAorta.isOn] forKey:kBOOLAbnormalitiesOfAorta];
    } else if (sender == _switchAbnormalitiesOfBloodVessels) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchAbnormalitiesOfBloodVessels.isOn] forKey:kBOOLAbnormalitiesOfBloodVessels];
    } else if (sender == _switchCongenitalHeartDisease) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchCongenitalHeartDisease.isOn] forKey:kBOOLCongenitalHeartDisease];
    } else if (sender == _switchDevelopmentalDelay) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchDevelopmentalDelay.isOn] forKey:kBOOLDevelopmentalDelay];
    } else if (sender == _switchEndocrineAbnormalities) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchEndocrineAbnormalities.isOn] forKey:kBOOLEndocrineAbnormalities];
    } else if (sender == _switchHypertension) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchHypertension.isOn] forKey:kBOOLHypertension];
    } else if (sender == _switchMastocytosis) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchMastocytosis.isOn] forKey:kBOOLMastocytosis];
    } else if (sender == _switchMigraine) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchMigraine.isOn] forKey:kBOOLMigraine];
    } else if (sender == _switchOcularAbnormalities) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchOcularAbnormalities.isOn] forKey:kBOOLOcularAbnormalities];
    } else if (sender == _switchSeizures) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchSeizures.isOn] forKey:kBOOLSeizures];
    } else if (sender == _switchStroke) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchStroke.isOn] forKey:kBOOLStroke];
    }
}

- (void)checkForFinish {
    BOOL done = YES;
    if (done) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[CatalyzeUser currentUser] setExtra:_txtComments.text forKey:kChildsMedicalHistoryComments];
    return YES;
}

@end
