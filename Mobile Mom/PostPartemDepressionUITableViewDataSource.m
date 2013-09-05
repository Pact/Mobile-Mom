//
//  InfantileHemangiomaUITableViewDataSource.m
//  PH-Log
//
//  Created by dev on 7/10/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "PostPartemDepressionUITableViewDataSource.h"
#import "TextUITableViewCell.h"

@implementation PostPartemDepressionUITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCellIdentifier"];
    [cell setSelected:NO];
    if (indexPath.section == 0) {
        [cell setCellText:@"An infantile hemangioma is a common type of birthmark. Hemangiomas are benign collections of extra blood vessels in the skin and are one of the most common skin problems of the first year of life. They appear most frequently during the first one to four weeks after birth and occur in about 5% of all children. After appearing, hemangiomas grow fast for the first few weeks or months of life. A hemangioma is a tumor, but it is not cancer. It is benign. The cells of a hemangiomas multiply at a rate that is faster than normal. By around 8 months, these cells stop multiplying and most hemangiomas stop growing. They begin to shrink around 1 year and slowly improve over time on their own, and this often takes many years. Larger ones will take longer to go away and have a higher chance of scarring. Each hemangioma is unique. Even in the same baby, one hemangioma may not grow and another may become quite large. About one in four hemangiomas will need some form of treatment."];
    } else if (indexPath.section == 1) {
        [cell setCellText:@"The diagnosis of an IH is typically made clinically based on its appearance and characteristic behavior. Although their appearance may be quite variable, ranging from small, red lesions to large and bulky tumors, it is their behavior that helps to distinguish them from other vascular birthmarks. Early on, they can appear as a pink, flat patch often unrecognized until a few weeks of age when they begin to proliferate. The natural history of IH is characterized by an initial growth followed by a plateau phase, and finally, the resolution phase.. A change in color from bright red to purple or gray can often signal transition to the rsolution phase. Most hemangioma growth occurs in the first 5 months of life. On average, IHs typically reach their maximum size by 9 months, but deep hemangiomas may proliferate longer. Albeit rare, IHs with an extended growth phase (up to 2 years) have been reported; these tend to be larger lesions. \nIn the past, IHs have been classified by their depth of soft tissue involvement (superficial, deep, and mixed). Superficial hemangiomas appear as bright red lesions, which may be plaquelike or more rounded papules or nodules. Deep hemangiomas involve the deep dermis and subcutis and present as bluish to skin-colored nodules. Mixed hemangiomas clinically have features of both superficial and deep hemangiomas, often with a red plaque overlying a bluish nodule."];
    } else {
        [cell setCellText:@"Although most IHs are uncomplicated and do not require treatment, 1/4 of those referred to specialists had complications. Doctors should be aware of risk factors predictive of complications and the need for treatment to facilitate early referral to a physician with expertise in the management of IHs. Size and  location, are major factors to consider in evaluating an infant’s risk. Specifically, for every 10 cm 2 increase in size, a 5% increase in likelihood of complications as well as a 4% increase in likelihood of treatment has been reported. The perceived risk of permanent disfigurement was the leading indication for treatment. The risk of disfigurement depends on the, location, and rate of growth. Permanent distortion of anatomic landmarks can occur as the result of location (eg, nasal tip, involvement of ear cartilage) or secondary to ulceration (eg, lip). Additional complications of IHs include ulceration, functional impairment (visual compromise, airway obstruction, auditory canal obstruction, feeding difficulty), and cardiac compromise. outlines locations at high risk for the development of hemangioma-specific complications or associated anomalies."];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [((TextUITableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath]) fullHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"What is an infantile hemangioma?";
    } else if (section == 1) {
        return @"Diagnosis of infantile hemangioma";
    }
    return @"Complications of infantile hemangioma";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *customTitleView = [ [UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(15, 0, customTitleView.frame.size.width, 44)];
    titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    titleLabel.textColor = [UIColor colorWithRed:137.0/255.0 green:191.0/255.0 blue:251.0/255.0 alpha:1.0];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"Raleway" size:16.0f];
    
    [customTitleView setBackgroundColor:[UIColor whiteColor]];
    [customTitleView addSubview:titleLabel];
    
    return customTitleView;
}

@end
