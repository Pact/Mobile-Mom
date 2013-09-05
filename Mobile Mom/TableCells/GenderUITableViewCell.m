//
//  GenderUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "GenderUITableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "RadioGroup.h"
#import "Catalyze.h"

@interface GenderUITableViewCell()

@property (strong, nonatomic) RadioGroup *group;

@end

@implementation GenderUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithTitle:(NSString *)title {
    _btnMale.layer.cornerRadius = 5;
    [_btnMale setSelectedImageName:@"check-white"];
    [_btnMale setImageName:@""];
    
    _btnFemale.layer.cornerRadius = 5;
    [_btnFemale setSelectedImageName:@"check-white"];
    [_btnFemale setImageName:@""];
    
    _group = [[RadioGroup alloc] init];
    [_group registerButton:_btnFemale];
    [_group registerButton:_btnMale];
    
    if ([[[CatalyzeUser currentUser] extraForKey:kBOOLMale] boolValue]) {
        [_group clickedButton:_btnMale];
    } else if ([[[CatalyzeUser currentUser] extraForKey:kBOOLFemale] boolValue]) {
        [_group clickedButton:_btnFemale];
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
        [self enableToggleButtons:NO];
        
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
    [self enableToggleButtons:YES];
    
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

- (IBAction)clickedButton:(id)sender {
    [_group clickedButton:sender];
    
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:_btnMale.isSelected] forKey:kBOOLMale];
    [[CatalyzeUser currentUser] setExtra:[NSNumber numberWithBool:!_btnMale.isSelected] forKey:kBOOLFemale];
    
    [self checkForFinish];
}

- (float)expandedHeight {
    return 140.0f;
}

- (void)enableToggleButtons:(BOOL)enabled {
    [_btnFemale setUserInteractionEnabled:enabled];
    [_btnFemale setHidden:!enabled];
    
    [_btnMale setUserInteractionEnabled:enabled];
    [_btnMale setHidden:!enabled];
    
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
}

- (void)checkForFinish {
    if ([_group getSelectedButton]) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
