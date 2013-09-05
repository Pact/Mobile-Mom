//
//  PreConceptionUITableViewCell.h
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUITableViewCell.h"
#import "RadioButton.h"

@interface PreConceptionUITableViewCell : UITableViewCell<CustomUITableViewCell, UITextFieldDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPlus;
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UITextField *txtPregnancies;
@property (weak, nonatomic) IBOutlet UITextField *txtMiscarriages;
@property (weak, nonatomic) IBOutlet UIButton *switchPreNatalInfertility;
@property (weak, nonatomic) IBOutlet UIButton *switchAssistedConception;

@property (weak, nonatomic) IBOutlet RadioButton *btnInVitro;
@property (weak, nonatomic) IBOutlet RadioButton *btnICSE;
@property (weak, nonatomic) IBOutlet RadioButton *btnArtificialInsemination;
@property (weak, nonatomic) IBOutlet RadioButton *btnClomid;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknown;
@property (weak, nonatomic) IBOutlet RadioButton *btnOther;
@property (weak, nonatomic) IBOutlet UITextField *txtOther;
- (IBAction)clickedAssistedConception:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *switchMultipleGestation;

@property (weak, nonatomic) IBOutlet RadioButton *btnTwin;
@property (weak, nonatomic) IBOutlet RadioButton *btnTriplet;
@property (weak, nonatomic) IBOutlet RadioButton *btnGreaterThanTriplet;
- (IBAction)clickedMultipleGestation:(id)sender;

@property (weak, nonatomic) IBOutlet RadioButton *btnMonozygotic;
@property (weak, nonatomic) IBOutlet RadioButton *btnDizyotic;
@property (weak, nonatomic) IBOutlet RadioButton *btnMixed;
@property (weak, nonatomic) IBOutlet RadioButton *btnUnknownGestation;
- (IBAction)clickedMultipleGestationType:(id)sender;

- (IBAction)clickedSwitch:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imgCheck;

- (float)expandedHeight;
- (void)updateCellWithTitle:(NSString *)title;
- (void)cover:(AnimationBlock)block;
- (void)uncover:(AnimationBlock)block;

@end
