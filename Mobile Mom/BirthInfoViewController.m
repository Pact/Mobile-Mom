//
//  ChildProfileViewController.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "BirthInfoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomUITableViewCell.h"

@interface BirthInfoViewController ()

@property int expandedIndex;

@end

@implementation BirthInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"PHLogProfileViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Birth Info";
    
    _expandedIndex = -1;
    
    [self.tblMain setDataSource:self];
    [self.tblMain setDelegate:self];
    [self.tblMain registerNib:[UINib nibWithNibName:@"PreConceptionUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PreConceptionCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"TestingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TestingCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"PreNatalMedicationsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PreNatalMedicationsCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"SmokingUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SmokingCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"TermUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TermCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"BirthWeightUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BirthWeightCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"BirthHeightUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BirthHeightCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"MethodOfDeliveryUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MethodOfDeliveryCellIdentifier"];
    [self.tblMain reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell<CustomUITableViewCell> *cell = nil;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PreConceptionCellIdentifier"];
            [cell updateCellWithTitle:@"(Pre) Conception"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"TestingCellIdentifier"];
            [cell updateCellWithTitle:@"Testing"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PreNatalMedicationsCellIdentifier"];
            [cell updateCellWithTitle:@"Pre-Natal Medications"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"SmokingCellIdentifier"];
            [cell updateCellWithTitle:@"Smoking"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"TermCellIdentifier"];
            [cell updateCellWithTitle:@"Term"];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"BirthWeightCellIdentifier"];
            [cell updateCellWithTitle:@"Birth Weight"];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:@"BirthHeightCellIdentifier"];
            [cell updateCellWithTitle:@"Birth Height"];
            break;
        case 7:
            cell = [tableView dequeueReusableCellWithIdentifier:@"MethodOfDeliveryCellIdentifier"];
            [cell updateCellWithTitle:@"Method of Delivery"];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _expandedIndex == indexPath.row ? [((UITableViewCell<CustomUITableViewCell> *)[self tableView:self.tblMain cellForRowAtIndexPath:indexPath]) expandedHeight] : 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_expandedIndex == indexPath.row) {
        _expandedIndex = -1;
        [((UITableViewCell<CustomUITableViewCell> *)[tableView cellForRowAtIndexPath:indexPath]) cover:^(BOOL finished) {
            [tableView beginUpdates];
            [tableView endUpdates];
        }];
    } else {
        _expandedIndex = indexPath.row;
        for (int i=0;i<8;i++) {
            [((UITableViewCell<CustomUITableViewCell> *)[self.tblMain cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]) cover:nil];
        }
        [CATransaction begin];
        
        [CATransaction setCompletionBlock:^{
            if (_expandedIndex != -1) {
                [((UITableViewCell<CustomUITableViewCell> *)[tableView cellForRowAtIndexPath:indexPath]) uncover:nil];
            }
        }];
        
        [tableView beginUpdates];
        [tableView endUpdates];
        
        [CATransaction commit];
    }
    
}

@end
