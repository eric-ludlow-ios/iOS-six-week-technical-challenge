//
//  XQListController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XQList.h"

@interface XQListController : NSObject

@property (strong, nonatomic, readonly) NSArray *allLists;

+ (XQListController *)sharedInstance;

- (XQList *)createList;

- (void)save;

- (void)removeList:(XQList *)list;

@end
