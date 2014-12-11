//
//  MapViewController.h
//  Here
//
//  Created by Joshua J Coronado on 5/30/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol MapViewControllerDelegate; 
@interface MapViewController : UIViewController <AVAudioPlayerDelegate, AVSpeechSynthesizerDelegate>
@property (nonatomic, weak) id <MapViewControllerDelegate> delegate;
@end

@protocol MapViewControllerDelegate <NSObject>


@end
