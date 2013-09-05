//
//  AppDelegate.h
//  PH-Log
//
//  Created by dev on 6/14/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "DepressionScreeningHomeViewController.h"
#import "ProfileViewController.h"
#import "ChildProfileViewController.h"
#import "QOLSurveyViewController.h"
#import "REMenu.h"
#import "PHLogProfileViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, LoginViewControllerDelegate, PHLogProfileViewControllerDelegate, QOLSurveyViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly, nonatomic) REMenu *menu;

@end
