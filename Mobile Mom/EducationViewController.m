//
//  EducationViewController.m
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "EducationViewController.h"
#import "Constants.h"
#import "MomHealthUITableViewDataSource.h"
#import "BabyHealthUITableViewDataSource.h"
#import "PostPartemDepressionUITableViewDataSource.h"
#import "ResourcesUITableViewDataSource.h"

@interface EducationViewController ()

@property (strong, nonatomic) MomHealthUITableViewDataSource *momHealthDataSource;
@property (strong, nonatomic) BabyHealthUITableViewDataSource *babyHealthDataSource;
@property (strong, nonatomic) PostPartemDepressionUITableViewDataSource *postPartemDepressionDataSource;
@property (strong, nonatomic) ResourcesUITableViewDataSource *resourcesDataSource;

@end

@implementation EducationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Education";
    
    _momHealthDataSource = [[MomHealthUITableViewDataSource alloc] init];
    _babyHealthDataSource = [[BabyHealthUITableViewDataSource alloc] init];
    _postPartemDepressionDataSource = [[PostPartemDepressionUITableViewDataSource alloc] init];
    _resourcesDataSource = [[ResourcesUITableViewDataSource alloc] init];
    
    [_tbl registerNib:[UINib nibWithNibName:@"TextUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TextCellIdentifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBtnMomHealth:nil];
    [self setBtnBabyHealth:nil];
    [self setBtnPostPartemDepression:nil];
    [self setBtnResources:nil];
    [self setTbl:nil];
    [super viewDidUnload];
}

- (IBAction)showMomHealth:(id)sender {
    if (_btnResources.alpha == 0.0) {
        //mom health is already showing, hide table and show buttons again
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _btnBabyHealth.alpha = 1.0;
            _btnPostPartemDepression.alpha = 1.0;
            _btnResources.alpha = 1.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = self.view.frame.size.height;
            [_tbl setFrame:tblFrame];
        }];
        
    } else {
        [_tbl setDataSource:_momHealthDataSource];
        [_tbl setDelegate:_momHealthDataSource];
        [_tbl reloadData];
        [_tbl scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [UIView animateWithDuration:0.3 animations:^{
            
            _btnBabyHealth.alpha = 0.0;
            _btnPostPartemDepression.alpha = 0.0;
            _btnResources.alpha = 0.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = _btnMomHealth.frame.origin.y + _btnMomHealth.frame.size.height + 8;
            [_tbl setFrame:tblFrame];
        }];
    }
}

- (IBAction)showBabyHealth:(id)sender {
    if (_btnResources.alpha == 0.0) {
        //baby health is already showing, hide table and show buttons again
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnBabyHealth.frame;
            frame.origin.y = _btnMomHealth.frame.origin.y + _btnMomHealth.frame.size.height + 8;
            [_btnBabyHealth setFrame:frame];
            
            _btnMomHealth.alpha = 1.0;
            _btnPostPartemDepression.alpha = 1.0;
            _btnResources.alpha = 1.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = self.view.frame.size.height;
            [_tbl setFrame:tblFrame];
        }];
        
    } else {
        [_tbl setDataSource:_babyHealthDataSource];
        [_tbl setDelegate:_babyHealthDataSource];
        [_tbl reloadData];
        [_tbl scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnBabyHealth.frame;
            frame.origin.y = 20;
            [_btnBabyHealth setFrame:frame];
            
            _btnMomHealth.alpha = 0.0;
            _btnPostPartemDepression.alpha = 0.0;
            _btnResources.alpha = 0.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = _btnMomHealth.frame.origin.y + _btnMomHealth.frame.size.height + 8;
            [_tbl setFrame:tblFrame];
        }];
    }
}

- (IBAction)showPostPartemDepression:(id)sender {
    if (_btnResources.alpha == 0.0) {
        //post partem depression is already showing, hide table and show buttons again
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnPostPartemDepression.frame;
            frame.origin.y = _btnBabyHealth.frame.origin.y + _btnBabyHealth.frame.size.height + 8;
            [_btnPostPartemDepression setFrame:frame];
            
            _btnMomHealth.alpha = 1.0;
            _btnBabyHealth.alpha = 1.0;
            _btnResources.alpha = 1.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = self.view.frame.size.height;
            [_tbl setFrame:tblFrame];
        }];
        
    } else {
        [_tbl setDataSource:_postPartemDepressionDataSource];
        [_tbl setDelegate:_postPartemDepressionDataSource];
        [_tbl reloadData];
        [_tbl scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnPostPartemDepression.frame;
            frame.origin.y = 20;
            [_btnPostPartemDepression setFrame:frame];
            
            _btnMomHealth.alpha = 0.0;
            _btnBabyHealth.alpha = 0.0;
            _btnResources.alpha = 0.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = _btnMomHealth.frame.origin.y + _btnMomHealth.frame.size.height + 8;
            [_tbl setFrame:tblFrame];
        }];
    }
}

- (IBAction)showResources:(id)sender {
    if (_btnPostPartemDepression.alpha == 0.0) {
        //resources is already showing, hide table and show buttons again
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnResources.frame;
            frame.origin.y = _btnPostPartemDepression.frame.origin.y + _btnPostPartemDepression.frame.size.height + 8;
            [_btnResources setFrame:frame];
            
            _btnMomHealth.alpha = 1.0;
            _btnBabyHealth.alpha = 1.0;
            _btnPostPartemDepression.alpha = 1.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = self.view.frame.size.height;
            [_tbl setFrame:tblFrame];
        }];
        
    } else {
        [_tbl setDataSource:_resourcesDataSource];
        [_tbl setDelegate:_resourcesDataSource];
        [_tbl reloadData];
        [_tbl scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = _btnResources.frame;
            frame.origin.y = 20;
            [_btnResources setFrame:frame];
            
            _btnMomHealth.alpha = 0.0;
            _btnBabyHealth.alpha = 0.0;
            _btnPostPartemDepression.alpha = 0.0;
            
            CGRect tblFrame = _tbl.frame;
            tblFrame.origin.y = _btnMomHealth.frame.origin.y + _btnMomHealth.frame.size.height + 8;
            [_tbl setFrame:tblFrame];
        }];
    }
}

@end
