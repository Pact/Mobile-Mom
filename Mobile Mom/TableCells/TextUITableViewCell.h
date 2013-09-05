//
//  TextUITableViewCell.h
//  PH-Log
//
//  Created by dev on 7/10/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl;
- (void)setCellText:(NSString *)text;
- (float)fullHeight;
@end
