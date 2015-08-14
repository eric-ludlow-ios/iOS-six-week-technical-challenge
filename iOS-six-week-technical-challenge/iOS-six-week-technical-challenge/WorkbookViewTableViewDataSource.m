//
//  WorkbookViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "WorkbookViewTableViewDataSource.h"
#import "ModelController.h"
#import "List.h"

@implementation WorkbookViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [ModelController sharedInstance].allLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *listCell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    List *list = [ModelController sharedInstance].allLists[indexPath.row];
    
    listCell.textLabel.text = list.nameOfList;
    
    return listCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    List *list = [ModelController sharedInstance].allLists[indexPath.row];
    [[ModelController sharedInstance] removeList:list];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


@end
