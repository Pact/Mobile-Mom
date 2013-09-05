//
//  DateUITableViewCell.m
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DateUITableViewCell.h"

@implementation DateUITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDate:(NSString *)date {
    [_lblDate setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    [_lblDate setText:date];
}

- (void)setCellBackgroundColor:(UIColor *)color {
    [_viewBackground setBackgroundColor:color];
}

@end
