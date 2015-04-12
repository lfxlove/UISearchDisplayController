//
//  ViewController.m
//  UISearchDisplayController
//
//  Created by Mac on 15/3/31.
//  Copyright (c) 2015年 我爱你. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *table=[[UITableView alloc] initWithFrame:self.view.frame];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
    UISearchBar *searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 40)];
    searchBar.autocapitalizationType=UITextAutocapitalizationTypeWords;
    searchBar.autocorrectionType=UITextAutocorrectionTypeYes;
    searchBar.delegate=self;
    table.tableHeaderView=searchBar;
    
    UISearchDisplayController *displayController=[[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    displayController.searchResultsDataSource=self;
    displayController.searchResultsDelegate=self;
    displayController.delegate=self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
