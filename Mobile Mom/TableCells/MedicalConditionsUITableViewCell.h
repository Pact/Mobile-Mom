//
//  SmokingUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "Catalyze.h"
#import "DashedBorderUITextField.h"

@interface MedicalConditionsUITableViewCell : UITableViewCell<UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *switches;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
@property (weak, nonatomic) IBOutlet UIButton *switchCongenitalHeartDisease;
@property (weak, nonatomic) IBOutlet UIButton *switchAbnormalitiesOfAorta;
@property (weak, nonatomic) IBOutlet UIButton *switchAbnormalitiesOfBloodVessels;
@property (weak, nonatomic) IBOutlet UIButton *switchDevelopmentalDelay;
@property (weak, nonatomic) IBOutlet UIButton *switchSeizures;
@property (weak, nonatomic) IBOutlet UIButton *switchHypertension;
@property (weak, nonatomic) IBOutlet UIButton *switchStroke;
@property (weak, nonatomic) IBOutlet UIButton *switchMigraine;
@property (weak, nonatomic) IBOutlet UIButton *switchOcularAbnormalities;
@property (weak, nonatomic) IBOutlet UIButton *switchEndocrineAbnormalities;
@property (weak, nonatomic) IBOutlet UIButton *switchMastocytosis;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtComments;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedSwitch:(id)sender;

@end
