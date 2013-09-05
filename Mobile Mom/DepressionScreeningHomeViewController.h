//
//  AdverseEventsSurveyViewController.h
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepressionScreeningHomeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tblSurveys;

@end
