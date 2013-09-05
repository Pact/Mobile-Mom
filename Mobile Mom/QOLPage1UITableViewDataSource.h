//
//  QOLPage1UITableViewDataSource.h
//  PH-Log
//
//  Created by dev on 6/19/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Catalyze.h"

@interface QOLPage1UITableViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *tbl;
@property (strong, nonatomic) CatalyzeObject *qolSurvey;
- (id)initWithTable:(UITableView *)tableView;

@end
