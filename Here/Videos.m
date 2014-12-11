//
//  Videos.m
//  Here
//
//  Created by Joshua J Coronado on 6/2/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Videos.h"

@implementation Videos
+(NSArray *)start
{
    NSMutableArray *videos = [[NSMutableArray alloc] init];
    [videos addObject:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                  pathForResource:@"movie"
                                                  ofType:@"mov"]]];
    return videos;
}

+(NSArray *)lakevideos
{
    NSMutableArray *videos = [[NSMutableArray alloc] init];
    [videos addObject:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                              pathForResource:@"AtlasSound"
                                              ofType:@"mov"]]];
    return videos;
}

+(NSArray *)trailvideos
{
    NSMutableArray *videos = [[NSMutableArray alloc] init];
    [videos addObject:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                              pathForResource:@"crashtest"
                                              ofType:@"mov"]]];

    return videos;
}

+(NSArray *)lookoutvideos
{
    NSMutableArray *videos = [[NSMutableArray alloc] init];
    [videos addObject:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                              pathForResource:@"countdown15"
                                              ofType:@"mov"]]];


    return videos;
}
+(NSArray *)getVideos
{
    NSMutableArray *videos = [[NSMutableArray alloc] initWithArray:[self start]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger location = [defaults integerForKey:@"location"];
    if(location > 1){
        [videos addObjectsFromArray:[self lakevideos]];
        if(location > 2){
            [videos addObjectsFromArray:[self trailvideos]];
            if(location > 3){
                [videos addObjectsFromArray:[self lookoutvideos]];
            }
        }
    }
    return videos;
}
@end
