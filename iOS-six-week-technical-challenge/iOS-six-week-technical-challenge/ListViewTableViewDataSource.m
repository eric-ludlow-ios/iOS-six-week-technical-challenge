//
//  ListViewTableViewDataSource.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListViewTableViewDataSource.h"
#import "XQListController.h"
#import "XQList.h"
#import "XQEntity.h"

@implementation ListViewTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    XQList *list = [XQListController sharedInstance].allLists[self.listIndex];
//    
//    return list.listEntities.count;
    
    
    return [self fakeData].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *entityCell = [tableView dequeueReusableCellWithIdentifier:@"entityCell"];
    
//    XQList *list = [XQListController sharedInstance].allLists[self.listIndex];
//    
//    XQEntity *entity = list.listEntities[indexPath.row];
//    
//    entityCell.textLabel.text = entity.nameOfEntity;
    
    entityCell.textLabel.text = [self fakeData][indexPath.row];
    
    return entityCell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    XQList *list = [XQListController sharedInstance].allLists[self.listIndex];
//    XQEntity *entity = list.listEntities[indexPath.row];
//    
//    [list removeListEntitiesObject:entity];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSArray *)fakeData {
    
    return @[@"student 1", @"student 2", @"student 3", @"student 4", @"student 5"];
}

@end

 