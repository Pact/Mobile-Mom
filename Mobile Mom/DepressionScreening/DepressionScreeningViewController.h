//
//  DepressionScreeningViewController.h
//  Mobile Mom
//
//  Created by ault on 8/27/13.
//  Copyright (c) 2013 Catalyze, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepressionScreeningViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressIndicator;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)next:(id)sender;
- (IBAction)back:(id)sender;

@end
