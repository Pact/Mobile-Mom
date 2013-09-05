//
//  PreConceptionUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PreConceptionUITableViewCell.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Switch.h"
#import "Constants.h"
#import "Catalyze.h"

@interface PreConceptionUITableViewCell()

@property (nonatomic, strong) RadioGroup *groupAssistedConception;
@property (nonatomic, strong) RadioGroup *groupMultipleGestation;
@property (nonatomic, strong) RadioGroup *groupMultipleGestationType;

@end

@implementation PreConceptionUITableViewCell

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
    
    [_switchAssistedConception initSwitch];
    [_switchMultipleGestation initSwitch];
    [_switchPreNatalInfertility initSwitch];
    
    if ([[CatalyzeUser currentUser] extraForKey:kBOOLPreNatalInfertility]) {
        [_switchPreNatalInfertility toggleOn];
    }
    
    if (!_groupAssistedConception) {
        _groupAssistedConception = [[RadioGroup alloc] init];
        [_groupAssistedConception registerButton:_btnInVitro];
        [_groupAssistedConception registerButton:_btnArtificialInsemination];
        [_groupAssistedConception registerButton:_btnICSE];
        [_groupAssistedConception registerButton:_btnClomid];
        [_groupAssistedConception registerButton:_btnUnknown];
        [_groupAssistedConception registerButton:_btnOther];
        
        _btnInVitro.layer.cornerRadius = 5;
        [_btnInVitro setSelectedImageName:@"check-white"];
        [_btnInVitro setImageName:@""];
        
        _btnArtificialInsemination.layer.cornerRadius = 5;
        [_btnArtificialInsemination setSelectedImageName:@"check-white"];
        [_btnArtificialInsemination setImageName:@""];
        
        _btnICSE.layer.cornerRadius = 5;
        [_btnICSE setSelectedImageName:@"check-white"];
        [_btnICSE setImageName:@""];
        
        _btnClomid.layer.cornerRadius = 5;
        [_btnClomid setSelectedImageName:@"check-white"];
        [_btnClomid setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
        
        _btnOther.layer.cornerRadius = 5;
        [_btnOther setSelectedImageName:@"check-white"];
        [_btnOther setImageName:@""];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConception] boolValue]) {
        [_switchAssistedConception toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionInVitroFertilization] boolValue]) {
        [_groupAssistedConception clickedButton:_btnInVitro];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionICSE] boolValue]) {
        [_groupAssistedConception clickedButton:_btnICSE];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionArtificialInsemination] boolValue]) {
        [_groupAssistedConception clickedButton:_btnArtificialInsemination];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionClomid] boolValue]) {
        [_groupAssistedConception clickedButton:_btnClomid];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionUnknown] boolValue]) {
        [_groupAssistedConception clickedButton:_btnUnknown];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAssistedConceptionOther] boolValue]) {
        [_groupAssistedConception clickedButton:_btnOther];
    }
    if (!_groupMultipleGestation) {
        _groupMultipleGestation = [[RadioGroup alloc] init];
        [_groupMultipleGestation registerButton:_btnTwin];
        [_groupMultipleGestation registerButton:_btnTriplet];
        [_groupMultipleGestation registerButton:_btnGreaterThanTriplet];
        
        _btnTwin.layer.cornerRadius = 5;
        [_btnTwin setSelectedImageName:@"check-white"];
        [_btnTwin setImageName:@""];
        
        _btnTriplet.layer.cornerRadius = 5;
        [_btnTriplet setSelectedImageName:@"check-white"];
        [_btnTriplet setImageName:@""];
        
        _btnGreaterThanTriplet.layer.cornerRadius = 5;
        [_btnGreaterThanTriplet setSelectedImageName:@"check-white"];
        [_btnGreaterThanTriplet setImageName:@""];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestation] boolValue]) {
        [_switchMultipleGestation toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTwin] boolValue]) {
        [_groupMultipleGestation clickedButton:_btnTwin];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTriplet] boolValue]) {
        [_groupMultipleGestation clickedButton:_btnTriplet];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationGreaterThanTriplet] boolValue]) {
        [_groupMultipleGestation clickedButton:_btnGreaterThanTriplet];
    }
    if (!_groupMultipleGestationType) {
        _groupMultipleGestationType = [[RadioGroup alloc] init];
        [_groupMultipleGestationType registerButton:_btnMonozygotic];
        [_groupMultipleGestationType registerButton:_btnDizyotic];
        [_groupMultipleGestationType registerButton:_btnMixed];
        [_groupMultipleGestationType registerButton:_btnUnknownGestation];
        
        _btnMonozygotic.layer.cornerRadius = 5;
        [_btnMonozygotic setSelectedImageName:@"check-white"];
        [_btnMonozygotic setImageName:@""];
        
        _btnDizyotic.layer.cornerRadius = 5;
        [_btnDizyotic setSelectedImageName:@"check-white"];
        [_btnDizyotic setImageName:@""];
        
        _btnMixed.layer.cornerRadius = 5;
        [_btnMixed setSelectedImageName:@"check-white"];
        [_btnMixed setImageName:@""];
        
        _btnUnknownGestation.layer.cornerRadius = 5;
        [_btnUnknownGestation setSelectedImageName:@"check-white"];
        [_btnUnknownGestation setImageName:@""];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTypeMonozygotic] boolValue]) {
        [_groupMultipleGestationType clickedButton:_btnMonozygotic];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTypeDizyotic] boolValue]) {
        [_groupMultipleGestationType clickedButton:_btnDizyotic];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTypeMixed] boolValue]) {
        [_groupMultipleGestationType clickedButton:_btnMixed];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMultipleGestationTypeUnknown] boolValue]) {
        [_groupMultipleGestationType clickedButton:_btnUnknownGestation];
    }
    
    [_txtPregnancies setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtMiscarriages setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtOther setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtPregnancies setText:[[CatalyzeUser currentUser] extraForKey:kNumberOfPregnancies]];
    [_txtMiscarriages setText:[[CatalyzeUser currentUser] extraForKey:kNumberOfSpontaneousMiscarriages]];
    [_txtOther setText:[[CatalyzeUser currentUser] extraForKey:kAssistedConceptionOther]];
    
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

