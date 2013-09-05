//
//  SmokingUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"

@interface SmokingUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *switchSmoke;
@property (weak, nonatomic) IBOutlet UISlider *sliderSmoke;
@property (weak, nonatomic) IBOutlet UITextField *txtPacksPerDay;
@property (weak, nonatomic) IBOutlet UIButton *switchSecondHand;
@property (weak, nonatomic) IBOutlet UISlider *sliderSecondHand;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (IBAction)sliderValueChanged:(id)sender;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSmokeSwitch:(id)sender;
- (IBAction)clickedSecondHandSwitch:(id)sender;

@end
