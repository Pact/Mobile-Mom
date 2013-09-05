//
//  JALoadingView.h
//
//  Created by Josh Ault on 4/29/13.
//  Copyright (c) 2013 Josh Ault All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JALoadingView : UIView

- (id)initJALoadingViewWithView:(UIView *)view;
- (void)showJALoadingView;
- (void)setTitle:(NSString *)title;
- (void)dismissJALoadingView;

@end
