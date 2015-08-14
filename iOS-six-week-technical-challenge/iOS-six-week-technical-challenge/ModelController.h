//
//  ModelController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"
#import "Item.h"

typedef NS_ENUM(NSInteger, MatchedViewMatchType) {
    MatchedViewMatchTypeAssign = 0,
    MatchedViewMatchTypePair = 1,
    MatchedViewMatchTypeToList = 2,
    MATCHED_VIEW_MATCH_TYPE_COUNT
};

@interface ModelController : NSObject

@property (strong, nonatomic, readonly) NSArray *allLists;
@property (strong, nonatomic, readonly) NSArray *currentItems;
@property (strong, nonatomic) List *currentList;

@property (nonatomic) MatchedViewMatchType matchType;

+ (ModelController *)sharedInstance;

- (List *)createList;

- (Item *)createItem;

- (void)save;

- (void)removeList:(List *)list;

- (void)removeItem:(Item *)item;

@end
