//
//  ProfileViewController.m
//  PH-Log
//
//  Created by dev on 6/17/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomUITableViewCell.h"
#import "Constants.h"
#import "Catalyze.h"

@interface ProfileViewController ()

@property int expandedIndex;

@end

@implementation ProfileViewController
@synthesize expandedIndex = _expandedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:@"PHLogProfileViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Mom";
    
    _expandedIndex = -1;
    
    [self.tblMain setDataSource:self];
    [self.tblMain setDelegate:self];
    [self.tblMain registerNib:[UINib nibWithNibName:@"NameUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"NameCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"AddressUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"AddressCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"ParentsDateOfBirthUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ParentsDateOfBirthCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"EducationUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"EducationCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"OBGYNUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"OBGYNCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"MidWifeUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MidWifeCellIdentifier"];
    [self.tblMain registerNib:[UINib nibWithNibName:@"DadUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DadCellIdentifier"];
    [self.tblMain reloadData];
}

- (void)didReceiveMemoryWarning {
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"NameCellIdentifier"];
            [cell updateCellWithTitle:@"Name"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"AddressCellIdentifier"];
            [cell updateCellWithTitle:@"Address"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"ParentsDateOfBirthCellIdentifier"];
            [cell updateCellWithTitle:@"Date of Birth"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"EducationCellIdentifier"];
            [cell updateCellWithTitle:@"Education"];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"OBGYNCellIdentifier"];
            [cell updateCellWithTitle:@"OBGYN"];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"MidWifeCellIdentifier"];
            [cell updateCellWithTitle:@"Mid Wife"];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:@"DadCellIdentifier"];
            [cell updateCellWithTitle:@"Dad's Info"];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _expandedIndex == indexPath.row ? [((UITableViewCell<CustomUITableViewCell> *)[self tableView:self.tblMain cellForRowAtIndexPath:indexPath]) expandedHeight] : 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
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
        for (int i=0;i<7;i++) {
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
