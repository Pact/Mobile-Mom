//
//  DateOfBirthUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"

@interface ParentsDateOfBirthUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtMotherMonth;
@property (weak, nonatomic) IBOutlet UITextField *txtMotherDay;
@property (weak, nonatomic) IBOutlet UITextField *txtMotherYear;
@property (weak, nonatomic) IBOutlet UITextField *txtFatherMonth;
@property (weak, nonatomic) IBOutlet UITextField *txtFatherDay;
@property (weak, nonatomic) IBOutlet UITextField *txtFatherYear;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (float)expandedHeight;
@end
