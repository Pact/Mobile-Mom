//
//  TestingUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "RadioButton.h"

@interface TestingUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;

@property (weak, nonatomic) IBOutlet UIButton *switchAmniocentesis;
@property (weak, nonatomic) IBOutlet UISlider *sliderTrimester;
@property (weak, nonatomic) IBOutlet RadioButton *btnNormalAmniocentesis;
@property (weak, nonatomic) IBOutlet RadioButton *btnAbnormalAmniocentesis;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknownAmniocentesis;
@property (weak, nonatomic) IBOutlet UITextField *txtResultsAmniocentesis;
- (IBAction)clickedAmniocentesis:(id)sender;
- (IBAction)clickedAmniocentesisSwitch:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *switchChorionic;
@property (weak, nonatomic) IBOutlet RadioButton *btnTransabdominal;
@property (weak, nonatomic) IBOutlet RadioButton *btnTranscervical;
@property (weak, nonatomic) IBOutlet RadioButton *btnNormalChorionic;
@property (weak, nonatomic) IBOutlet RadioButton *btnAbnormalChorionic;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknownChorionic;
@property (weak, nonatomic) IBOutlet UITextField *txtResultsChorionic;

@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (IBAction)clickedMethod:(id)sender;
- (IBAction)clickedChorionic:(id)sender;
- (IBAction)clickedChorionicSwitch:(id)sender;
- (IBAction)sliderChanged:(id)sender;

- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;

@end
