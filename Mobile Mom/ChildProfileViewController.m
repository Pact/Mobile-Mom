//
//  ChildProfileViewController.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ChildProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomUITableViewCell.h"

@interface ChildProfileViewController ()

@property int expandedIndex;

@end

@implementation ChildProfileViewController

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
    
    self.navigationItem.title = @"Baby";
    
    _expandedIndex = -1;
    
    [self.tblMain setDataSource:self];
    [self.tblMain setDelegate:self];
    [self.tblMain registerNib:[UINib nibWithNibName:@"BabyNameUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BabyNameCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"DateOfBirthUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DateOfBirthCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"GenderUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GenderCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"RaceUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"RaceCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"MedicalConditionsUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MedicalConditionsCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"PediatricianUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PediatricianCellIdentifier"];
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"BabyNameCellIdentifier"];
            [cell updateCellWithTitle:@"Name"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"DateOfBirthCellIdentifier"];
            [cell updateCellWithTitle:@"Date of Birth"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"GenderCellIdentifier"];
            [cell updateCellWithTitle:@"Gender"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"RaceCellIdentifier"];
            [cell updateCellWithTitle:@"Race"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"MedicalConditionsCellIdentifier"];
            [cell updateCellWithTitle:@"Medical Conditions"];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PediatricianCellIdentifier"];
            [cell updateCellWithTitle:@"Pediatrician"];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _expandedIndex == indexPath.row ? [((UITableViewCell<CustomUITableViewCell> *)[self tableView:self.tblMain cellForRowAtIndexPath:indexPath]) expandedHeight] : 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
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
        for (int i=0;i<6;i++) {
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
