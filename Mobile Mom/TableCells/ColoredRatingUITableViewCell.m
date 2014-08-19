//
//  ColoredRatingUITableViewCell.m
//  Discharge
//
//  Created by dev on 6/1/13.
//  Copyright (c) 2013 Catalyze. All rights reserved.
//

#import "ColoredRatingUITableViewCell.h"

@interface ColoredRatingUITableViewCell()

@property (nonatomic, strong) UIColor *level1Color;
@property (nonatomic, strong) UIColor *level2Color;
@property (nonatomic, strong) UIColor *level3Color;
@property (nonatomic, strong) UIColor *level4Color;
@property (nonatomic, strong) UIColor *level5Color;

@end

@implementation ColoredRatingUITableViewCell

- (id)init {
    self = [super init];
    if (self) {
        [self initColors];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initColors];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initColors];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initColors];
    }
    return self;
}

- (void)initColors {
    _level1Color = [UIColor colorWithRed:90.0/255.0 green:199.0/255.0 blue:95.0/255.0 alpha:1.0f];
    _level2Color = [UIColor colorWithRed:150.0/255.0 green:246.0/255.0 blue:66.0/255.0 alpha:1.0f];
    _level3Color = [UIColor colorWithRed:222.0/255.0 green:105.0/255.0 blue:38.0/255.0 alpha:1.0f];
    _level4Color = [UIColor colorWithRed:223.0/255.0 green:53.0/255.0 blue:46.0/255.0 alpha:1.0f];
    _level5Color = [UIColor colorWithRed:177.0/255.0 green:38.0/255.0 blue:33.0/255.0 alpha:1.0f];
}

- (IBAction)chooseLevel1:(id)sender {
    [[_qolSurvey content] setObject:[NSNumber numberWithInt:1] forKey:[_lblDescription.text stringByReplacingOccurrencesOfString:@"." withString:@""]];
    [_btnLevel1 setBackgroundColor:_level1Color];
    [_btnLevel2 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel3 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel4 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel5 setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)chooseLevel2:(id)sender {
    [[_qolSurvey content] setObject:[NSNumber numberWithInt:2] forKey:[_lblDescription.text stringByReplacingOccurrencesOfString:@"." withString:@""]];
    [_btnLevel1 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel2 setBackgroundColor:_level2Color];
    [_btnLevel3 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel4 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel5 setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)chooseLevel3:(id)sender {
    [[_qolSurvey content] setObject:[NSNumber numberWithInt:3] forKey:[_lblDescription.text stringByReplacingOccurrencesOfString:@"." withString:@""]];
    [_btnLevel1 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel2 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel3 setBackgroundColor:_level3Color];
    [_btnLevel4 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel5 setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)chooseLevel4:(id)sender {
    [[_qolSurvey content] setObject:[NSNumber numberWithInt:4] forKey:[_lblDescription.text stringByReplacingOccurrencesOfString:@"." withString:@""]];
    [_btnLevel1 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel2 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel3 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel4 setBackgroundColor:_level4Color];
    [_btnLevel5 setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)chooseLevel5:(id)sender {
    [[_qolSurvey content] setObject:[NSNumber numberWithInt:5] forKey:[_lblDescription.text stringByReplacingOccurrencesOfString:@"." withString:@""]];
    [_btnLevel1 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel2 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel3 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel4 setBackgroundColor:[UIColor clearColor]];
    [_btnLevel5 setBackgroundColor:_level5Color];
}

- (void)setCellDescription:(NSString *)description {
    [_lblDescription setText:description];
    if ([_qolSurvey valueForKey:description] != nil) {
        int level = [[_qolSurvey valueForKey:description] intValue];
        switch (level) {
            case 1:
                [self chooseLevel1:nil];
                break;
            case 2:
                [self chooseLevel2:nil];
                break;
            case 3:
                [self chooseLevel3:nil];
                break;
            case 4:
                [self chooseLevel4:nil];
                break;
            case 5:
                [self chooseLevel5:nil];
                break;
        }
    }
}

@end
