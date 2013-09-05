//
//  DepressionScreeningQuestion10.h
//  Mobile Mom
//
//  Created by Josh Ault on 8/27/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"

@interface DepressionScreeningQuestion10 : UIView

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet RadioButton *btnAnswerPositive;
@property (weak, nonatomic) IBOutlet RadioButton *btnAnswerSomewhatPositive;
@property (weak, nonatomic) IBOutlet RadioButton *btnAnswerSomewhatNegative;
@property (weak, nonatomic) IBOutlet RadioButton *btnAnswerNegative;
@property (weak, nonatomic) IBOutlet UILabel *lblAnswerPositive;
@property (weak, nonatomic) IBOutlet UILabel *lblAnswerSomewhatPositive;
@property (weak, nonatomic) IBOutlet UILabel *lblAnswerSomewhatNegative;
@property (weak, nonatomic) IBOutlet UILabel *lblAnswerNegative;

- (IBAction)clickedAnswer:(id)sender;
- (void)setup;
- (NSString *)validateInput;

@end
