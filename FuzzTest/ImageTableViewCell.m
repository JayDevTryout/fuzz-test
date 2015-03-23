//
//  ImageTableViewCell.m
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

-(void) prepareForReuse
{
    _data.delegate = nil;
    _imgView.image = nil;
    _loader.alpha = 1;
    _dateLabel.text = @"";
}

#pragma mark - ImageFetchedProtocol

-(void) imageFetched:(UIImage *)image
{
    _imgView.image = image;
    _loader.alpha = 0;
}

@end
