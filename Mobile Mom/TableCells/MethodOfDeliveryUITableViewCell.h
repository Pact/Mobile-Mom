//
//  MethodOfDeliveryUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "RadioButton.h"

@interface MethodOfDeliveryUITableViewCell : UITableViewCell<CustomUITableViewCell>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnassisted;
@property (weak, nonatomic) IBOutlet RadioButton *btnAssistedForceps;
@property (weak, nonatomic) IBOutlet RadioButton *btnAssistedVacuum;
@property (weak, nonatomic) IBOutlet RadioButton *btnDrugInducedPitocin;
@property (weak, nonatomic) IBOutlet RadioButton *btnDrugInducedOther;
@property (weak, nonatomic) IBOutlet RadioButton *btnCSection;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknown;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)clickedMethodOfDelivery:(id)sender;

@end
