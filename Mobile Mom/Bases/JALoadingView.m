//
//  JALoadingView.m
//
//  Created by Josh Ault on 4/29/13.
//  Copyright (c) 2013 Josh Ault All rights reserved.
//

#import "JALoadingView.h"
#import <QuartzCore/QuartzCore.h>

@interface JALoadingView()

@property (nonatomic, strong) UIView *jaLoadingView;
@property (nonatomic, strong) UILabel *jaLoadingLabel;
@property (nonatomic, strong) UIActivityIndicatorView *filterProgress;

@end

@implementation JALoadingView
@synthesize jaLoadingView = _jaLoadingView;
@synthesize jaLoadingLabel = _jaLoadingLabel;

- (id)initJALoadingViewWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _jaLoadingView = [[UIView alloc] initWithFrame:CGRectMake(view.center.x - 100, view.center.y - 50, 200, 100)];
        [_jaLoadingView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8f]];
        _jaLoadingView.layer.cornerRadius = 10;
        
        _filterProgress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [_filterProgress startAnimating];
        CGRect r2 = _filterProgress.frame;
        
        _jaLoadingLabel = [[UILabel alloc] init];
        [_jaLoadingLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:24.0f]];
        [_jaLoadingLabel setTextColor:[UIColor whiteColor]];
        [_jaLoadingLabel setText:@"Loading..."];
        [_jaLoadingLabel setTextAlignment:UITextAlignmentCenter];
        [_jaLoadingLabel setBackgroundColor:[UIColor clearColor]];
        [_jaLoadingLabel sizeToFit];
        CGRect r = _jaLoadingLabel.frame;
        r.origin.y = (_jaLoadingView.frame.size.height/2)-(r.size.height/2);
        r.origin.x = (_jaLoadingView.frame.size.width/2)-(r.size.width/2)+(r2.size.width/2)+10;
        [_jaLoadingLabel setFrame:r];
        
        [_jaLoadingView addSubview:_jaLoadingLabel];
        
        r2.origin.x = _jaLoadingLabel.frame.origin.x-r2.size.width-10;
        r2.origin.y = (_jaLoadingView.frame.size.height/2)-(r2.size.height/2);
        [_filterProgress setFrame:r2];
        
        [_jaLoadingView addSubview:_filterProgress];
        [_jaLoadingView setAlpha:0.0f];
        [_jaLoadingView setUserInteractionEnabled:NO];
        [view addSubview:_jaLoadingView];
    }
    return self;
}

- (void)updateLayout {
    CGRect r2 = _filterProgress.frame;
    
    CGRect r = _jaLoadingLabel.frame;
    r.origin.y = (_jaLoadingView.frame.size.height/2)-(r.size.height/2);
    r.origin.x = (_jaLoadingView.frame.size.width/2)-(r.size.width/2)+(r2.size.width/2)+10;
    [_jaLoadingLabel setFrame:r];
    
    r2.origin.x = _jaLoadingLabel.frame.origin.x-r2.size.width-10;
    r2.origin.y = (_jaLoadingView.frame.size.height/2)-(r2.size.height/2);
    [_filterProgress setFrame:r2];
}

- (void)showJALoadingView {
    [[_jaLoadingView superview] setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [_jaLoadingView setAlpha:1.0f];
    }];
}

- (void)setTitle:(NSString *)title {
    [_jaLoadingLabel setText:title];
    [_jaLoadingLabel sizeToFit];
    [self updateLayout];
}

- (void)dismissJALoadingView {
    [[_jaLoadingView superview] setUserInteractionEnabled:YES];
    [UIView animateWithDuration:0.3 animations:^{
        [_jaLoadingView setAlpha:0.0f];
    }];
}

@end
