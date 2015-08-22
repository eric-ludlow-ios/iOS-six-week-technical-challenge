//
//  ListViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ItemsViewTableViewDataSource.h"
#import "ListAndItemController.h"
#import "List.h"
#import "Item.h"

@implementation ItemsViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.list.myItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    
    //to delete:
    //NSArray *itemArray = [ListAndItemController sharedInstance].currentItems;
    
    Item *item = self.list.myItems[indexPath.row];
    
    itemCell.textLabel.text = item.nameOfItem;
    
    return itemCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Item *item = self.list.myItems[indexPath.row];
    
    [[ListAndItemController sharedInstance] removeItem:item];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end

 