//
//  RaceUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "RadioButton.h"

@interface RaceUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutletCollection(RadioButton) NSArray *radioButtons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UITextField *txtOther;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIButton *btnRace;
@property (weak, nonatomic) IBOutlet RadioButton *btnOne;
@property (weak, nonatomic) IBOutlet RadioButton *btnTwo;
@property (weak, nonatomic) IBOutlet RadioButton *btnThree;
@property (weak, nonatomic) IBOutlet RadioButton *btnFour;
@property (weak, nonatomic) IBOutlet RadioButton *btnFive;
@property (weak, nonatomic) IBOutlet RadioButton *btnSix;
@property (weak, nonatomic) IBOutlet RadioButton *btnSeven;
@property (weak, nonatomic) IBOutlet RadioButton *btnEight;
@property (weak, nonatomic) IBOutlet RadioButton *btnOther;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerRace;
@property (weak, nonatomic) IBOutlet UIToolbar *raceToolbar;
@property (weak, nonatomic) IBOutlet UILabel *lblRace;
@property (weak, nonatomic) IBOutlet UIImageView *imgDropdown;
@property (weak, nonatomic) IBOutlet UILabel *lblOne;
@property (weak, nonatomic) IBOutlet UILabel *lblTwo;
@property (weak, nonatomic) IBOutlet UILabel *lblThree;
@property (weak, nonatomic) IBOutlet UILabel *lblFour;
@property (weak, nonatomic) IBOutlet UILabel *lblFive;
@property (weak, nonatomic) IBOutlet UILabel *lblSix;
@property (weak, nonatomic) IBOutlet UILabel *lblSeven;
@property (weak, nonatomic) IBOutlet UILabel *lblEight;
@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;
- (IBAction)clickedButton:(id)sender;
- (IBAction)chooseRace:(id)sender;
- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;
- (IBAction)confirmPicker:(id)sender;
- (IBAction)cancelPicker:(id)sender;
@end
