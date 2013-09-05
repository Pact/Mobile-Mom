//
//  EducationUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"
#import "RadioButton.h"
#import "RadioGroup.h"

@interface EducationUITableViewCell : UITableViewCell<CustomUITableViewCell>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet RadioButton *btnGrade;
@property (weak, nonatomic) IBOutlet RadioButton *btnHigh;
@property (weak, nonatomic) IBOutlet RadioButton *btnTech;
@property (weak, nonatomic) IBOutlet RadioButton *btnCollege;
@property (weak, nonatomic) IBOutlet RadioButton *btnPostCollege;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknown;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedRadioButton:(id)sender;
- (float)expandedHeight;
@end
