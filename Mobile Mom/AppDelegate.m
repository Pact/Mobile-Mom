//
//  AppDelegate.m
//  PH-Log
//
//  Created by dev on 6/14/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "NavigationViewController.h"
#import "Catalyze.h"

@interface AppDelegate()

@property (strong, nonatomic) NavigationViewController *controller;
@property (strong, nonatomic) LoginViewController *login;
@property (strong, nonatomic) DepressionScreeningHomeViewController *screening;
@property (strong, nonatomic) ProfileViewController *profile;
@property (strong, nonatomic) ChildProfileViewController *childProfile;
@property (strong, nonatomic) QOLSurveyViewController *qol;

@end

@implementation AppDelegate
@synthesize controller = _controller;
@synthesize login = _login;
@synthesize screening = _screening;
@synthesize profile = _profile;
@synthesize childProfile = _childProfile;
@synthesize qol = _qol;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    _login = nil;
    _login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    _login.delegate = self;
    
    [Catalyze setApplicationKey:@"52572dc9993223edd2937923" URLScheme:@"mobilemom" applicationId:@"52c59275-4c46-400c-a04e-2976b8dea989"];
    
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) {
        //the app was launched from chrome because of a login, check the credentials
        //then show profile screen first, or if fails, show alert login failed and show
        //login VC
        [[[UIAlertView alloc] initWithTitle:@"Login" message:@"Login failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        _controller = [[NavigationViewController alloc] initWithRootViewController:_login];
    } else {
        _controller = [[NavigationViewController alloc] initWithRootViewController:_login];
    }
    [_controller.navigationBar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:_controller action:@selector(toggleMenu)]];
    _controller.navigationBarHidden = NO;
    _controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    self.window.rootViewController = _controller;
    [self.window makeKeyAndVisible];
    
    CGSize size = CGSizeMake(self.window.frame.size.width, 44);
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    
    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor);
    
    //Fill the color
    CGContextFillRect(currentContext, fillRect);
    
    //Snap the picture and close the context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          [UIFont fontWithName:@"Raleway" size:20.0f], UITextAttributeFont,
                                                          [UIColor clearColor], UITextAttributeTextShadowColor,
                                                          nil]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [Catalyze handleOpenURL:url withBlock:^(BOOL authenticated, BOOL newUser) {
        if (authenticated) {
            if (newUser) {
                [self userDidRegister];
            } else {
                [self userDidLogin];
            }
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Authentication Failed" message:@"You did not log in successfully, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
    }];
    return YES;
}

#pragma mark - LoginViewControllerDelegate

- (void)userDidLogin {
    [_controller popViewControllerAnimated:NO];
    [self showDepressionScreeningHomeViewController];
}

- (void)userDidRegister {
    [_controller popViewControllerAnimated:NO];
    [self showDepressionScreeningHomeViewController];
}

- (void)showLoginViewController {
    _login = nil;
    _login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    _login.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_login animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

#pragma mark - DepressionScreeningHomeViewControllerDelegate

- (void)showDepressionScreeningHomeViewController {
    _screening = [[DepressionScreeningHomeViewController alloc] initWithNibName:nil bundle:nil];
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_screening animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

#pragma mark - ProfileViewControllerDelegate
#pragma mark - ChildProfileViewControllerDelegate

- (void)shouldShowProfileViewController {
    [_controller popViewControllerAnimated:NO];
    [self showProfileViewController];
}

- (void)shouldShowChildProfileViewController {
    [_controller popViewControllerAnimated:NO];
    [self showChildProfileViewController];
}

- (void)shouldShowQOLSurveyViewController {
    [_controller popViewControllerAnimated:NO];
    [self showQOLSurveyViewController];
}

- (void)showProfileViewController {
    if (!_profile) {
        _profile = [[ProfileViewController alloc] initWithNibName:nil bundle:nil];
    }
    _profile.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_profile animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showChildProfileViewController {
    if (!_childProfile) {
        _childProfile = [[ChildProfileViewController alloc] initWithNibName:nil bundle:nil];
    }
    _childProfile.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_childProfile animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

- (void)showQOLSurveyViewController {
    if (!_qol) {
        _qol = [[QOLSurveyViewController alloc] initWithNibName:nil bundle:nil];
    }
    _qol.delegate = self;
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [_controller pushViewController:_qol animated:NO];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_controller.view cache:NO];
    }];
}

@end
