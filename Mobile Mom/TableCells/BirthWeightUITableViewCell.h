//
//  BirthWeightUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "ToggleButton.h"

@interface BirthWeightUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate, ToggleButtonDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet ToggleButton *btnUnknown;
@property (weak, nonatomic) IBOutlet UITextField *txtPounds;
@property (weak, nonatomic) IBOutlet UITextField *txtOunces;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
@end
