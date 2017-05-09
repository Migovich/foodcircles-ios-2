//
//  FCSMultilineCell.m
//  FoodCircles
//
//  Created by Simon Gislen on 09/09/13.
//  Copyright (c) 2013 FoodCircles. All rights reserved.
//

#import "FCSMultilineCell.h"

@implementation FCSMultilineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSMutableAttributedString *s;
    s = [[NSMutableAttributedString alloc] initWithString:self.mainLabel.text];
    [s addAttribute:NSKernAttributeName
              value:[NSNull null]
              range:NSMakeRange(0, s.length)];
    self.mainLabel.attributedText = s;
    self.mainLabel.font = [UIFont systemFontOfSize:16];
    self.mainLabel.lineBreakMode = NSLineBreakByTruncatingTail;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
