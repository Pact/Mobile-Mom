//
//  TestingUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "TestingUITableViewCell.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>
#import "UIButton+Switch.h"
#import "Constants.h"
#import "Catalyze.h"

@interface TestingUITableViewCell()

@property (strong, nonatomic) RadioGroup *groupAmniocentesis;
@property (strong, nonatomic) RadioGroup *groupMethod;
@property (strong, nonatomic) RadioGroup *groupChorionic;

@end

@implementation TestingUITableViewCell

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
    
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_switchAmniocentesis initSwitch];
    [_switchChorionic initSwitch];
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAmniocentesis] boolValue]) {
        [_switchAmniocentesis toggleOn];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicVilius] boolValue]) {
        [_switchChorionic toggleOn];
    }
    
    if (!_groupAmniocentesis) {
        _groupAmniocentesis = [[RadioGroup alloc] init];
        [_groupAmniocentesis registerButton:_btnNormalAmniocentesis];
        [_groupAmniocentesis registerButton:_btnAbnormalAmniocentesis];
        [_groupAmniocentesis registerButton:_btnUnknownAmniocentesis];
        
        [_btnNormalAmniocentesis setSelectedImageName:@"normal-selected"];
        [_btnNormalAmniocentesis setImageName:@"normal"];
        
        [_btnAbnormalAmniocentesis setSelectedImageName:@"abnormal-selected"];
        [_btnAbnormalAmniocentesis setImageName:@"abnormal"];
        
        [_btnUnknownAmniocentesis setSelectedImageName:@"question-selected"];
        [_btnUnknownAmniocentesis setImageName:@"question"];
    }
    [_sliderTrimester setValue:[[[CatalyzeUser currentUser] extraForKey:kAmniocentesisTrimester] floatValue]];
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAmniocentesisResultNormal] boolValue]) {
        [_groupAmniocentesis clickedButton:_btnNormalAmniocentesis];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAmniocentesisResultAbnormal] boolValue]) {
        [_groupAmniocentesis clickedButton:_btnAbnormalAmniocentesis];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLAmniocentesisResultUnknown] boolValue]) {
        [_groupAmniocentesis clickedButton:_btnUnknownAmniocentesis];
    }
    
    if (!_groupMethod) {
        _groupMethod = [[RadioGroup alloc] init];
        [_groupMethod registerButton:_btnTransabdominal];
        [_groupMethod registerButton:_btnTranscervical];
        
        _btnTransabdominal.layer.cornerRadius = 5;
        [_btnTransabdominal setSelectedImageName:@"check-white"];
        [_btnTransabdominal setImageName:@""];
        
        _btnTranscervical.layer.cornerRadius = 5;
        [_btnTranscervical setSelectedImageName:@"check-white"];
        [_btnTranscervical setImageName:@""];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicViliusMethodTransabdominal] boolValue]) {
        [_groupMethod clickedButton:_btnTransabdominal];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicViliusMethodTranscervical] boolValue]) {
        [_groupMethod clickedButton:_btnTranscervical];
    }
    
    if (!_groupChorionic) {
        _groupChorionic = [[RadioGroup alloc] init];
        [_groupChorionic registerButton:_btnNormalChorionic];
        [_groupChorionic registerButton:_btnAbnormalChorionic];
        [_groupChorionic registerButton:_btnUnknownChorionic];
        
        [_btnNormalChorionic setSelectedImageName:@"normal-selected"];
        [_btnNormalChorionic setImageName:@"normal"];
        
        [_btnAbnormalChorionic setSelectedImageName:@"abnormal-selected"];
        [_btnAbnormalChorionic setImageName:@"abnormal"];
        
        [_btnUnknownChorionic setSelectedImageName:@"question-selected"];
        [_btnUnknownChorionic setImageName:@"question"];
    }
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicViliusResultNormal] boolValue]) {
        [_groupChorionic clickedButton:_btnNormalChorionic];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicViliusResultAbnormal] boolValue]) {
        [_groupChorionic clickedButton:_btnAbnormalChorionic];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLChorionicViliusResultUnknown] boolValue]) {
        [_groupChorionic clickedButton:_btnUnknownChorionic];
    }
    
    [_txtResultsAmniocentesis setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtResultsChorionic setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [_txtResultsAmniocentesis setText:[[CatalyzeUser currentUser] extraForKey:kAmniocentesisResult]];
    [_txtResultsChorionic setText:[[CatalyzeUser currentUser] extraForKey:kChorionicViliusResult]];
    
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
    return 555.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    [_txtResultsAmniocentesis setUserInteractionEnabled:enabled];
    [_txtResultsAmniocentesis setHidden:!enabled];
    
    [_txtResultsChorionic setUserInteractionEnabled:enabled];
    [_txtResultsChorionic setHidden:!enabled];
    
    [_switchAmniocentesis setUserInteractionEnabled:enabled];
    [_switchAmniocentesis setHidden:!enabled];
    
    [_switchChorionic setUserInteractionEnabled:enabled];
    [_switchChorionic setHidden:!enabled];
    
    [_sliderTrimester setUserInteractionEnabled:enabled];
    [_sliderTrimester setHidden:!enabled];
    
    for (RadioButton *rb in _groupAmniocentesis.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupMethod.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (RadioButton *rb in _groupChorionic.buttons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    
    for (UILabel *l in _smallLabels) {
        [l setHidden:!enabled];
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [[CatalyzeUser currentUser] setExtra:_txtResultsAmniocentesis.text forKey:kAmniocentesisResult];
    [[CatalyzeUser currentUser] setExtra:_txtResultsChorionic.text forKey:kChorionicViliusResult];
    [self checkForFinish];
    return YES;
}

- (IBAction)clickedAmniocentesis:(id)sender {
    NSLog(@"clicked amniocentesis");
    [_groupAmniocentesis clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAmniocentesisResultNormal];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAmniocentesisResultAbnormal];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLAmniocentesisResultUnknown];
    
    if (sender == _btnNormalAmniocentesis) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAmniocentesisResultNormal];
    } else if (sender == _btnAbnormalAmniocentesis) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAmniocentesisResultAbnormal];
    } else if (sender == _btnUnknownAmniocentesis) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLAmniocentesisResultUnknown];
    }
    [self checkForFinish];
}

