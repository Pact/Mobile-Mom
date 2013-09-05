//
//  PHLogProfileViewController.h
//  PH-Log
//
//  Created by dev on 7/1/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PHLogProfileViewControllerDelegate <NSObject>

- (void)shouldShowProfileViewController;
- (void)shouldShowChildProfileViewController;
- (void)shouldShowQOLSurveyViewController;

@end

@interface PHLogProfileViewController : UIViewController

@property (strong, nonatomic) id<PHLogProfileViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tblMain;

@end
