//
//  RaceUITableViewCell.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "RaceUITableViewCell.h"
#import "RadioGroup.h"
#import "Constants.h"
#import "Catalyze.h"

@interface RaceUITableViewCell()

@property (strong, nonatomic) RadioGroup *groupRace;
@property (strong, nonatomic) NSDictionary *races;
@property BOOL chosen;

@end

@implementation RaceUITableViewCell

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
    _chosen = NO;
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:12.0f]];
    }
    [_lblRace setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    [_txtOther setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_btnRace.titleLabel setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    
    for (RadioButton *rb in _radioButtons) {
        rb.selectedImageName = @"normal-selected";
        rb.imageName = @"circle-dark-blue";
    }
    
    if (!_races) {
        _races = [NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"Indian/Pakistani",@"Filipino",@"Chinese",@"Hmong",@"Japanese",@"Korean",@"Vietnamese",@"Other", nil], @"Asian",[NSArray array], @"White/Non Hispanic",[NSArray arrayWithObjects:@"Hispanic", @"African American", nil], @"Black",[NSArray array], @"Native American",[NSArray array], @"Polynesian",[NSArray array], @"West Indies/Caribbean",[NSArray array], @"First Nations (Canada)",[NSArray array], @"Aboriginal (Australia)",[NSArray array], @"Middle-Eastern",[NSArray arrayWithObjects:@"Central American", @"South American", @"Mexican",@"Dominican/Dominican Republic", nil], @"White/Hispanic", nil];
    }
    [_pickerRace reloadAllComponents];
    
    if (!_groupRace) {
        _groupRace = [[RadioGroup alloc] init];
        [_groupRace registerButton:_btnOne];
        [_groupRace registerButton:_btnTwo];
        [_groupRace registerButton:_btnThree];
        [_groupRace registerButton:_btnFour];
        [_groupRace registerButton:_btnFive];
        [_groupRace registerButton:_btnSix];
        [_groupRace registerButton:_btnSeven];
        [_groupRace registerButton:_btnEight];
        [_groupRace registerButton:_btnOther];
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
    if ([[CatalyzeUser currentUser] extraForKey:kRaceSection]) {
        _chosen = YES;
        [self updateRacesWithRace:[[CatalyzeUser currentUser] extraForKey:kRaceSection]];
        if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblOne.text]) {
            [_groupRace clickedButton:_btnOne];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblTwo.text]) {
            [_groupRace clickedButton:_btnTwo];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblThree.text]) {
            [_groupRace clickedButton:_btnThree];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblFour.text]) {
            [_groupRace clickedButton:_btnFour];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblFive.text]) {
            [_groupRace clickedButton:_btnFive];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblSix.text]) {
            [_groupRace clickedButton:_btnSix];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblSeven.text]) {
            [_groupRace clickedButton:_btnSeven];
        } else if ([[[CatalyzeUser currentUser] extraForKey:kRace] isEqualToString:_lblEight.text]) {
            [_groupRace clickedButton:_btnEight];
        } else {
            [_groupRace clickedButton:_btnOther];
            [_txtOther setText:[[CatalyzeUser currentUser] extraForKey:kRace]];
        }
    } else {
        [self updateRacesWithRace:_lblRace.text];
    }
    
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

- (void)updateRacesWithRace:(NSString *)race {
    
    [[CatalyzeUser currentUser] setExtra:race forKey:kRaceSection];
    
    [_lblRace setText:race];
    for (RadioButton *rb in _radioButtons) {
        [rb setUserInteractionEnabled:NO];
        [rb setHidden:YES];
    }
    for (UILabel *l in _labels) {
        [l setHidden:YES];
    }
    int num = [[_races objectForKey:race] count];
    [_btnOther setUserInteractionEnabled:YES];
    [_btnOther setHidden:NO];
    RadioButton *lastBtn = _btnOne;
    if (num == 0) {
        [_btnOne setUserInteractionEnabled:YES];
        [_btnOne setHidden:NO];
        [_lblOne setHidden:NO];
        [_lblOne setText:race];
        [_groupRace clickedButton:_btnOne];
    } else {
        if (num >= 1) {
            [_btnOne setUserInteractionEnabled:YES];
            [_btnOne setHidden:NO];
            [_lblOne setHidden:NO];
            [_lblOne setText:[[_races objectForKey:race] objectAtIndex:0]];
        }
        if (num >= 2) {
            [_btnTwo setUserInteractionEnabled:YES];
            [_btnTwo setHidden:NO];
            [_lblTwo setHidden:NO];
            [_lblTwo setText:[[_races objectForKey:race] objectAtIndex:1]];
            lastBtn = _btnTwo;
        }
        if (num >= 3) {
            [_btnThree setUserInteractionEnabled:YES];
            [_btnThree setHidden:NO];
            [_lblThree setHidden:NO];
            [_lblThree setText:[[_races objectForKey:race] objectAtIndex:2]];
            lastBtn = _btnThree;
        }
        if (num >= 4) {
            [_btnFour setUserInteractionEnabled:YES];
            [_btnFour setHidden:NO];
            [_lblFour setHidden:NO];
            [_lblFour setText:[[_races objectForKey:race] objectAtIndex:3]];
            lastBtn = _btnFour;
        }
        if (num >= 5) {
            [_btnFive setUserInteractionEnabled:YES];
            [_btnFive setHidden:NO];
            [_lblFive setHidden:NO];
            [_lblFive setText:[[_races objectForKey:race] objectAtIndex:4]];
            lastBtn = _btnFive;
        }
        if (num >= 6) {
            [_btnSix setUserInteractionEnabled:YES];
            [_btnSix setHidden:NO];
            [_lblSix setHidden:NO];
            [_lblSix setText:[[_races objectForKey:race] objectAtIndex:5]];
            lastBtn = _btnSix;
        }
        if (num >= 7) {
            [_btnSeven setUserInteractionEnabled:YES];
            [_btnSeven setHidden:NO];
            [_lblSeven setHidden:NO];
            [_lblSeven setText:[[_races objectForKey:race] objectAtIndex:6]];
            lastBtn = _btnSeven;
        }
        if (num >= 8) {
            [_btnEight setUserInteractionEnabled:YES];
            [_btnEight setHidden:NO];
            [_lblEight setHidden:NO];
            [_lblEight setText:[[_races objectForKey:race] objectAtIndex:7]];
            lastBtn = _btnEight;
        }
    }
    
    CGRect frame = _btnOther.frame;
    frame.origin.y = lastBtn.frame.origin.y + lastBtn.frame.size.height + 8;
    [_btnOther setFrame:frame];
    
    CGRect frame2 = _txtOther.frame;
    frame2.origin.y = frame.origin.y;
    [_txtOther setFrame:frame2];
}

