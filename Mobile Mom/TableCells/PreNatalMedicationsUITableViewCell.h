//
//  PreNatalMedicationsUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"

@interface PreNatalMedicationsUITableViewCell : UITableViewCell<CustomUITableViewCell>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *switchPrescription;
@property (weak, nonatomic) IBOutlet UISlider *sliderPrescription;
@property (weak, nonatomic) IBOutlet UITextField *txtPrescription;
@property (weak, nonatomic) IBOutlet UIButton *switchNonPrescription;
@property (weak, nonatomic) IBOutlet UISlider *sliderNonPrescription;
@property (weak, nonatomic) IBOutlet UITextField *txtNonPrescription;
@property (weak, nonatomic) IBOutlet UIButton *switchVitamins;
@property (weak, nonatomic) IBOutlet UISlider *sliderVitamins;
@property (weak, nonatomic) IBOutlet UITextField *txtVitamins;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)clickedPrescriptionSwitch:(id)sender;
- (IBAction)clickedNonPrescriptionSwitch:(id)sender;
- (IBAction)clickedVitaminsSwitch:(id)sender;

@end
