//
//  EducationViewController.h
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EducationViewController : UIViewController
- (IBAction)showMomHealth:(id)sender;
- (IBAction)showBabyHealth:(id)sender;
- (IBAction)showPostPartemDepression:(id)sender;
- (IBAction)showResources:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnMomHealth;
@property (weak, nonatomic) IBOutlet UIButton *btnBabyHealth;
@property (weak, nonatomic) IBOutlet UIButton *btnPostPartemDepression;
@property (weak, nonatomic) IBOutlet UIButton *btnResources;
@property (weak, nonatomic) IBOutlet UITableView *tbl;
@end
