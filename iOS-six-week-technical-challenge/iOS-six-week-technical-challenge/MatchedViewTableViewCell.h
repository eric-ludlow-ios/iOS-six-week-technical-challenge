//
//  MatchedViewTableViewCell.h
//  iOS-six-week-technical-challenge
//
//  Created by Rutan on 8/12/15.
//  Copyright (c) 2015 Eric Ludlow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchedViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leadingLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *trailingLabel;

@end
