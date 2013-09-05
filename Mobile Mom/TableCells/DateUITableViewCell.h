//
//  DateUITableViewCell.h
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
- (void)setDate:(NSString *)date;
- (void)setCellBackgroundColor:(UIColor *)color;
@end