- (IBAction)confirmPicker:(id)sender {
    [self cancelPicker:nil];
    [self updateRacesWithRace:[[_races allKeys] objectAtIndex:[_pickerRace selectedRowInComponent:0]]];
}

- (IBAction)cancelPicker:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _raceToolbar.frame;
        frame.origin.y = 300;
        [_raceToolbar setFrame:frame];
        
        CGRect frame2 = _pickerRace.frame;
        frame2.origin.y = 344;
        [_pickerRace setFrame:frame2];
    } completion:^(BOOL finished) {
        [_raceToolbar setUserInteractionEnabled:NO];
        [_raceToolbar setHidden:YES];
        
        [_pickerRace setUserInteractionEnabled:NO];
        [_pickerRace setHidden:YES];
    }];
}

- (IBAction)clickedButton:(id)sender {
    [_groupRace clickedButton:sender];
    _chosen = YES;
    if (sender == _btnOne) {
        [[CatalyzeUser currentUser] setExtra:_lblOne.text forKey:kRace];
    } else if (sender == _btnTwo) {
        [[CatalyzeUser currentUser] setExtra:_lblTwo.text forKey:kRace];
    } else if (sender == _btnThree) {
        [[CatalyzeUser currentUser] setExtra:_lblThree.text forKey:kRace];
    } else if (sender == _btnFour) {
        [[CatalyzeUser currentUser] setExtra:_lblFour.text forKey:kRace];
    } else if (sender == _btnFive) {
        [[CatalyzeUser currentUser] setExtra:_lblFive.text forKey:kRace];
    } else if (sender == _btnSix) {
        [[CatalyzeUser currentUser] setExtra:_lblSix.text forKey:kRace];
    } else if (sender == _btnSeven) {
        [[CatalyzeUser currentUser] setExtra:_lblSeven.text forKey:kRace];
    } else if (sender == _btnEight) {
        [[CatalyzeUser currentUser] setExtra:_lblEight.text forKey:kRace];
    } else if (sender == _btnOther) {
        [[CatalyzeUser currentUser] setExtra:_txtOther.text forKey:kRace];
    }
    if (sender != _btnOther) {
        [_txtOther setText:@""];
    }
    [self checkForFinish];
}

- (IBAction)chooseRace:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        [_raceToolbar setUserInteractionEnabled:YES];
        [_raceToolbar setHidden:NO];
        
        [_pickerRace setUserInteractionEnabled:YES];
        [_pickerRace setHidden:NO];
        
        CGRect frame = _raceToolbar.frame;
        frame.origin.y = 300-44-_pickerRace.frame.size.height;
        [_raceToolbar setFrame:frame];
        
        CGRect frame2 = _pickerRace.frame;
        frame2.origin.y = _raceToolbar.frame.size.height+_raceToolbar.frame.origin.y;
        [_pickerRace setFrame:frame2];
    }];
}

- (float)expandedHeight {
    return 450.0f;
}

- (void)enableTextFields:(BOOL)enabled {
    for (RadioButton *rb in _radioButtons) {
        [rb setUserInteractionEnabled:enabled];
        [rb setHidden:!enabled];
    }
    for (UILabel *l in _labels) {
        [l setHidden:!enabled];
    }
    [_lblRace setHidden:!enabled];
    
    [_btnRace setUserInteractionEnabled:enabled];
    [_btnRace setHidden:!enabled];
    
    [_txtOther setUserInteractionEnabled:enabled];
    [_txtOther setHidden:!enabled];
    
    [_imgDropdown setHidden:!enabled];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (_txtOther.text.length > 0) {
        [_groupRace clickedButton:_btnOther];
        [[CatalyzeUser currentUser] setExtra:_txtOther.text forKey:kRace];
    }
    [self checkForFinish];
    return YES;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[_races allKeys] objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)checkForFinish {
    if (_chosen) {
        [_imgCheck setHidden:NO];
    } else {
        [_imgCheck setHidden:YES];
    }
}

@end
