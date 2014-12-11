//
//  LocationAnnotation.h
//  Here
//
//  Created by Joshua J Coronado on 6/2/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationAnnotation : NSObject <MKAnnotation>
-(instancetype)initWithTitle:(NSString *)title subtitle:(NSString*)subtitle  coordinate:(CLLocationCoordinate2D)coordinate andSoundFile:(NSString *)fileName andFileType:(NSString *)fileType;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (strong, nonatomic)NSURL *soundFile;
@property (nonatomic) CLLocationCoordinate2D coordinate;
-(MKAnnotationView*)annotationView;
@end
