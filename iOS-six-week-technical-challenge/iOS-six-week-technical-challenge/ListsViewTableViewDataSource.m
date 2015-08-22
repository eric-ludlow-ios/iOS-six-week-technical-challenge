//
//  WorkbookViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListsViewTableViewDataSource.h"
#import "ListAndItemController.h"
#import "List.h"

@implementation ListsViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [ListAndItemController sharedInstance].allLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    List *list = [ListAndItemController sharedInstance].allLists[indexPath.row];
    
    listCell.textLabel.text = list.nameOfList;
    
    return listCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    List *list = [ListAndItemController sharedInstance].allLists[indexPath.row];
    [[ListAndItemController sharedInstance] removeList:list];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


@end
