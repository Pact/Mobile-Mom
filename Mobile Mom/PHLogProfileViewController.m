//
//  PHLogProfileViewController.m
//  PH-Log
//
//  Created by dev on 7/1/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PHLogProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "UIView+FindFirstResponder.h"
#import "Catalyze.h"

@interface PHLogProfileViewController ()
@property BOOL keyboardShowing;
@end

@implementation PHLogProfileViewController

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
    // Do any additional setup after loading the view from its nib.
    _keyboardShowing = NO;
    
    self.navigationItem.hidesBackButton = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTblMain:nil];
    [super viewDidUnload];
}

- (void)keyboardWillBeShown:(NSNotification*)aNotification {
    if (!_keyboardShowing) {
        _keyboardShowing = YES;
        CGSize keyboardSize = [[[aNotification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
        [UIView animateWithDuration:0.2 animations:^{
            CGRect mainFrame = _tblMain.frame;
            mainFrame.origin.y = 0;
            mainFrame.size.height = self.view.frame.size.height - keyboardSize.height;
            [_tblMain setFrame:mainFrame];
        }];
    }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    if ([self.view findFirstResponder] == nil) {
        _keyboardShowing = NO;
        [UIView animateWithDuration:0.2 animations:^{
            CGRect mainFrame = _tblMain.frame;
            mainFrame.origin.y = 20;
            mainFrame.size.height = self.view.frame.size.height - mainFrame.origin.y;
            [_tblMain setFrame:mainFrame];
        }];
    }
}

@end
