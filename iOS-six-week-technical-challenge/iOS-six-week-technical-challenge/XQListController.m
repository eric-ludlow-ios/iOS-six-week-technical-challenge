//
//  XQListController.m
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import "XQListController.h"
#import "Stack.h"

@interface XQListController ()

@property (strong, nonatomic) NSArray *allLists;

@end


@implementation XQListController

+ (XQListController *)sharedInstance {
    static XQListController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [XQListController new];
    });
    
    return sharedInstance;
}

- (XQList *)createList {
    
    XQList *list = [NSEntityDescription insertNewObjectForEntityForName:@"XQList"
                                                 inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    return list;
}

- (NSArray *)allLists {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"XQList"];
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

- (void)save {
    
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (void)removeList:(XQList *)list {
    
    [list.managedObjectContext deleteObject:list];
}

@end

