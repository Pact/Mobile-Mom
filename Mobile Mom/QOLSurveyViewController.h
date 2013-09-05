//
//  QOLSurveyViewController.h
//  PH-Log
//
//  Created by dev on 6/19/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QOLSurveyViewControllerDelegate <NSObject>

- (void)shouldShowProfileViewController;
- (void)shouldShowChildProfileViewController;

@end

@interface QOLSurveyViewController : UIViewController
@property (strong, nonatomic) id<QOLSurveyViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *btnSurvey;
@property (weak, nonatomic) IBOutlet UITableView *tblPage1;
@property (weak, nonatomic) IBOutlet UITableView *tblPage2;
@property (weak, nonatomic) IBOutlet UITableView *tblPage3;
@property (weak, nonatomic) IBOutlet UITableView *tblPage4;
@property (weak, nonatomic) IBOutlet UITableView *tblPage5;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnPrev;
@property (weak, nonatomic) IBOutlet UIView *headerView;
- (IBAction)takeQOLSurvey:(id)sender;
- (IBAction)nextTable:(id)sender;
- (IBAction)prevTable:(id)sender;

@end
