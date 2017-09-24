//
//  ViewController.h
//  tableview
//
//  Created by Gaurav Amrutiya on 19/09/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TBL;

@property (strong, nonatomic) IBOutlet UIView *expandableVw;
@property (weak, nonatomic) IBOutlet UILabel *addressTitleLbl;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
- (IBAction)downloadAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollVuew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tblHeightconstraint;
@property (weak,nonatomic) NSMutableArray *sectionItems;

@end

