//
//  Location.m
//  Here
//
//  Created by Joshua J Coronado on 5/30/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "Location.h"
#import "LocationAnnotation.h"
@implementation Location

+(NSArray *)getAnnotations
{
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D pathBeginningCoordinate;
    pathBeginningCoordinate.latitude =37.364854;
    pathBeginningCoordinate.longitude =  -122.174669;
    LocationAnnotation *startAnnotation = [[LocationAnnotation alloc] initWithTitle:@"Chapter I" subtitle:@"Here again?" coordinate:pathBeginningCoordinate andSoundFile:@"01 Intro" andFileType:@"mp3"];
    [annotations addObject:startAnnotation];
    
    CLLocationCoordinate2D lakeCoordinate;
    lakeCoordinate.latitude = 37.364121;
    lakeCoordinate.longitude = -122.177555;
    LocationAnnotation *lakeAnnotation = [[LocationAnnotation alloc] initWithTitle:@"Chapter II" subtitle:@"Things are things" coordinate:lakeCoordinate andSoundFile:@"03 Solar Powered [Intro]" andFileType:@"mp3"];
    [annotations addObject:lakeAnnotation];

    CLLocationCoordinate2D trailCoordinate;
    trailCoordinate.latitude = 37.364508;
    trailCoordinate.longitude = -122.179315;
    LocationAnnotation *trailAnnotation = [[LocationAnnotation alloc] initWithTitle:@"Chapter III"  subtitle:@"God and other things" coordinate:trailCoordinate andSoundFile:@"06 Certain Things (Interlude)" andFileType:@"mp3"];
    [annotations addObject:trailAnnotation];
    
    CLLocationCoordinate2D lookoutCoordinate;
    lookoutCoordinate.latitude = 37.365933;
    lookoutCoordinate.longitude = -122.180145;
    LocationAnnotation *lookoutAnnotation = [[LocationAnnotation alloc] initWithTitle:@"Chapter IV" subtitle:@"Here again." coordinate:lookoutCoordinate andSoundFile:@"06 Explanation Mark" andFileType:@"m4a"];
    [annotations addObject:lookoutAnnotation];
    
    return annotations;
}




@end
