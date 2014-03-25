//
//  DepressionScreeningViewController.m
//  Mobile Mom
//
//  Created by ault on 8/27/13.
//  Copyright (c) 2013 Catalyze, Inc. All rights reserved.
//

#import "DepressionScreeningViewController.h"
#import "DepressionScreeningQuestion1.h"
#import "DepressionScreeningQuestion2.h"
#import "DepressionScreeningQuestion3.h"
#import "DepressionScreeningQuestion4.h"
#import "DepressionScreeningQuestion5.h"
#import "DepressionScreeningQuestion6.h"
#import "DepressionScreeningQuestion7.h"
#import "DepressionScreeningQuestion8.h"
#import "DepressionScreeningQuestion9.h"
#import "DepressionScreeningQuestion10.h"
#import <QuartzCore/QuartzCore.h>
#import "Catalyze.h"
#import "JALoadingView.h"

@interface DepressionScreeningViewController ()

@property (strong, nonatomic) DepressionScreeningQuestion1 *question1;
@property (strong, nonatomic) DepressionScreeningQuestion2 *question2;
@property (strong, nonatomic) DepressionScreeningQuestion3 *question3;
@property (strong, nonatomic) DepressionScreeningQuestion4 *question4;
@property (strong, nonatomic) DepressionScreeningQuestion5 *question5;
@property (strong, nonatomic) DepressionScreeningQuestion6 *question6;
@property (strong, nonatomic) DepressionScreeningQuestion7 *question7;
@property (strong, nonatomic) DepressionScreeningQuestion8 *question8;
@property (strong, nonatomic) DepressionScreeningQuestion9 *question9;
@property (strong, nonatomic) DepressionScreeningQuestion10 *question10;

@property int currentQuestion;

@property (strong, nonatomic) NSArray *questions;

@property (strong, nonatomic) CatalyzeObject *screening;

@end

@implementation DepressionScreeningViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Depression Screening";
    
    [_btnNext.titleLabel setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    [_btnBack.titleLabel setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    
    _currentQuestion = 1;
    
    _screening = [[CatalyzeObject alloc] initWithClassName:@"depressionScreening"];
    
    // Do any additional setup after loading the view from its nib.
    
    _question1 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion1" owner:nil options:nil] objectAtIndex:0];
    _question2 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion2" owner:nil options:nil] objectAtIndex:0];
    _question3 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion3" owner:nil options:nil] objectAtIndex:0];
    _question4 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion4" owner:nil options:nil] objectAtIndex:0];
    _question5 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion5" owner:nil options:nil] objectAtIndex:0];
    _question6 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion6" owner:nil options:nil] objectAtIndex:0];
    _question7 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion7" owner:nil options:nil] objectAtIndex:0];
    _question8 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion8" owner:nil options:nil] objectAtIndex:0];
    _question9 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion9" owner:nil options:nil] objectAtIndex:0];
    _question10 = [[[NSBundle mainBundle] loadNibNamed:@"DepressionScreeningQuestion10" owner:nil options:nil] objectAtIndex:0];
    
    _questions = [NSArray arrayWithObjects:_question1, _question2, _question3, _question4, _question5, _question6, _question7, _question8, _question9, _question10, nil];
    
    _question1.center = _containerView.center;
    _question2.center = _containerView.center;
    _question3.center = _containerView.center;
    _question4.center = _containerView.center;
    _question5.center = _containerView.center;
    _question6.center = _containerView.center;
    _question7.center = _containerView.center;
    _question8.center = _containerView.center;
    _question9.center = _containerView.center;
    _question10.center = _containerView.center;
    
    _question1.layer.shadowColor = [UIColor blackColor].CGColor;
    _question1.layer.shadowOffset = CGSizeMake(5, 5);
    _question1.layer.shadowRadius = 10;
    
    [_containerView addSubview:_question1];
    [_question1 setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)finishedQuestionNumber:(int)questionNumber {
    switch (questionNumber) {
        case 1: {
            [UIView transitionFromView:_question1 toView:_question2 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question2 setup];
                [_progressIndicator setProgress:0.2 animated:YES];
            }];
            break;
        }
        case 2: {
            [UIView transitionFromView:_question2 toView:_question3 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question3 setup];
                [_progressIndicator setProgress:0.3 animated:YES];
            }];
            break;
        }
        case 3: {
            [UIView transitionFromView:_question3 toView:_question4 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question4 setup];
                [_progressIndicator setProgress:0.4 animated:YES];
            }];
            break;
        }
        case 4: {
            [UIView transitionFromView:_question4 toView:_question5 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question5 setup];
                [_progressIndicator setProgress:0.5 animated:YES];
            }];
            break;
        }
        case 5: {
            [UIView transitionFromView:_question5 toView:_question6 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question6 setup];
                [_progressIndicator setProgress:0.6 animated:YES];
            }];
            break;
        }
        case 6: {
            [UIView transitionFromView:_question6 toView:_question7 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question7 setup];
                [_progressIndicator setProgress:0.7 animated:YES];
            }];
            break;
        }
        case 7: {
            [UIView transitionFromView:_question7 toView:_question8 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question8 setup];
                [_progressIndicator setProgress:0.8 animated:YES];
            }];
            break;
        }
        case 8: {
            [UIView transitionFromView:_question8 toView:_question9 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question9 setup];
                [_progressIndicator setProgress:0.9 animated:YES];
            }];
            break;
        }
        case 9: {
            [UIView transitionFromView:_question9 toView:_question10 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
                [_question10 setup];
                [_btnNext setTitle:@"DONE" forState:UIControlStateNormal];
                [_progressIndicator setProgress:1.0 animated:YES];
            }];
            break;
        }
        case 10: {
            NSLog(@"finished screening");
            JALoadingView *loading = [[JALoadingView alloc] initJALoadingViewWithView:self.view];
            [loading showJALoadingView];
            [_screening setObject:[NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]] forKey:@"title"];
            [_screening createInBackgroundWithBlock:^(BOOL succeeded, int status, NSError *error) {
                [loading dismissJALoadingView];
                if (succeeded) {
                    [self.navigationController popViewControllerAnimated:YES];
                } else {
                    _currentQuestion--;
                    [[[UIAlertView alloc] initWithTitle:@"Depression Screening" message:@"Your screening could not be saved at this time, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                }
            }];
            break;
        }
    }
}