- (IBAction)clickedAmniocentesisSwitch:(id)sender {
    [sender toggleOn];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchAmniocentesis.isOn] forKey:kBOOLAmniocentesis];
    [self checkForFinish];
}

- (IBAction)clickedMethod:(id)sender {
    NSLog(@"cicked method");
    [_groupMethod clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLChorionicViliusMethodTransabdominal];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLChorionicViliusMethodTranscervical];
    
    if (sender == _btnTransabdominal) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLChorionicViliusMethodTransabdominal];
    } else if (sender == _btnTranscervical) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLChorionicViliusMethodTranscervical];
    }
    
    [self checkForFinish];
}

- (IBAction)clickedChorionic:(id)sender {
    NSLog(@"clicked chorionic");
    [_groupChorionic clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLChorionicViliusResultNormal];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLChorionicViliusResultAbnormal];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLChorionicViliusResultUnknown];
    
    if (sender == _btnNormalChorionic) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLChorionicViliusResultNormal];
    } else if (sender == _btnAbnormalChorionic) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLChorionicViliusResultAbnormal];
    } else if (sender == _btnUnknownChorionic) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLChorionicViliusResultUnknown];
    }
    [self checkForFinish];
}

- (IBAction)clickedChorionicSwitch:(id)sender {
    [sender toggleOn];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_switchChorionic.isOn] forKey:kBOOLChorionicVilius];
    [self checkForFinish];
}

- (IBAction)sliderChanged:(id)sender {
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithInt:(int)_sliderTrimester.value] forKey:kAmniocentesisTrimester];
    [self checkForFinish];
}

- (void)checkForFinish {
    BOOL done = YES;
    if (_switchAmniocentesis.isOn) {
        if ([[[CatalyzeUser currentUser] extraForKey:kAmniocentesisTrimester] floatValue] == 0 || ![_groupAmniocentesis getSelectedButton] || _txtResultsAmniocentesis.text.length == 0) {
            done = NO;
        }
    }
    if (_switchChorionic.isOn) {
        if (![_groupMethod getSelectedButton] || ![_groupChorionic getSelectedButton] || _txtResultsChorionic.text.length == 0) {
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
