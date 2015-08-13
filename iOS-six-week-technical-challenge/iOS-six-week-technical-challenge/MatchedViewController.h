//
//  MatchedViewController.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQList.h"


@protocol MatchedViewControllerDelegate;


@interface MatchedViewController : UIViewController

@property (weak, nonatomic) id<MatchedViewControllerDelegate> delegate;
@property (strong, nonatomic) XQList *list;

@end


@protocol MatchedViewControllerDelegate <NSObject>

- (void)matchedViewControllerDidFinish:(MatchedViewController *)matchedViewController;

@end