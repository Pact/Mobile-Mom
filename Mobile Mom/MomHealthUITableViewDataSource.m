//
//  TimololTreatmentUITableViewDataSource.m
//  PH-Log
//
//  Created by dev on 7/10/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "MomHealthUITableViewDataSource.h"
#import "TextUITableViewCell.h"

@implementation MomHealthUITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCellIdentifier"];
    [cell setSelected:NO];
    if (indexPath.section == 0) {
        [cell setCellText:@"Timolol is a beta-blocker medicine. It is currently available an eye drop that has been previously used to treat glaucoma.  Recent studies found that when Timolol eye drops are applied to the skin it can shrink skin hemangiomas in some children. Even though it is an eye drop it is most often put on the skin when treating hemangiomas.\n\nTimolol is approved by the Food and Drug Administration (FDA) for children, but not for treating hemangiomas in children. At this time, there is no FDA approved medicine to treat infantile hemangiomas."];
    } else if (indexPath.section == 1) {
        [cell setCellText:@"In the first couple of months of life some hemangiomas grow fast. Not all hemangiomas need treatment, only ones that are growing rapidly or causing complications. Timolol is most often used to treat hemangiomas that are near the outer layers of the skin. This type is called a superficial hemangioma and is bright red or purple."];
    } else if (indexPath.section == 2) {
        [cell setCellText:@"Put the Timolol on the skin over the hemangioma. The doctor will tell you how much to use and how often to put it on."];
    } else if (indexPath.section == 3) {
        [cell setCellText:@"Your doctor will talk to you about possible risks and side effects of timolol."];
    } else if (indexPath.section == 4) {
        [cell setCellText:@"Allergic reactions are rare but may include:\n\n* Itching, hives or swelling of the face or hands.\n* Severe reactions such as swelling of the mouth or throat, or trouble breathing."];
    } else if (indexPath.section == 5) {
        [cell setCellText:@"Timolol may slow a child’s heart rate. Most often, the heart rate will still be in the normal range."];
    } else if (indexPath.section == 6) {
        [cell setCellText:@"Low blood sugar can cause drowsiness or in rare cases, seizures. Early signs of low blood sugar may include coldness, shakiness and sweating.  This could happen if your child has gone for several hours without eating. It is best to give timolol during or right after your child eats."];
    } else if (indexPath.section == 7) {
        [cell setCellText:@"If your child is wheezing or having trouble breathing, call the doctor who prescribed the medicine immediately.  Your child’s treatment may need to be changed if these problems occur."];
    } else if (indexPath.section == 8) {
        [cell setCellText:@"When your child starts the timolol they may have a hard time falling asleep or may sleep more than normal. If this happens and seems mild, see if it gets better once your child has been taking timolol for a few weeks.  In rare cases, night terrors (bad nightmares) have been reported. Nightmares might be reduced by giving the last dose of timolol with food before bed.  If these side effects continue or are concerning, call the doctor who prescribed the medicine."];
    } else if (indexPath.section == 9) {
        [cell setCellText:@"Timolol can cause other rare side effects. If your child is having a new problem or change in behavior, call the doctor who prescribed the medicine."];
    } else if (indexPath.section == 10) {
        [cell setCellText:@""];
    } else if (indexPath.section == 11) {
        [cell setCellText:@"Timolol is a liquid that is given by mouth. It must be measured carefully.  If used properly, it is safe and effective for treating infantile hemangiomas. These steps will help you use the drug safely."];
    } else if (indexPath.section == 12) {
        [cell setCellText:@"It is very important to give the right amount at the right time. Decide who will give the medicine and at what time of the day. Give it right before or right after a feeding (breast milk, formula or solid food). Do not mix it into food or milk."];
    } else if (indexPath.section == 13) {
        [cell setCellText:@"Always use a syringe to measure the medicine. Your doctor or pharmacist will give you the correct size syringe."];
    } else if (indexPath.section == 14) {
        [cell setCellText:@"It is best if the same person always gives the timolol.  This will help avoid giving too much. If this is not possible, fill syringes with the correct dose. Fill enough syringes for the whole day. Give the pre-filled syringe to the person that will be giving the dose."];
    } else if (indexPath.section == 15) {
        [cell setCellText:@"Keep doses at least 6 hours apart."];
    } else if (indexPath.section == 16) {
        [cell setCellText:@"If you miss a dose, skip that dose.  Do not double the next dose or give more timolol. Just wait for the next dose time and give it then."];
    } else if (indexPath.section == 17) {
        [cell setCellText:@"If your baby spits up medicine, or does not get it all, do not give another dose. Wait until the next scheduled dose."];
    } else if (indexPath.section == 18) {
        [cell setCellText:@"Infants less than 6 months old should eat at least every 6 hours. Infants over 6 months old should eat at least every 8 hours.  You may have to wake your baby during the night to feed them if they sleep longer than this."];
    } else if (indexPath.section == 19) {
        [cell setCellText:@"If your baby is sick and will only drink small amounts, stop giving timolol and call the doctor who prescribed it. It is normally okay to stop the timolol for a few days."];
    } else if (indexPath.section == 20) {
        [cell setCellText:@"If your baby needs to stop eating for a procedure, surgery, or a scan tell the doctor that your child is on timolol. The medicine may need to be stopped during this time."];
    } else if (indexPath.section == 21) {
        [cell setCellText:@"Keep a list of all of your child’s medicines and give it to your child’s doctors. Timolol does not mix well with some other medicines. This includes over the counter, herbal and prescription drugs."];
    } else if (indexPath.section == 22) {
        [cell setCellText:@"Call 9-1-1 if your baby has trouble breathing, is unresponsive, is unconscious or has a seizure. If you think your child may have low blood sugar, give liquids with calories. Do not give anything by mouth if your child is unresponsive."];
    } else {
        [cell setCellText:@"Call the doctor who prescribes the medicine, nurse, or clinic right away if you have any concerns or if your child:\n\n* Has an allergic reaction.  This may include:\n        * itching or hives.\n        * swelling in the face or hands.\n        * swelling or tingling in the mouth.\n        * swelling or tingling in the throat.\n        * tightness in the chest.\n* Has cold sweats.\n* Has skin that looks blue.\n* Is having mood changes.\n* Has trouble sleeping.\n* Has a slow, fast, or uneven heartbeat.\n* Is more tired or weak than normal.\n* Has a skin rash.\n* Is constipated, has diarrhea, nausea or vomiting, or an upset stomach.\n* Has special health care needs not covered by this information."];
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
    return 24;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"What is timolol?";
    } else if (section == 1) {
        return @"When is Timolol used to treat a hemangioma?";
    } else if (section == 2) {
        return @"How do I use timolol?";
    } else if (section == 3) {
        return @"What are the risks or side effects of timolol?";
    } else if (section == 4) {
        return @"Allergic reaction";
    } else if (section == 5) {
        return @"Slow heart rate";
    } else if (section == 6) {
        return @"Low blood sugar";
    } else if (section == 7) {
        return @"Breathing problems or wheezing";
    } else if (section == 8) {
        return @"Change in sleep pattern";
    } else if (section == 9) {
        return @"Other possible side effects";
    } else if (section == 10) {
        return @"What can be done to reduce the risk of side effects?";
    } else if (section == 11) {
        return @"How do I give timolol and reduce the chances of a side effect?";
    } else if (section == 12) {
        return @"Side effects can increase as the dose is increased";
    } else if (section == 13) {
        return @"Measuring Doses";
    } else if (section == 14) {
        return @"Measure each dose carefully";
    } else if (section == 15) {
        return @"Dose Frequency";
    } else if (section == 16) {
        return @"Missing a Dose";
    } else if (section == 17) {
        return @"Baby Spits up Medicine";
    } else if (section == 18) {
        return @"Feed your baby often";
    } else if (section == 19) {
        return @"Baby is Sick";
    } else if (section == 20) {
        return @"Procedures or Surgeries";
    } else if (section == 21) {
        return @"Other Medications";
    } else if (section == 22) {
        return @"ALERT";
    } else {
        return @"When to Call a Doctor";
    }
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
