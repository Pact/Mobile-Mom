//
//  ViewController.h
//  PH-Log
//
//  Created by dev on 6/14/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashedBorderUITextField.h"

@protocol LoginViewControllerDelegate <NSObject>

- (void)userDidLogin;
- (void)userDidRegister;

@end

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UIView *viewSignin;
@property (weak, nonatomic) IBOutlet UIView *viewSite;
@property (weak, nonatomic) IBOutlet UIButton *btnSignup;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) id<LoginViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtUsername;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtPassword;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet DashedBorderUITextField *txtLastName;
- (IBAction)signUp:(id)sender;
- (IBAction)login:(id)sender;

@end
