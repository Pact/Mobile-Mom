//
//  TextUITableViewCell.m
//  PH-Log
//
//  Created by dev on 7/10/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "TextUITableViewCell.h"
#import "RelativityLaws.h"

@implementation TextUITableViewCell

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

- (void)setCellText:(NSString *)text {
    [_lbl setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_lbl setText:text];
    [RelativityLaws labelFitHeight:_lbl];
    CGRect frame = self.frame;
    frame.size.height = _lbl.frame.size.height + 22;
    [self setFrame:frame];
}

- (float)fullHeight {
    return self.frame.size.height;
}

@end
