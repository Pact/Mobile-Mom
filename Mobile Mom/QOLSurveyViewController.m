//
//  QOLSurveyViewController.m
//  PH-Log
//
//  Created by dev on 6/19/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "QOLSurveyViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "QOLPage1UITableViewDataSource.h"
#import "Constants.h"
#import "Catalyze.h"

@interface QOLSurveyViewController ()

@property (strong, nonatomic) QOLPage1UITableViewDataSource *qolPage1DataSource;
@property (strong, nonatomic) UILabel *cancel;
@property (strong, nonatomic) UILabel *submit;

@property int currentTable;

@property (strong, nonatomic) CatalyzeObject *qolSurvey;

@end

@implementation QOLSurveyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    if ([[[CatalyzeUser currentUser] name] firstName] != nil && [[[CatalyzeUser currentUser] name] lastName] != nil) {
        self.navigationItem.title = [NSString stringWithFormat:@"%@ %@",[[[CatalyzeUser currentUser] name] firstName],[[[CatalyzeUser currentUser] name] lastName]];
    }
    
    _cancel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    [_cancel setTextAlignment:NSTextAlignmentCenter];
    [_cancel setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_cancel setText:@"Cancel"];
    [_cancel setTextColor:[UIColor blackColor]];
    [_cancel setBackgroundColor:[UIColor clearColor]];
    [_cancel setUserInteractionEnabled:YES];
    [_cancel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prevTable:)]];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithCustomView:_cancel];
    self.navigationItem.leftBarButtonItem = cancelBtn;
    
    _submit = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    [_submit setTextAlignment:NSTextAlignmentCenter];
    [_submit setFont:[UIFont fontWithName:@"Raleway" size:14.0f]];
    [_submit setText:@"Submit"];
    [_submit setTextColor:[UIColor blackColor]];
    [_submit setBackgroundColor:[UIColor clearColor]];
    [_submit setUserInteractionEnabled:YES];
    [_submit addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextTable:)]];
    UIBarButtonItem *submitBtn = [[UIBarButtonItem alloc] initWithCustomView:_submit];
    self.navigationItem.rightBarButtonItem = submitBtn;
    
    _currentTable = 1;
    
    _qolSurvey = [CatalyzeObject objectWithClassName:@"qolSurvey"];
    
    [_tblPage1 registerNib:[UINib nibWithNibName:@"ColoredRatingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ColoredRatingCellIdentifier"];
    [_tblPage2 registerNib:[UINib nibWithNibName:@"ColoredRatingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ColoredRatingCellIdentifier"];
    [_tblPage3 registerNib:[UINib nibWithNibName:@"ColoredRatingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ColoredRatingCellIdentifier"];
    [_tblPage4 registerNib:[UINib nibWithNibName:@"ColoredRatingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ColoredRatingCellIdentifier"];
    [_tblPage5 registerNib:[UINib nibWithNibName:@"ColoredRatingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ColoredRatingCellIdentifier"];
    
    _qolPage1DataSource = [[QOLPage1UITableViewDataSource alloc] initWithTable:_tblPage1];
    [_qolPage1DataSource setQolSurvey:_qolSurvey];
    
    [_tblPage1 setDataSource:_qolPage1DataSource];
    [_tblPage1 setDelegate:_qolPage1DataSource];
    
    [_btnSurvey.titleLabel setFont:[UIFont fontWithName:@"Raleway" size:16.0f]];
    
    [self takeQOLSurvey:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBtnSurvey:nil];
    [self setTblPage1:nil];
    [self setTblPage2:nil];
    [self setTblPage3:nil];
    [self setTblPage4:nil];
    [self setTblPage5:nil];
    [self setBtnNext:nil];
    [self setHeaderView:nil];
    [self setBtnPrev:nil];
    [super viewDidUnload];
}

- (IBAction)takeQOLSurvey:(id)sender {
    _qolSurvey = [CatalyzeObject objectWithClassName:@"qolSurvey"];
    
    [_qolPage1DataSource setQolSurvey:_qolSurvey];
    
    [_cancel setUserInteractionEnabled:YES];
    [_cancel setHidden:NO];
    [_submit setUserInteractionEnabled:YES];
    [_submit setHidden:NO];
    self.navigationItem.title = @"Quality of Life";
    [_btnNext setUserInteractionEnabled:YES];
    [_btnNext setHidden:NO];
    [_btnPrev setUserInteractionEnabled:YES];
    [_btnPrev setHidden:NO];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.backgroundColor = [UIColor colorWithRed:47.0/255.0 green:132.0/255.0 blue:210.0/255.0 alpha:1.0f];
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                              [UIColor whiteColor], UITextAttributeTextColor,
                                                              [UIFont fontWithName:@"Raleway" size:20.0f], UITextAttributeFont,
                                                              [UIColor clearColor], UITextAttributeTextShadowColor,
                                                              nil]];
        
        /////////////////////// color the nav bar //////////////////////////
        CGSize size = CGSizeMake(self.view.frame.size.width, 44);
        UIGraphicsBeginImageContext(size);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        
        //Build a rect of appropriate size at origin 0,0
        CGRect fillRect = CGRectMake(0,0,size.width,size.height);
        
        //Set the fill color
        CGContextSetFillColorWithColor(currentContext, [UIColor colorWithRed:47.0f/255.0f green:132.0f/255.0f blue:210.0f/255.0f alpha:1.0f].CGColor);
        
        //Fill the color
        CGContextFillRect(currentContext, fillRect);
        
        //Snap the picture and close the context
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        ////////////////////////// end //////////////////////////////////////
        
        [_btnSurvey setUserInteractionEnabled:NO];
        [_btnSurvey setHidden:YES];
        _currentTable = 1;
        [self showHeader];
        [self bringInTable:_tblPage1];
    }];
}

