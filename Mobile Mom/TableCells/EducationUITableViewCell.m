//
//  EducationUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "EducationUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "Catalyze.h"

@interface EducationUITableViewCell()

@property (nonatomic, strong) RadioGroup *group;

@end

@implementation EducationUITableViewCell
@synthesize group = _group;

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
    if (!_group) {
        _group = [[RadioGroup alloc] init];
        [_group registerButton:_btnGrade];
        [_group registerButton:_btnHigh];
        [_group registerButton:_btnTech];
        [_group registerButton:_btnCollege];
        [_group registerButton:_btnPostCollege];
        [_group registerButton:_btnUnknown];
        
        _btnGrade.layer.cornerRadius = 5;
        [_btnGrade setSelectedImageName:@"check-white"];
        [_btnGrade setImageName:@""];
        
        _btnHigh.layer.cornerRadius = 5;
        [_btnHigh setSelectedImageName:@"check-white"];
        [_btnHigh setImageName:@""];
        
        _btnTech.layer.cornerRadius = 5;
        [_btnTech setSelectedImageName:@"check-white"];
        [_btnTech setImageName:@""];
        
        _btnCollege.layer.cornerRadius = 5;
        [_btnCollege setSelectedImageName:@"check-white"];
        [_btnCollege setImageName:@""];
        
        _btnPostCollege.layer.cornerRadius = 5;
        [_btnPostCollege setSelectedImageName:@"check-white"];
        [_btnPostCollege setImageName:@""];
        
        _btnUnknown.layer.cornerRadius = 5;
        [_btnUnknown setSelectedImageName:@"check-white"];
        [_btnUnknown setImageName:@""];
    }
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationCollege] boolValue]) {
        [_group clickedButton:_btnCollege];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationGrade] boolValue]) {
        [_group clickedButton:_btnGrade];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationHigh] boolValue]) {
        [_group clickedButton:_btnHigh];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationPostCollege] boolValue]) {
        [_group clickedButton:_btnPostCollege];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationTech] boolValue]) {
        [_group clickedButton:_btnTech];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLEducationUnknown] boolValue]) {
        [_group clickedButton:_btnUnknown];
    }
    
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
        [self enableRadioButtons:NO];
        
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
    [self enableRadioButtons:YES];
    
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

- (IBAction)clickedRadioButton:(id)sender {
    [_group clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationCollege];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationGrade];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationHigh];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationPostCollege];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationTech];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:NO] forKey:kBOOLEducationUnknown];
    
    if (sender == _btnCollege) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationCollege];
    } else if (sender == _btnGrade) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationGrade];
    } else if (sender == _btnHigh) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationHigh];
    } else if (sender == _btnPostCollege) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationPostCollege];
    } else if (sender == _btnTech) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationTech];
    } else if (sender == _btnUnknown) {
        [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:YES] forKey:kBOOLEducationUnknown];
    }
        
    [self checkForFinish];
}

- (float)expandedHeight {
    return 290.0f;
}

- (void)enableRadioButtons:(BOOL)enabled {
    [_btnGrade setUserInteractionEnabled:enabled];
    [_btnGrade setHidden:!enabled];
    
    [_btnHigh setUserInteractionEnabled:enabled];
    [_btnHigh setHidden:!enabled];
    
    [_btnTech setUserInteractionEnabled:enabled];
    [_btnTech setHidden:!enabled];
    
    [_btnCollege setUserInteractionEnabled:enabled];
    [_btnCollege setHidden:!enabled];
    
    [_btnPostCollege setUserInteractionEnabled:enabled];
    [_btnPostCollege setHidden:!enabled];
    
    [_btnUnknown setUserInteractionEnabled:enabled];
    [_btnUnknown setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    if ([_group getSelectedButton] != nil) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
