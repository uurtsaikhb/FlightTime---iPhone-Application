//
//  FlightListCell.m
//  Tabbar Demo
//
//  Created by Uurtsaikh Batbileg on 12/11/13.
//  Copyright (c) 2013 Uurtsaikh Batbileg. All rights reserved.
//

#import "FlightListCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FlightListCell

@synthesize logo, voyage_number, direction, takeOffTime, landedTime, status, line;

static float space = 10.0f;
static float imageSize = 60.0f;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [FlightTool colorFromHexString:@"f3f3f3"];
        
        UIView * background = [[UIView alloc] initWithFrame:CGRectMake(3, 3, self.frame.size.width - 6, 80 - 6)];
        background.backgroundColor = [ UIColor whiteColor];
        [background.layer setCornerRadius:3.0f];
        
        
        [background.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [background.layer setBorderWidth:0.15f];
        
        // drop shadow
        [background.layer setShadowColor:[UIColor blackColor].CGColor];
        [background.layer setShadowOpacity:0.15];
        [background.layer setShadowRadius:1.0];
        [background.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
        [self addSubview:background];
        
        
        logo = [[UIImageView alloc] initWithFrame:CGRectMake(space, space, imageSize, imageSize)];
        [self addSubview:logo];
        
        
        voyage_number = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize, space, 110	, 24)];
        voyage_number.font = [UIFont fontWithName:@"HelveticaNeue" size:24];
        voyage_number.textColor = [FlightTool colorFromHexString:@"1ba7e3"];
        [self addSubview:voyage_number];
        
        
#pragma direciton
        
        direction = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize, 33, 200, 14)];
        direction.textColor = [FlightTool colorFromHexString:@"6F6F70"];
        direction.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        [self addSubview:direction];
               
        
        
        status = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize + 110, 55, 100, 14)];
        status.textColor = [FlightTool colorFromHexString:@"F57E1D"];
        status.font = [UIFont fontWithName:@"HelveticaNeue" size:9];
        status.textAlignment = NSTextAlignmentRight;
        [self addSubview:status];
        
        takeOffTime = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize, 55, 40, 14)];
        takeOffTime.textColor = [FlightTool colorFromHexString:@"1ba7e3"];
        takeOffTime.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        [self addSubview:takeOffTime];
        
        landedTime = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize + 50 , 55, 40, 14)];
        landedTime.textColor = [FlightTool colorFromHexString:@"1ba7e3"];
        landedTime.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        [self addSubview:landedTime];
        
        line = [[UILabel alloc] initWithFrame:CGRectMake((space*2) + imageSize + 23 , 55, 40, 14)];
        line.textColor = [FlightTool colorFromHexString:@"1ba7e3"];
        line.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        line.textAlignment = NSTextAlignmentCenter;
        [self addSubview:line];
        
        
        UIImage *accessoryImage = [UIImage imageNamed:@"arrow.png"];
        UIImageView *accImageView = [[UIImageView alloc] initWithImage:accessoryImage];
        accImageView.userInteractionEnabled = YES;
        [accImageView setFrame:CGRectMake(0, 0, 12.0, 16.0)];
        self.accessoryView = accImageView;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
