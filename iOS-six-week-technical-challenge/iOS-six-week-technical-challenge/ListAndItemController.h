//
//  ListAndItemController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"
#import "Item.h"

@interface ListAndItemController : NSObject

@property (strong, nonatomic, readonly) NSArray *allLists;
@property (strong, nonatomic, readonly) NSArray *currentItems;
@property (strong, nonatomic) List *currentList;


+ (ListAndItemController *)sharedInstance;

- (List *)createList;

- (Item *)createItem;

- (void)save;

- (void)removeList:(List *)list;

- (void)removeItem:(Item *)item;

@end
