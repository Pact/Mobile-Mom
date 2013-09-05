//
//  NavigationViewController.m
//  PH-Log
//
//  Created by dev on 7/1/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "NavigationViewController.h"
#import "REMenuItem.h"

#import "ProfileViewController.h"
#import "ChildProfileViewController.h"
#import "BirthInfoViewController.h"
#import "QOLSurveyViewController.h"
#import "DepressionScreeningHomeViewController.h"
#import "EducationViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Catalyze.h"

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    
    // Blocks maintain strong references to any captured objects, including self,
    // which means that it’s easy to end up with a strong reference cycle if, for example,
    // an object maintains a copy property for a block that captures self
    // (which is the case for REMenu action blocks).
    //
    // To avoid this problem, it’s best practice to capture a weak reference to self:
    //
    __typeof (&*self) __weak weakSelf = self;
    
    REMenuItem *mom = [[REMenuItem alloc] initWithTitle:@"Mom"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          ProfileViewController *controller = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
                                                          controller.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                          [weakSelf setViewControllers:@[controller] animated:NO];
                                                      }];
    
    REMenuItem *baby = [[REMenuItem alloc] initWithTitle:@"Baby"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             ChildProfileViewController *controller = [[ChildProfileViewController alloc] init];
                                                             controller.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *birthInfo = [[REMenuItem alloc] initWithTitle:@"Birth Info"
                                                           image:nil
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              BirthInfoViewController *controller = [[BirthInfoViewController alloc] init];
                                                              controller.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                              [weakSelf setViewControllers:@[controller] animated:NO];
                                                          }];
    
    REMenuItem *depressionScreening = [[REMenuItem alloc] initWithTitle:@"Depression Screening"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             DepressionScreeningHomeViewController *controller = [[DepressionScreeningHomeViewController alloc] init];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *education = [[REMenuItem alloc] initWithTitle:@"Education"
                                                          image:nil
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             EducationViewController *controller = [[EducationViewController alloc] init];
                                                             [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
    
    REMenuItem *logout = [[REMenuItem alloc] initWithTitle:@"Logout"
                                                        image:nil
                                             highlightedImage:nil
                                                       action:^(REMenuItem *item) {
                                                           [[CatalyzeUser currentUser] logout];
                                                           LoginViewController *controller = [[LoginViewController alloc] init];
                                                           controller.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                                                           [weakSelf setViewControllers:@[controller] animated:NO];
                                                       }];
    
    // You can also assign custom view for items
    // Uncomment the code below and add customViewItem to `initWithItems` array, e.g.
    // [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem, customViewItem]]
    //
    /*
     UIView *customView = [[UIView alloc] init];
     customView.backgroundColor = [UIColor blueColor];
     customView.alpha = 0.4;
     REMenuItem *customViewItem = [[REMenuItem alloc] initWithCustomView:customView action:^(REMenuItem *item) {
     NSLog(@"Tap on customView");
     }];
     */
    
    mom.tag = 0;
    baby.tag = 1;
    birthInfo.tag = 2;
    depressionScreening.tag = 3;
    education.tag = 4;
    logout.tag = 5;
    
    _menu = [[REMenu alloc] initWithItems:@[mom, baby, birthInfo, depressionScreening, education, logout]];
    _menu.cornerRadius = 4;
    _menu.shadowRadius = 4;
    _menu.shadowColor = [UIColor blackColor];
    _menu.shadowOffset = CGSizeMake(0, 1);
    _menu.shadowOpacity = 1;
    _menu.imageOffset = CGSizeMake(5, -1);
    _menu.waitUntilAnimationIsComplete = NO;
    _menu.font = [UIFont fontWithName:@"Raleway" size:20.0f];
}

- (void)toggleMenu {
    if (_menu.isOpen)
        return [_menu close];
    
    [_menu showFromNavigationController:self];
}

@end
