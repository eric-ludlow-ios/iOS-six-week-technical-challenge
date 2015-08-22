//
//  MatchedViewTableViewDataSource.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "List.h"

typedef NS_ENUM(NSInteger, MatchedViewMatchType) {
    MatchedViewMatchTypeAssign = 0,
    MatchedViewMatchTypePair = 1,
    MatchedViewMatchTypeToList = 2,
    MATCHED_VIEW_MATCH_TYPE_COUNT
};

@interface MatchedViewTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *randomArray;
@property (nonatomic) MatchedViewMatchType matchType;
@property (strong, nonatomic) List *list;

@end