- (void)showPreviousQuestionFromQuestionNumber:(int)questionNumber {
    switch (questionNumber) {
        case 2: {
            [UIView transitionFromView:_question2 toView:_question1 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question1 setup];
                [_progressIndicator setProgress:0.1 animated:YES];
            }];
            break;
        }
        case 3: {
            [UIView transitionFromView:_question3 toView:_question2 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question2 setup];
                [_progressIndicator setProgress:0.2 animated:YES];
            }];
            break;
        }
        case 4: {
            [UIView transitionFromView:_question4 toView:_question3 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question3 setup];
                [_progressIndicator setProgress:0.3 animated:YES];
            }];
            break;
        }
        case 5: {
            [UIView transitionFromView:_question5 toView:_question4 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question4 setup];
                [_progressIndicator setProgress:0.4 animated:YES];
            }];
            break;
        }
        case 6: {
            [UIView transitionFromView:_question6 toView:_question5 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question5 setup];
                [_progressIndicator setProgress:0.5 animated:YES];
            }];
            break;
        }
        case 7: {
            [UIView transitionFromView:_question7 toView:_question6 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question6 setup];
                [_progressIndicator setProgress:0.6 animated:YES];
            }];
            break;
        }
        case 8: {
            [UIView transitionFromView:_question8 toView:_question7 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question7 setup];
                [_progressIndicator setProgress:0.7 animated:YES];
            }];
            break;
        }
        case 9: {
            [UIView transitionFromView:_question9 toView:_question8 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question8 setup];
                [_progressIndicator setProgress:0.8 animated:YES];
            }];
            break;
        }
        case 10: {
            [UIView transitionFromView:_question10 toView:_question9 duration:0.4 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
                [_question9 setup];
                [_btnNext setTitle:@"NEXT" forState:UIControlStateNormal];
                [_progressIndicator setProgress:0.9 animated:YES];
            }];
            break;
        }
    }
}

- (IBAction)next:(id)sender {
    NSString *value = [[_questions objectAtIndex:(_currentQuestion-1)] validateInput];
    if (value) {
        [_screening setObject:value forKey:[[_questions objectAtIndex:(_currentQuestion-1)] questionText]];
        [self finishedQuestionNumber:_currentQuestion];
        _currentQuestion++;
    }
}

- (IBAction)back:(id)sender {
    [self showPreviousQuestionFromQuestionNumber:_currentQuestion];
    _currentQuestion--;
}

@end
