//
//  PropranololUITableViewDataSource.m
//  PH-Log
//
//  Created by dev on 7/10/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "BabyHealthUITableViewDataSource.h"
#import "TextUITableViewCell.h"

@implementation BabyHealthUITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCellIdentifier"];
    [cell setSelected:NO];
    if (indexPath.section == 0) {
        [cell setCellText:@"Propranolol is a beta blocker medicine.  It is often used to treat high blood pressure and heart problems. It is also used to treat migraine headaches. Recent studies have found that Propranolol has helped shrink hemangiomas in some children.\n\nPropranolol is approved by the Food and Drug Administration (FDA), but not for children and not for treating hemangiomas in children. Currently, there is no FDA approved medicine for the treatment of infantile hemangiomas."];
    } else if (indexPath.section == 1) {
        [cell setCellText:@"A small number of hemangiomas require treatment for complications LINK caused by the growth of the hemangioma. Sometimes treatment is needed if the hemangioma is growing too large on the eye, lip, and nose or in the airway. Treatment is also needed if there is a real risk of permanent scarring. Sometimes propranolol is used to help with healing when skin breakdown occurs on the hemangioma. During the first couple of months of life when a hemangioma is growing rapidly, it can be difficult to determine how big it will become, so your child may need to be seen in the clinic often; as babies get older the office visits are usually less frequent."];
    } else if (indexPath.section == 2) {
        [cell setCellText:@"Your doctor will talk to you about possible risks and side effects of propranolol."];
    } else if (indexPath.section == 3) {
        [cell setCellText:@"Allergic reactions are rare but may include:\n\n* Itching, hives or swelling of the face or hands.\n* Severe reactions such as swelling of the mouth or throat, or trouble breathing."];
    } else if (indexPath.section == 4) {
        [cell setCellText:@"Propranolol may slow a child’s heart rate. Most often, the heart rate will still be in the normal range."];
    } else if (indexPath.section == 5) {
        [cell setCellText:@"Low blood sugar can cause drowsiness or in rare cases, seizures. Early signs of low blood sugar may include coldness, shakiness and sweating.  This could happen if your child has gone for several hours without eating. It is best to give propranolol during or right after your child eats."];
    } else if (indexPath.section == 6) {
        [cell setCellText:@"If your child is wheezing or having trouble breathing, call the doctor who prescribed the medicine immediately.  Your child’s treatment may need to be changed if these problems occur."];
    } else if (indexPath.section == 7) {
        [cell setCellText:@"When your child starts the propranolol they may have a hard time falling asleep or may sleep more than normal.If this happens and seems mild, see if it gets better once your child has been taking propranolol for a few weeks.  In rare cases, night terrors (bad nightmares) have been reported. Nightmares might be reduced by giving the last dose of propranolol with food before bed.  If these side effects continue or are concerning, call the doctor who prescribed the medicine."];
    } else if (indexPath.section == 8) {
        [cell setCellText:@"Propranolol can cause other rare side effects. If your child is having a new problem or change in behavior, call the doctor who prescribed the medicine."];
    } else if (indexPath.section == 9) {
        [cell setCellText:@"Propranolol is a liquid that is given by mouth. It must be measured carefully.  If used properly, it is safe and effective for treating infantile hemangiomas. These steps will help you use the drug safely."];
    } else if (indexPath.section == 10) {
        [cell setCellText:@"It is very important to give the right amount at the right time. Decide who will give the medicine and at what time of the day. Give it right before or right after a feeding (breast milk, formula or solid food). Do not mix it into food or milk."];
    } else if (indexPath.section == 11) {
        [cell setCellText:@"Always use a syringe to measure the medicine. Your doctor or pharmacist will give you the correct size syringe."];
    } else if (indexPath.section == 12) {
        [cell setCellText:@"It is best if the same person always gives the propranolol.  This will help avoid giving too much. If this is not possible, fill syringes with the correct dose. Fill enough syringes for the whole day. Give the pre-filled syringe to the person that will be giving the dose."];
    } else if (indexPath.section == 13) {
        [cell setCellText:@"Keep doses at least 6 hours apart."];
    } else if (indexPath.section == 14) {
        [cell setCellText:@"If you miss a dose, skip that dose.  Do not double the next dose or give more propranolol. Just wait for the next dose time and give it then."];
    } else if (indexPath.section == 15) {
        [cell setCellText:@"If your baby spits up medicine, or does not get it all, do not give another dose. Wait until the next scheduled dose."];
    } else if (indexPath.section == 16) {
        [cell setCellText:@"Infants less than 6 months old should eat at least every 6 hours. Infants over 6 months old should eat at least every 8 hours.  You may have to wake your baby during the night to feed them if they sleep longer than this."];
    } else if (indexPath.section == 17) {
        [cell setCellText:@"If your baby is sick and will only drink small amounts, stop giving propranolol and call the doctor who prescribed it. It is normally okay to stop the propranolol for a few days."];
    } else if (indexPath.section == 18) {
        [cell setCellText:@"If your baby needs to stop eating for a procedure, surgery, or a scan tell the doctor that your child is on propranolol. The medicine may need to be stopped during this time."];
    } else if (indexPath.section == 19) {
        [cell setCellText:@"Keep a list of all of your child’s medicines and give it to your child’s doctors. Propranolol does not mix well with some other medicines. This includes over the counter, herbal and prescription drugs."];
    } else if (indexPath.section == 20) {
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
    return 22;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"What is propranolol?";
    } else if (section == 1) {
        return @"When is propranolol used to treat a hemangioma?";
    } else if (section == 2) {
        return @"What are the risks or side effects of propranolol?";
    } else if (section == 3) {
        return @"Allergic reaction";
    } else if (section == 4) {
        return @"Slow heart rate";
    } else if (section == 5) {
        return @"Low blood sugar";
    } else if (section == 6) {
        return @"Breathing problems or wheezing";
    } else if (section == 7) {
        return @"Change in sleep pattern";
    } else if (section == 8) {
        return @"Other possible side effects";
    } else if (section == 9) {
        return @"How do I give propranolol and reduce the chances of a side effect?";
    } else if (section == 10) {
        return @"Side effects can increase as the dose is increased";
    } else if (section == 11) {
        return @"Measuring Doses";
    } else if (section == 12) {
        return @"Measure each dose carefully";
    } else if (section == 13) {
        return @"Dose Frequency";
    } else if (section == 14) {
        return @"Missing a Dose";
    } else if (section == 15) {
        return @"Baby Spits up Medicine";
    } else if (section == 16) {
        return @"Feed your baby often";
    } else if (section == 17) {
        return @"Baby is Sick";
    } else if (section == 18) {
        return @"Procedures or Surgeries";
    } else if (section == 19) {
        return @"Other Medications";
    } else if (section == 20) {
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
