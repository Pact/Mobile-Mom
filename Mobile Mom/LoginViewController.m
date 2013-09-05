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
#import "AFNetworking.h"

@interface LoginViewController ()

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

- (IBAction)signUp:(id)sender {
    [CatalyzeUser logIn];
}

- (IBAction)login:(id)sender {
    [CatalyzeUser logIn];
}

@end
