//
//  ListViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewTableViewDataSource.h"
#import "ModelController.h"
#import "List.h"
#import "Item.h"

@implementation ListViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *itemArray = [ModelController sharedInstance].currentItems;
    
    return itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    
    NSArray *itemArray = [ModelController sharedInstance].currentItems;
    
    Item *item = itemArray[indexPath.row];
    
    itemCell.textLabel.text = item.nameOfItem;
    
    return itemCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Item *item = [ModelController sharedInstance].currentItems[indexPath.row];
    
    [[ModelController sharedInstance] removeItem:item];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end

 