- (IBAction)clickedSwitch:(id)sender {
    [((UIButton *)sender) toggleOn];
    if (sender == _switchAssistedConception) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchAssistedConception.isOn] forKey:kBOOLAssistedConception];
    } else if (sender == _switchMultipleGestation) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchMultipleGestation.isOn] forKey:kBOOLMultipleGestation];
    } else if (sender == _switchPreNatalInfertility) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchPreNatalInfertility.isOn] forKey:kBOOLPreNatalInfertility];
    }
    [self checkForFinish];
}

- (float)expandedHeight {
    return 885.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtPregnancies setUserInteractionEnabled:enabled];
    [_txtPregnancies setHidden:!enabled];
    
    [_txtMiscarriages setUserInteractionEnabled:enabled];
    [_txtMiscarriages setHidden:!enabled];
    
    [_txtOther setUserInteractionEnabled:enabled];
    [_txtOther setHidden:!enabled];
    
    [_switchAssistedConception setUserInteractionEnabled:enabled];
    [_switchAssistedConception setHidden:!enabled];
    
    [_switchMultipleGestation setUserInteractionEnabled:enabled];
    [_switchMultipleGestation setHidden:!enabled];
    
    [_switchPreNatalInfertility setUserInteractionEnabled:enabled];
    [_switchPreNatalInfertility setHidden:!enabled];
    
    for (RadioButton *rb in _groupAssistedConception.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupMultipleGestation.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupMultipleGestationType.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtPregnancies) {
        [_txtMiscarriages becomeFirstResponder];
    }
    
    [[CatalyzeUser currentUser] setExtra:_txtMiscarriages.text forKey:kNumberOfSpontaneousMiscarriages];
    [[CatalyzeUser currentUser] setExtra:_txtPregnancies.text forKey:kNumberOfPregnancies];
    [[CatalyzeUser currentUser] setExtra:_txtOther.text forKey:kAssistedConceptionOther];
    
    [self checkForFinish];
    return YES;
}

- (IBAction)clickedAssistedConception:(id)sender {
    [_groupAssistedConception clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionArtificialInsemination];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionClomid];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionICSE];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionInVitroFertilization];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionOther];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAssistedConceptionUnknown];
    
    if (sender == _btnArtificialInsemination) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionArtificialInsemination];
    } else if (sender == _btnClomid) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionClomid];
    } else if (sender == _btnICSE) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionICSE];
    } else if (sender == _btnInVitro) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionInVitroFertilization];
    } else if (sender == _btnOther) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionOther];
    } else if (sender == _btnUnknown) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAssistedConceptionUnknown];
    }
    [self checkForFinish];
}

- (IBAction)clickedMultipleGestation:(id)sender {
    [_groupMultipleGestation clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTwin];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTriplet];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationGreaterThanTriplet];
    
    if (sender == _btnTwin) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTwin];
    } else if (sender == _btnTriplet) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTriplet];
    } else if (sender == _btnGreaterThanTriplet) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationGreaterThanTriplet];
    }
    [self checkForFinish];
}

- (IBAction)clickedMultipleGestationType:(id)sender {
    [_groupMultipleGestationType clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTypeMonozygotic];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTypeDizyotic];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTypeMixed];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMultipleGestationTypeUnknown];
    
    if (sender == _btnMonozygotic) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTypeMonozygotic];
    } else if (sender == _btnDizyotic) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTypeDizyotic];
    } else if (sender == _btnMixed) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTypeMixed];
    } else if (sender == _btnUnknownGestation) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMultipleGestationTypeUnknown];
    }
    [self checkForFinish];
}

- (void)checkForFinish {
    BOOL done = NO;
    if (_txtPregnancies.text.length > 0 && _txtMiscarriages.text.length > 0) {
        done = YES;
        if (_switchAssistedConception.isOn && [_groupAssistedConception getSelectedButton] == nil) {
            done = NO;//this have the assisted conception switch on but didnt choose type
        }
        if (_switchAssistedConception.isOn && [_groupAssistedConception getSelectedButton] == _btnOther && _txtOther.text.length == 0) {
            done = NO;//assisted conception switch is on, and they chose the other button but didnt type in what other meant
        }
        if (_switchMultipleGestation.isOn && [_groupMultipleGestation getSelectedButton] == nil) {
            done = NO;//multiple gestation switch is on but they didnt choose twin triplet or > triplet
        }
        if (_switchMultipleGestation.isOn && [_groupMultipleGestationType getSelectedButton] == nil) {
            done = NO;//multiple gestation switch is on but they didnt choose type
        }
    }
    if (done) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
