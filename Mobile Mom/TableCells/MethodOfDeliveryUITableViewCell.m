//
//  MethodOfDeliveryUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MethodOfDeliveryUITableViewCell.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "Catalyze.h"

@interface MethodOfDeliveryUITableViewCell()

@property (nonatomic, strong) RadioGroup *groupMethodOfDelivery;

@end

@implementation MethodOfDeliveryUITableViewCell

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
    
    if (!_groupMethodOfDelivery) {
        _groupMethodOfDelivery = [[RadioGroup alloc] init];
        [_groupMethodOfDelivery registerButton:_btnUnassisted];
        [_groupMethodOfDelivery registerButton:_btnAssistedForceps];
        [_groupMethodOfDelivery registerButton:_btnAssistedVacuum];
        [_groupMethodOfDelivery registerButton:_btnDrugInducedPitocin];
        [_groupMethodOfDelivery registerButton:_btnDrugInducedOther];
        [_groupMethodOfDelivery registerButton:_btnCSection];
        [_groupMethodOfDelivery registerButton:_btnUnknown];
        
        _btnUnassisted.layer.cornerRadius = 5;
        [_btnUnassisted setSelectedImageName:@"check-white"];
        [_btnUnassisted setImageName:@""];
        
        _btnAssistedForceps.layer.cornerRadius = 5;
        [_btnAssistedForceps setSelectedImageName:@"check-white"];
        [_btnAssistedForceps setImageName:@""];
        
        _btnAssistedVacuum.layer.cornerRadius = 5;
        [_btnAssistedVacuum setSelectedImageName:@"check-white"];
        [_btnAssistedVacuum setImageName:@""];
        
        _btnDrugInducedPitocin.layer.cornerRadius = 5;
        [_btnDrugInducedPitocin setSelectedImageName:@"check-white"];
        [_btnDrugInducedPitocin setImageName:@""];
        
        _btnDrugInducedOther.layer.cornerRadius = 5;
        [_btnDrugInducedOther setSelectedImageName:@"check-white"];
        [_btnDrugInducedOther setImageName:@""];
        
        _btnCSection.layer.cornerRadius = 5;
        [_btnCSection setSelectedImageName:@"check-white"];
        [_btnCSection setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryVaginalUnassisted] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnUnassisted];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryVaginalAssistedForceps] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnAssistedForceps];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnAssistedVacuum];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnDrugInducedPitocin];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnDrugInducedOther];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryCSection] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnCSection];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMethodOfDeliveryUnknown] boolValue]) {
        [_groupMethodOfDelivery clickedButton:_btnUnknown];
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

- (IBAction)clickedMethodOfDelivery:(id)sender {
    [_groupMethodOfDelivery clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryVaginalUnassisted];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryVaginalAssistedForceps];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryCSection];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLMethodOfDeliveryUnknown];
    
    if (sender == _btnUnassisted) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryVaginalUnassisted];
    } else if (sender == _btnAssistedForceps) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryVaginalAssistedForceps];
    } else if (sender == _btnAssistedVacuum) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryVaginalAssistedVacuum];
    } else if (sender == _btnDrugInducedPitocin) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryVaginalDrugInducedPitocin];
    } else if (sender == _btnDrugInducedOther) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryVaginalDrugInducedOther];
    } else if (sender == _btnCSection) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryCSection];
    } else if (sender == _btnUnknown) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLMethodOfDeliveryUnknown];
    }
    [self checkForFinish];
}

- (float)expandedHeight {
    return 380.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    for (RadioButton *rb in _groupMethodOfDelivery.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    if ([_groupMethodOfDelivery getSelectedButton]) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
