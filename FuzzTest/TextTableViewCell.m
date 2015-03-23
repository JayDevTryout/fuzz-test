//
//  TextTableViewCell.m
//  FuzzTest
//
//  Created by j on 3/22/15.
//  Copyright (c) 2015 j. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

-(void) prepareForReuse
{
    _txtLabel.text = @"";
    _dateLabel.text = @"";
}

@end
