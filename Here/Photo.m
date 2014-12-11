//
//  Photo.m
//  Here
//
//  Created by Joshua J Coronado on 6/2/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+(NSArray *)start
{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [photos addObject:[UIImage imageNamed:@"IMG_3050.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3051.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3052.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3060.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3064.JPG"]];
    return photos;
}

+(NSArray *)lakePhotos
{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [photos addObject:[UIImage imageNamed:@"IMG_3301.JPG"]];
    return photos;
}

+(NSArray *)trailPhotos
{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [photos addObject:[UIImage imageNamed:@"IMG_3302.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3303.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3304.JPG"]];
    return photos;
}

+(NSArray *)lookoutPhotos
{
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    [photos addObject:[UIImage imageNamed:@"IMG_3305.JPG"]];
    [photos addObject:[UIImage imageNamed:@"IMG_3306.JPG"]];
    return photos;
}

+(NSArray *)getPhotos
{
    NSMutableArray *photos = [[NSMutableArray alloc] initWithArray:[self start]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger location = [defaults integerForKey:@"location"];
    if(location > 1){
        [photos addObjectsFromArray:[self lakePhotos]];
        if(location > 2){
            [photos addObjectsFromArray:[self trailPhotos]];
            if(location > 3){
                [photos addObjectsFromArray:[self lookoutPhotos]];
            }
        }
    }
    
    
    return photos;
}
@end
