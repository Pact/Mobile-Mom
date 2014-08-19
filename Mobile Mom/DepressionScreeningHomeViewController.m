//
//  AdverseEventsSurveyViewController.m
//  PH-Log
//
//  Created by dev on 7/2/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "DepressionScreeningHomeViewController.h"
#import "Constants.h"
#import "DateUITableViewCell.h"
#import "Catalyze.h"
#import "DepressionScreeningViewController.h"

@interface DepressionScreeningHomeViewController ()

@property (strong, nonatomic) NSMutableArray *screenings;

@end

@implementation DepressionScreeningHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.userInteractionEnabled = YES;
    self.navigationItem.title = @"Depression Screening";
    
    _screenings = [NSMutableArray array];
    
    [_tblSurveys registerNib:[UINib nibWithNibName:@"DateUITableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DateCellIdentifier"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CatalyzeQuery *query = [CatalyzeQuery queryWithClassName:@"depressionScreening"];
    //[query setQueryValue:[[CatalyzeUser currentUser] usersId]];
    //[query setQueryField:@"parentId"];
    [query setPageNumber:1];
    [query setPageSize:100];
    [query retrieveInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"query completed with error - %@",error);
        } else {
            NSLog(@"success: %@", objects);
            _screenings = [NSMutableArray arrayWithArray:objects];
            [self runTest:[_screenings objectAtIndex:0]];
            [_tblSurveys reloadData];
        }
    }];
}

- (void)runTest:(id)unknown_object {
    NSLog(@"object: %@", unknown_object);
    NSLog(@"class: %@", [unknown_object class]);
    CatalyzeObject *object = (CatalyzeObject *)unknown_object;
    NSLog(@"entryId: %@", object.entryId);
    NSLog(@"authorId: %@", object.authorId);
    NSLog(@"parentId: %@", object.parentId);
    //NSLog(@"content: %@", object.content);
    NSLog(@"updatedAt: %@", object.updatedAt);
    NSLog(@"createdAt: %@", object.createdAt);
    NSLog(@"className: %@", object.className);
    [object setValue:@"testing" forKey:@"I have looked forward with enjoyment to things"];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, int status, NSError *error) {
        NSLog(@"success?: %@", succeeded ? @"true" : @"false");
        NSLog(@"entryId2: %@", object.entryId);
        NSLog(@"authorId2: %@", object.authorId);
        NSLog(@"parentId2: %@", object.parentId);
        //NSLog(@"content2: %@", object.content);
        NSLog(@"updatedAt2: %@", object.updatedAt);
        NSLog(@"createdAt2: %@", object.createdAt);
        NSLog(@"className2: %@", object.className);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTblSurveys:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DateUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCellIdentifier"];
    
    if (indexPath.section == 0) {
        [cell.lblDate setText:@"Take Now"];
        [cell setCellBackgroundColor:[UIColor colorWithRed:192.0/255.0f green:57.0/255.0f blue:43.0/255.0f alpha:1.0f]];
    } else {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[[[_screenings objectAtIndex:indexPath.row] valueForKey:@"content"] valueForKey:@"title"] doubleValue]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [cell setDate:[formatter stringFromDate:date]];
        [cell setCellBackgroundColor:[UIColor colorWithRed:77.0/255.0f green:170.0/255.0f blue:136.0/255.0f alpha:1.0f]];
    }
    [cell setSelected:NO];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _screenings.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Screening due";
    }
    return @"Prior screenings taken";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *customTitleView = [ [UIView alloc] initWithFrame:CGRectMake(0, 0, _tblSurveys.frame.size.width, 44)];
    
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(15, 0, customTitleView.frame.size.width, 44)];
    titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"Raleway" size:16.0f];
    
    [customTitleView setBackgroundColor:[UIColor whiteColor]];
    [customTitleView addSubview:titleLabel];
    
    return customTitleView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
    if (indexPath.section == 0) {
        DepressionScreeningViewController *screening = [[DepressionScreeningViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:screening animated:YES];
    }
}

@end
