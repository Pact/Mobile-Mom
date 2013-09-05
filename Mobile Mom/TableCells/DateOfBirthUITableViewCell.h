//
//  DateOfBirthUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"

@interface DateOfBirthUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtMonth;
@property (weak, nonatomic) IBOutlet UITextField *txtDay;
@property (weak, nonatomic) IBOutlet UITextField *txtYear;
@property (weak, nonatomic) IBOutlet UITextField *txtDueDateMonth;
@property (weak, nonatomic) IBOutlet UITextField *txtDueDateDay;
@property (weak, nonatomic) IBOutlet UITextField *txtDueDateYear;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (float)expandedHeight;
@end
