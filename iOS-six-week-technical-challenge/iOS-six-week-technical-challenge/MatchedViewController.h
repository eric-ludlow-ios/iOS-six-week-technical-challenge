//
//  MatchedViewController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"


@protocol MatchedViewControllerDelegate;


@interface MatchedViewController : UIViewController

@property (weak, nonatomic) id<MatchedViewControllerDelegate> delegate;
@property (strong, nonatomic) List *list;
@property (strong, nonatomic) NSString *currentTitle;

@end


@protocol MatchedViewControllerDelegate <NSObject>

- (void)matchedViewControllerDidFinish:(MatchedViewController *)matchedViewController;

@end