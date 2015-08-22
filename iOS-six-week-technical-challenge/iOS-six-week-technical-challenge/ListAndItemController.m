//
//  ListAndItemController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "ListAndItemController.h"
#import "Stack.h"

@interface ListAndItemController ()

@property (strong, nonatomic) NSArray *allLists;
@property (strong, nonatomic) NSArray *currentItems;

@end


@implementation ListAndItemController

+ (ListAndItemController *)sharedInstance {
    static ListAndItemController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ListAndItemController new];
    });
    
    return sharedInstance;
}

- (List *)createList {
    
    List *list = [NSEntityDescription insertNewObjectForEntityForName:@"List"
                                                 inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    return list;
}

- (Item *)createItem {
    
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
                                                     inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    return item;
}

- (NSArray *)allLists {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"List"];
    //maybe set some predicates
    //maybe set sort property
    
    NSError *error;
    
    NSArray *lists = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request
                                                                                error:&error];
    if (error) {
        NSLog(@"Error fetching objects: %@", error.localizedDescription);
    }
    return lists;
}

- (NSArray *)currentItems {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"myList == %@", self.currentList];
    request.predicate = predicate;
    
    NSError *error;
    
    NSArray *items = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request
                                                                                error:&error];
    if (error) {
        NSLog(@"Error fetching objects: %@", error.localizedDescription);
    }
    
    return items;
}

- (void)save {
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (void)removeList:(List *)list {
    
    [list.managedObjectContext deleteObject:list];
    [self save];
}

- (void)removeItem:(Item *)item {
    
    [item.managedObjectContext deleteObject:item];
    [self save];
}

@end

