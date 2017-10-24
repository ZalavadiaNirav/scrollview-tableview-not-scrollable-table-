//
//  ViewController.m
//  tableview
//
//  Created by Gaurav Amrutiya on 19/09/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    bool expandedArr[22];
    float height;
}
@end

@implementation ViewController

@synthesize sectionItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i=0; i<22; i++) {
        expandedArr[i]=0;
    }
    height=0.0;
    _TBL.rowHeight = UITableViewAutomaticDimension;
    _TBL.estimatedRowHeight = 100;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int manyCells  = expandedArr[indexPath.section];
    if(indexPath.section==0 &&manyCells==1)
    {
        //section=0 have bigger contain so i assign height explicitly 500
        return height;
    }
    else if(manyCells==1)
    {
        return 100;
    }
    return 44.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 22;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int manyCells  = expandedArr[section];
    if(manyCells==1)
    {
        return 1;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Section";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 340, 40)];
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"Section" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sectionPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=section;
//    [tableView addSubview:btn];
    return btn;
}

-(void)sectionPressed:(id)sender
{
    UIButton *btn=(UIButton *)sender;
    int ind=(int)btn.tag;
    BOOL show=(BOOL)expandedArr[ind];
    expandedArr[ind]=!show;
    NSLog(@"Pressed %ld",(long)btn.tag);
    [btn setTitle:@"section" forState:UIControlStateNormal];
    NSIndexSet *set=[NSIndexSet indexSetWithIndex:btn.tag];
    [_TBL reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int manyCells  = expandedArr[indexPath.section];
    static NSString *cellIdentifier=@"CellId";
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor redColor];
    if(manyCells==0)
    {
        cell.textLabel.text=@"cell";
    }
    else
    {
        if(indexPath.section==0)
        {
            //here i have big content on section=0
            height=500.0;
            cell.selectionStyle=UITableViewCellSelectionStyleNone;

        }
       
        [cell.contentView addSubview:_expandableVw];
    }

    _scrollVuew.contentSize = CGSizeMake(_TBL.frame.size.width,(_scrollVuew.frame.origin.y+_scrollVuew.contentSize.height+cell.frame.size.height));
    [_scrollVuew layoutIfNeeded];

    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"tbl contentsize w=%f h=%f",_TBL.contentSize.width,_TBL.contentSize.height);
    _tblHeightconstraint.constant=_TBL.contentSize.height;
}

- (void)tableViewExpandSection:(NSInteger)section
{
//    NSArray *sectionData = [self.sectionItems objectAtIndex:section];
//    
//    if (sectionData.count == 0) {
//        self.expandedSectionHeaderNumber = -1;
//        return;
//    } else {
//        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
//        for (int i=0; i< sectionData.count; i++) {
//            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
//            [arrayOfIndexPaths addObject:index];
//        }
//        self.expandedSectionHeaderNumber = section;
//        [self.tableView beginUpdates];
//        [self.tableView insertRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
//        [self.tableView endUpdates];
//    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadAction:(id)sender {
}
@end
