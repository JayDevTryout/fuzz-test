//
//  ImageTableViewCell.h
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuzzData.h"

@interface ImageTableViewCell : UITableViewCell <ImageFetchProtocol>

@property (nonatomic, weak) FuzzData *data;

@property (nonatomic, strong) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *loader;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;

@end
