//
//  ViewController.m
//  PH-Log
//
//  Created by dev on 6/14/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "LoginViewController.h"
#import "UITextField+Icon.h"
#import <QuartzCore/QuartzCore.h>
#import "Catalyze.h"
#import "JALoadingView.h"

@interface LoginViewController ()

@property BOOL stepTwo;
@property (strong, nonatomic) JALoadingView *lv;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _btnLogin.layer.cornerRadius = 10;
    [_btnLogin.titleLabel setFont:[UIFont fontWithName:@"Raleway-Light" size:15.0f]];
    _btnSignup.layer.cornerRadius = 10;
    [_btnSignup.titleLabel setFont:[UIFont fontWithName:@"Raleway-Light" size:15.0f]];
    
    for (UILabel *l in _labels) {
        [l setFont:[UIFont fontWithName:@"Raleway-Light" size:17.0f]];
    }
    
    [_txtUsername setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtPassword setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtFirstName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_txtLastName setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
    _lv = [[JALoadingView alloc] initJALoadingViewWithView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.userInteractionEnabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBtnSignup:nil];
    [self setBtnLogin:nil];
    [self setLblDescription:nil];
    [self setLabels:nil];
    [super viewDidUnload];
}

- (BOOL)validateEmail {
    BOOL retval = YES;
    NSString *emailRegEx = @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if (![regExPredicate evaluateWithObject:_txtUsername.text]) {
        retval = NO;
    }
    return retval;
}

- (BOOL)validateInput:(BOOL)signup {
    BOOL ok = YES;
    NSString *msg = @"ok";
    if (signup && _txtLastName.text.length == 0) {
        ok = NO;
        msg = @"Last name is a required field";
    }
    if (signup && _txtFirstName.text.length == 0) {
        ok = NO;
        msg = @"First name is a required field";
    }
    if (_txtPassword.text.length == 0) {
        ok = NO;
        msg = @"Password is a required field";
    }
    if (_txtUsername.text.length == 0) {
        ok = NO;
        msg = @"Username is a required field";
    }
    if (![self validateEmail]) {
        ok = NO;
        msg = @"You must enter a valid email address";
    }
    if (!ok) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
    return ok;
}

- (IBAction)signUp:(id)sender {
    if (_stepTwo) {
        if ([self validateInput:YES]) {
            [_lv showJALoadingView];
            [CatalyzeUser signUpWithUsernameInBackground:_txtUsername.text password:_txtPassword.text firstName:_txtFirstName.text lastName:_txtLastName.text block:^(int status, NSDictionary *response, NSError *error) {
                [_lv dismissJALoadingView];
                if (!error) {
                    [_delegate userDidRegister];
                } else if (status == 400) {
                    [[[UIAlertView alloc] initWithTitle:@"Registration Error" message:@"This username is already registered" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                } else {
                    [[[UIAlertView alloc] initWithTitle:@"Registration Error" message:@"Something went wrong, try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                }
            }];
        }
    } else {
        _stepTwo = YES;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect signFrame = _btnSignup.frame;
            signFrame.origin.y = _viewSite.frame.origin.y + _viewSite.frame.size.height + 21;
            [_btnSignup setFrame:signFrame];
            
            CGRect loginFrame = _btnLogin.frame;
            loginFrame.origin.y = _viewSite.frame.origin.y + _viewSite.frame.size.height + 21;
            [_btnLogin setFrame:loginFrame];
            
            _txtFirstName.alpha = 1.0;
            [_txtFirstName setUserInteractionEnabled:YES];
            _txtLastName.alpha = 1.0;
            [_txtLastName setUserInteractionEnabled:YES];
        }];
    }
}

- (IBAction)login:(id)sender {
    if ([self validateInput:NO]) {
        [_lv showJALoadingView];
        [CatalyzeUser logInWithUsernameInBackground:_txtUsername.text password:_txtPassword.text block:^(int status, NSDictionary *response, NSError *error) {
            [_lv dismissJALoadingView];
            if (!error) {
                NSLog(@"successful login");
                [_delegate userDidLogin];
            } else {
                [[[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Wrong username / password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
            }
        }];
    }
}

- (void)keyboardWillBeShown:(NSNotification*)aNotification {
    if ([_txtFirstName isFirstResponder] || [_txtLastName isFirstResponder]) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect frame = _viewSignin.frame;
            frame.origin.y = _txtUsername.frame.origin.y;
            [_viewSignin setFrame:frame];
            
            [_txtUsername setUserInteractionEnabled:NO];
            _txtUsername.alpha = 0.0;
            
            [_txtPassword setUserInteractionEnabled:NO];
            _txtPassword.alpha = 0.0;
        }];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    if (![_txtFirstName isFirstResponder] && ![_txtLastName isFirstResponder] && ![_txtUsername isFirstResponder] && ![_txtPassword isFirstResponder] && _txtFirstName.alpha == 1.0) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect frame = _viewSignin.frame;
            frame.origin.y = _txtPassword.frame.size.height + _txtPassword.frame.origin.y + 20;
            [_viewSignin setFrame:frame];
            
            [_txtUsername setUserInteractionEnabled:YES];
            _txtUsername.alpha = 1.0;
            
            [_txtPassword setUserInteractionEnabled:YES];
            _txtPassword.alpha = 1.0;
        }];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == _txtUsername) {
        [_txtPassword becomeFirstResponder];
    } else if (textField == _txtPassword && _txtFirstName.alpha == 1.0) {
        [_txtFirstName becomeFirstResponder];
    } else if (textField == _txtFirstName) {
        [_txtLastName becomeFirstResponder];
    }
    return YES;
}

@end