- (void)exitSurveyMode {
    [_cancel setUserInteractionEnabled:NO];
    [_cancel setHidden:YES];
    [_submit setUserInteractionEnabled:NO];
    [_submit setHidden:YES];
    [_btnSurvey setUserInteractionEnabled:YES];
    [_btnSurvey setHidden:NO];
    [_btnNext setUserInteractionEnabled:NO];
    [_btnNext setHidden:YES];
    [_btnPrev setUserInteractionEnabled:NO];
    [_btnPrev setHidden:YES];
    
    if ([[[CatalyzeUser currentUser] name] firstName] != nil && [[[CatalyzeUser currentUser] name] lastName] != nil) {
        self.navigationItem.title = [NSString stringWithFormat:@"%@ %@",[[[CatalyzeUser currentUser] name] firstName],[[[CatalyzeUser currentUser] name] lastName]];
    }

    self.view.backgroundColor = [UIColor whiteColor];

    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          [UIFont fontWithName:@"Raleway" size:20.0f], UITextAttributeFont,
                                                          [UIColor clearColor], UITextAttributeTextShadowColor,
                                                          nil]];
    
    /////////////////////// color the nav bar //////////////////////////
    CGSize size = CGSizeMake(self.view.frame.size.width, 44);
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    
    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor);
    
    //Fill the color
    CGContextFillRect(currentContext, fillRect);
    
    //Snap the picture and close the context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    ////////////////////////////// end /////////////////////////////////
}

- (void)showHeader {
    CGRect frame = _headerView.frame;
    frame.origin.x = 0;
    [_headerView setFrame:frame];
}

- (void)hideHeader:(int)multiplier {
    CGRect frame = _headerView.frame;
    frame.origin.x = multiplier*_headerView.frame.size.width;
    [_headerView setFrame:frame];
}

