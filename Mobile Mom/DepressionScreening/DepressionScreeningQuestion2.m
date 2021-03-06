//
//  DepressionScreeningQuestion2.m
//  MobileMom
//
//  Created by Josh Ault on 8/27/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DepressionScreeningQuestion2.h"
#import "UIButton+Switch.h"
#import "Constants.h"
#import "RadioGroup.h"
#import <QuartzCore/QuartzCore.h>

@interface DepressionScreeningQuestion2 ()

@property (strong, nonatomic) NSMutableDictionary *dict;
@property (strong, nonatomic) RadioGroup *grp;

@end

@implementation DepressionScreeningQuestion2

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setup {
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
    
    //_dict = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:_key]];
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    }
    for (UILabel *l in _smallLabels) {
        [l setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    }
    
    [_btnAnswerPositive setSelectedImageName:@"normal-selected"];
    [_btnAnswerPositive setImageName:@"normal"];
    
    [_btnAnswerSomewhatPositive setSelectedImageName:@"normal-selected"];
    [_btnAnswerSomewhatPositive setImageName:@"normal"];
    
    [_btnAnswerSomewhatNegative setSelectedImageName:@"normal-selected"];
    [_btnAnswerSomewhatNegative setImageName:@"normal"];
    
    [_btnAnswerNegative setSelectedImageName:@"normal-selected"];
    [_btnAnswerNegative setImageName:@"normal"];
    
    _grp = [[RadioGroup alloc] init];
    [_grp registerButton:_btnAnswerPositive];
    [_grp registerButton:_btnAnswerSomewhatPositive];
    [_grp registerButton:_btnAnswerSomewhatNegative];
    [_grp registerButton:_btnAnswerNegative];
    
    /*[_dict setObject:[NSNumber numberWithBool:_switchAllergic.isOn] forKey:kBOOLTopicalSteroidSideEffectAllergicReaction];
     [_dict setObject:[NSNumber numberWithBool:_switchBloodSugar.isOn] forKey:kBOOLTopicalSteroidSideEffectsLowBloodSugar];
     [_dict setObject:[NSNumber numberWithBool:_switchBreathing.isOn] forKey:kBOOLTopicalSteroidSideEffectsBreathingProblems];
     [_dict setObject:[NSNumber numberWithBool:_switchCoolHands.isOn] forKey:kBOOLTopicalSteroidSideEffectsCoolHands];
     [_dict setObject:[NSNumber numberWithBool:_switchDiarrhea.isOn] forKey:kBOOLTopicalSteroidSideEffectsDiarrhea];
     [_dict setObject:[NSNumber numberWithBool:_switchHeartRate.isOn] forKey:kBOOLTopicalSteroidSideEffectsSlowHeartRate];
     [_dict setObject:[NSNumber numberWithBool:_switchSawDoctor.isOn] forKey:kBOOLTopicalSteroidSawDoctor];
     [_dict setObject:[NSNumber numberWithBool:_switchSleep.isOn] forKey:kBOOLTopicalSteroidSideEffectsChangeInSleepPattern];
     [_dict setObject:[NSNumber numberWithBool:_switchWheezing.isOn] forKey:kBOOLTopicalSteroidSideEffectsWheezing];
     [[NSUserDefaults standardUserDefaults] setObject:_dict forKey:_key];
     [[NSUserDefaults standardUserDefaults] synchronize];*/
}

- (NSString *)validateInput {
    NSString *retval;
    if ([_grp getSelectedButton] == _btnAnswerPositive) {
        retval = _lblAnswerPositive.text;
    } else if ([_grp getSelectedButton] == _btnAnswerSomewhatPositive) {
        retval = _lblAnswerSomewhatPositive.text;
    } else if ([_grp getSelectedButton] == _btnAnswerSomewhatNegative) {
        retval = _lblAnswerSomewhatNegative.text;
    } else if ([_grp getSelectedButton] == _btnAnswerNegative) {
        retval = _lblAnswerNegative.text;
    } else {
        retval = nil;
    }
    return retval;
}

- (NSString *)questionText {
    return _lblQuestion.text;
}

- (IBAction)clickedAnswer:(id)sender {
    [_grp clickedButton:sender];
    
    /*[_dict setObject:[NSNumber numberWithBool:_switchAllergic.isOn] forKey:kBOOLTopicalSteroidSideEffectAllergicReaction];
     [_dict setObject:[NSNumber numberWithBool:_switchBloodSugar.isOn] forKey:kBOOLTopicalSteroidSideEffectsLowBloodSugar];
     [_dict setObject:[NSNumber numberWithBool:_switchBreathing.isOn] forKey:kBOOLTopicalSteroidSideEffectsBreathingProblems];
     [_dict setObject:[NSNumber numberWithBool:_switchCoolHands.isOn] forKey:kBOOLTopicalSteroidSideEffectsCoolHands];
     [_dict setObject:[NSNumber numberWithBool:_switchDiarrhea.isOn] forKey:kBOOLTopicalSteroidSideEffectsDiarrhea];
     [_dict setObject:[NSNumber numberWithBool:_switchHeartRate.isOn] forKey:kBOOLTopicalSteroidSideEffectsSlowHeartRate];
     [_dict setObject:[NSNumber numberWithBool:_switchSawDoctor.isOn] forKey:kBOOLTopicalSteroidSawDoctor];
     [_dict setObject:[NSNumber numberWithBool:_switchSleep.isOn] forKey:kBOOLTopicalSteroidSideEffectsChangeInSleepPattern];
     [_dict setObject:[NSNumber numberWithBool:_switchWheezing.isOn] forKey:kBOOLTopicalSteroidSideEffectsWheezing];
     [[NSUserDefaults standardUserDefaults] setObject:_dict forKey:_key];
     [[NSUserDefaults standardUserDefaults] synchronize];*/
}

@end
