//
//  LocationAnnotation.m
//  Here
//
//  Created by Joshua J Coronado on 6/2/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "LocationAnnotation.h"

@implementation LocationAnnotation
-(instancetype)initWithTitle:(NSString *)title subtitle:(NSString*)subtitle coordinate:(CLLocationCoordinate2D)coordinate andSoundFile:(NSString *)fileName andFileType:(NSString *)fileType
{
    self = [super init];
    if(self) {
        self.soundFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:fileName ofType:fileType]];
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = coordinate;
    }
    return self;
}

-(MKAnnotationView*)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"locations"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}



@end