- (void)resetTables {
    CGRect frame = CGRectMake(_tblPage1.frame.size.width, _tblPage1.frame.origin.y, _tblPage1.frame.size.width, _tblPage1.frame.size.height);
    [_tblPage1 setFrame:frame];
    [_tblPage2 setFrame:frame];
    [_tblPage3 setFrame:frame];
    [_tblPage4 setFrame:frame];
    [_tblPage5 setFrame:frame];
    CGRect hframe = _headerView.frame;
    hframe.origin.x = _headerView.frame.size.width;
    [_headerView setFrame:hframe];
}

/*- (IBAction)nextTable:(id)sender {
    _currentTable++;
    UITableView *inTbl = nil;
    UITableView *outTbl = nil;
    switch (_currentTable) {
        case 2:
            inTbl = _tblPage2;
            outTbl = _tblPage1;
            break;
        case 3:
            inTbl = _tblPage3;
            outTbl = _tblPage2;
            break;
        case 4:
            inTbl = _tblPage4;
            outTbl = _tblPage3;
            break;
        case 5:
            inTbl = _tblPage5;
            outTbl = _tblPage4;
            break;
        case 6:
            _currentTable = 0;
            
            inTbl = nil;
            outTbl = _tblPage5;
            break;
    }
    [UIView animateWithDuration:0.3 animations:^{
        if (_currentTable == 0) {
            [self hideHeader];
            self.view.backgroundColor = [UIColor whiteColor];
            [_lblProfileTitle setTextColor:[UIColor blackColor]];
        }
        [self bringInTable:inTbl];
        [self pushOutTable:outTbl multiplier:-1];
    } completion:^(BOOL finished) {
        if (_currentTable == 0) {
            [self resetTables];
        }
    }];
}

- (IBAction)prevTable:(id)sender {
    _currentTable--;
    UITableView *inTbl = nil;
    UITableView *outTbl = nil;
    switch (_currentTable) {
        case 0:
            
            inTbl = nil;
            outTbl = _tblPage1;
            break;
        case 1:
            inTbl = _tblPage1;
            outTbl = _tblPage2;
            break;
        case 2:
            inTbl = _tblPage2;
            outTbl = _tblPage3;
            break;
        case 3:
            inTbl = _tblPage3;
            outTbl = _tblPage4;
            break;
        case 4:
            inTbl = _tblPage4;
            outTbl = _tblPage5;
            break;
    }
    [UIView animateWithDuration:0.3 animations:^{
        if (_currentTable == 0) {
            [self hideHeader];
            self.view.backgroundColor = [UIColor whiteColor];
            [_lblProfileTitle setTextColor:[UIColor blackColor]];
        }
        [self bringInTable:inTbl];
        [self pushOutTable:outTbl multiplier:1];
    } completion:^(BOOL finished) {
        if (_currentTable == 0) {
            [self resetTables];
        }
    }];
}*/

- (IBAction)nextTable:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        [_qolSurvey createInBackgroundWithBlock:^(BOOL succeeded, int status, NSError *error) {
            NSLog(@"succeeded ? %@",succeeded ? @"true" : @"false");
            [self hideHeader:-1];
            [self pushOutTable:_tblPage1 multiplier:-1];
            [self exitSurveyMode];
        }];
    } completion:^(BOOL finished) {
        [self resetTables];
    }];
}

- (IBAction)prevTable:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        [self hideHeader:1];
        [self pushOutTable:_tblPage1 multiplier:1];
        [self exitSurveyMode];
    } completion:^(BOOL finished) {
        [self resetTables];
    }];
}

- (void)bringInTable:(UITableView *)tbl {
    if (tbl) {
        CGRect frame = tbl.frame;
        frame.origin.x = 0;
        [tbl setFrame:frame];
    }
}

- (void)pushOutTable:(UITableView *)tbl multiplier:(int)multiplier {
    if (tbl) {
        CGRect frame = tbl.frame;
        frame.origin.x = multiplier*tbl.frame.size.width;
        [tbl setFrame:frame];
    }
}

@end
