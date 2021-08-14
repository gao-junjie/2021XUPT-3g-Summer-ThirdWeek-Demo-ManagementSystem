//
//  MainViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "MainViewController.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:registerImageView];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 505) style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mainTableView];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    [_mainTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    
    
    UIButton* addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [addButton setTitle:@"ADD" forState:UIControlStateNormal];
    [addButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
    [addButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    addButton.backgroundColor = [UIColor colorWithRed:0.6 green:0 blue:0 alpha:0.2];
    addButton.frame = CGRectMake(25, 645, 158, 40);
    [addButton addTarget:self action:@selector(pressAddButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    UIButton* deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [deleteButton setTitle:@"DELETE" forState:UIControlStateNormal];
    [deleteButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
    [deleteButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    deleteButton.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.3 alpha:0.34];
    deleteButton.frame = CGRectMake(245, 645, 158, 40);
    [deleteButton addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    UIButton* changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [changeButton setTitle:@"CHANGE" forState:UIControlStateNormal];
    [changeButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changeButton.backgroundColor = [UIColor colorWithWhite:0.45 alpha:0.38];
    changeButton.frame = CGRectMake(25, 715, 158, 40);
    [changeButton addTarget:self action:@selector(pressChangeButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton* searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [searchButton setTitle:@"SEARCH" forState:UIControlStateNormal];
    [searchButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
    [searchButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    searchButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.3 alpha:0.25];
    searchButton.frame = CGRectMake(245, 715, 158, 40);
    [searchButton addTarget:self action:@selector(pressSearchButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    UIButton* sortButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [sortButton setTitle:@"SORT" forState:UIControlStateNormal];
    [sortButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:35]];
    [sortButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    sortButton.backgroundColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.7 alpha:0.25];
    sortButton.frame = CGRectMake(25, 785, 158, 40);
    [sortButton addTarget:self action:@selector(pressSortButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sortButton];
    
    
    for (int i = 0 ; i < 3; i++) {
        UIImageView* tipHeadImageView = [[UIImageView alloc] init];
        [tipHeadImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tip%d.jpg",i + 2]]];
        tipHeadImageView.frame = CGRectMake(12 + 65 * i + 80 * i, 60, 85, 45);
        [self.view addSubview:tipHeadImageView];
    }
    
    
    UIButton* exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    exitButton.frame = CGRectMake(230, 775, 160, 80);
    [exitButton setImage:[UIImage imageNamed:@"tip11.png"] forState:UIControlStateNormal];
    [exitButton addTarget:self action:@selector(pressExitButtonButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
    
    
    _nameArray = [NSMutableArray arrayWithObjects:@"朱方元", @"郝千彪", @"张博添", @"汪怡甫", @"王博", @"张佳乔", @"董凯睿", nil];
    _classArray = [NSMutableArray arrayWithObjects:@"电子厂A班", @"汽车厂B班", @"拧螺丝B班", @"包工头S班", @"电子厂A班", @"电子厂A班", @"拧螺丝B班", nil];
    _grateArray = [NSMutableArray arrayWithObjects:@"66", @"97", @"140", @"531", @"184", @"211", @"985", nil];
    _peopleNumber = 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _peopleNumber;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell* firstCell = [_mainTableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
    firstCell.nameLabel.text = _nameArray[indexPath.row];
    firstCell.classLabel.text = _classArray[indexPath.row];
    firstCell.grateLabel.text = _grateArray[indexPath.row];
    
    return firstCell;
}

- (void)pressAddButton {
    AddViewController* addViewController = [[AddViewController alloc] init];
    addViewController.delegate = self;
    addViewController.addNameArray = _nameArray;
    addViewController.addClassArray = _classArray;
    addViewController.addGrateArray = _grateArray;
    addViewController.addPeopleNumber = _peopleNumber;
    [self presentViewController:addViewController animated:YES completion:nil];
}

- (void)pressDeleteButton {
    DeleteViewController* deleteViewController = [[DeleteViewController alloc] init]; 
    deleteViewController.delegate = self;
    deleteViewController.deleteNameArray = _nameArray;
    deleteViewController.deleteClassArray = _classArray;
    deleteViewController.deleteGrateArray = _grateArray;
    deleteViewController.deletePeopleNumber = _peopleNumber;
    [self presentViewController:deleteViewController animated:YES completion:nil];
}

- (void)pressChangeButton {
    ChangeViewController* changeViewController = [[ChangeViewController alloc] init];
    changeViewController.delegate = self;
    changeViewController.changeNameArray = _nameArray;
    changeViewController.changeClassArray = _classArray;
    changeViewController.changeGrateArray = _grateArray;
    changeViewController.changePeopleNumber = _peopleNumber;
    [self presentViewController:changeViewController animated:YES completion:nil];
}

- (void)pressSearchButton {
    SearchViewController* searchViewController = [[SearchViewController alloc] init];
    searchViewController.searchNameArray = _nameArray;
    searchViewController.searchClassArray = _classArray;
    searchViewController.searchGrateArray = _grateArray;
    searchViewController.searchPeopleNumber = _peopleNumber;
    [self presentViewController:searchViewController animated:YES completion:nil];
}

- (void)pressSortButton {
    SortViewController* sortViewController = [[SortViewController alloc] init];
    sortViewController.sortNameArray = _nameArray;
    sortViewController.sortClassArray = _classArray;
    sortViewController.sortGrateArray = _grateArray;
    [self presentViewController:sortViewController animated:YES completion:nil];
}

- (void)pressExitButtonButton {
    exit(0);
}

- (void)sendPeopleNumber:(NSInteger)addPeopleNumber nameArray:(NSMutableArray*_Nullable)addNameArray classArray:(NSMutableArray*_Nullable)addClassArray grateArray:(NSMutableArray*_Nullable)addGrateArray {
    
    _peopleNumber = addPeopleNumber;
    _nameArray = addNameArray;
    _classArray = addClassArray;
    _grateArray = addGrateArray;
    
    [_mainTableView reloadData];
}

- (void)deleteSendPeopleNumber:(NSInteger)deletePeopleNumber nameArray:(NSMutableArray*_Nullable)deleteNameArray classArray:(NSMutableArray*_Nullable)deleteClassArray grateArray:(NSMutableArray*_Nullable)deleteGrateArray {
    
    _peopleNumber = deletePeopleNumber;
    _nameArray = deleteNameArray;
    _classArray = deleteClassArray;
    _grateArray = deleteGrateArray;
    
    [_mainTableView reloadData];
}

- (void)changeSendGrateArray:(NSMutableArray*_Nullable)changeGrateArray {
    
    _grateArray = changeGrateArray;
    [_mainTableView reloadData];
}
@end
