//
//  QOLPage1UITableViewDataSource.m
//  PH-Log
//
//  Created by dev on 6/19/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "QOLPage1UITableViewDataSource.h"
#import "ColoredRatingUITableViewCell.h"

@implementation QOLPage1UITableViewDataSource

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithTable:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tbl = tableView;
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColoredRatingUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColoredRatingCellIdentifier"];
    [cell setQolSurvey:_qolSurvey];
    switch (indexPath.row) {
        case 0:
            [cell setCellDescription:@"My child has pain because of this hemangioma"];
            break;
        case 1:
            [cell setCellDescription:@"My child seems sickly or prone to illness because of the hemangioma"];
            break;
        case 2:
            [cell setCellDescription:@"My child is not growing or developing normally because of the hemangioma"];
            break;
        case 3:
            [cell setCellDescription:@"My child has trouble sleeping because of the hemangioma"];
            break;
        case 4:
            [cell setCellDescription:@"Because of the hemangioma my child has problems being soothed or comforted when crying"];
            break;
        case 5:
            [cell setCellDescription:@"My child’s hemangioma prevents him/her from participating in social events such as parties and play groups"];
            break;
        case 6:
            [cell setCellDescription:@"Friend or relatives avoid touching and holding my child because of his/her hemangioma"];
            break;
        case 7:
            [cell setCellDescription:@"Children seem to avoid touching or playing with my child because of his/her hemangioma"];
            break;
        case 8:
            [cell setCellDescription:@"My child’s hemangioma makes me feel sad or depressed"];
            break;
        case 9:
            [cell setCellDescription:@"I am disappointed that my child has this hemangioma"];
            break;
        case 10:
            [cell setCellDescription:@"I experience more headaches than usual as a result of my child’s hemangioma"];
            break;
        case 11:
            [cell setCellDescription:@"My child’s hemangioma makes me feel anxious or nervous"];
            break;
        case 12:
            [cell setCellDescription:@"I am bothered by how much time is needed to care for my child because of the hemangioma"];
            break;
        case 13:
            [cell setCellDescription:@"I am bothered when strangers stare at my child"];
            break;
        case 14:
            [cell setCellDescription:@"I worry about the amount of money I have to spend because of the hemangioma"];
            break;
        case 15:
            [cell setCellDescription:@"I am embarrassed by the way my child looks because of his/her hemangioma"];
            break;
        case 16:
            [cell setCellDescription:@"I am worried that in the future, my child will not make friends as easily because of the hemangioma"];
            break;
        case 17:
            [cell setCellDescription:@"I blame myself or my child’s other parent that my child has this hemangioma"];
            break;
        case 18:
            [cell setCellDescription:@"The hemangioma has affected how confident I feel about my child’s medical care"];
            break;
        case 19:
            [cell setCellDescription:@"I get worried when I see changes in my child’s hemangioma"];
            break;
        case 20:
            [cell setCellDescription:@"I have been frustrated with my child’s medical care for the hemangioma"];
            break;
        case 21:
            [cell setCellDescription:@"I am bothered that my child needs to be watched more closely at home because of the hemangioma"];
            break;
        case 22:
            [cell setCellDescription:@"I feel physically weak as a result of my child’s hemangioma"];
            break;
        case 23:
            [cell setCellDescription:@"I am bothered when strangers offer opinions or ask questions about my child’s hemangioma"];
            break;
        case 24:
            [cell setCellDescription:@"My child’s hemangioma affects our social life"];
            break;
        case 25:
            [cell setCellDescription:@"My child’s hemangioma has strained my relationship with my spouse or partner"];
            break;
        case 26:
            [cell setCellDescription:@"I have been accused of child abuse because of my child’s hemangioma"];
            break;
        case 27:
            [cell setCellDescription:@"Our family is less likely to go to public places (e.g. grocery store) because of the hemangioma"];
            break;
        case 28:
            [cell setCellDescription:@"My child’s hemangioma affects my or my spouse/partner’s work due to missed time"];
            break;
        case 29:
            [cell setCellDescription:@"I am considering not having more children because of my child’s hemangioma"];
            break;
        case 30:
            [cell setCellDescription:@"I worry about my child based on information I read on the internet"];
            break;
        case 31:
            [cell setCellDescription:@"I worry about side effects of the medication(s) used to treat my child’s hemangioma"];
            break;
        case 32:
            [cell setCellDescription:@"I feel too tired to do the things I like to do because of my child’s hemangioma"];
            break;
        case 33:
            [cell setCellDescription:@"I have felt sick to my stomach as a result of my child’s hemangioma"];
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 34;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
