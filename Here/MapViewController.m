//
//  MapViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/30/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
#import <AVFoundation/AVFoundation.h>
#import "SpokenWord.h"
#import "LocationAnnotation.h"
@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *annotations;
@property (nonatomic, retain) MKPolyline *route;
@property (nonatomic, retain) MKPolylineView *routeView;
@property (nonatomic, strong) NSArray *playerPositions;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) NSArray *utterers;
@property (weak, nonatomic) IBOutlet UIButton *godButton;
@property (nonatomic) CGPoint center;
@end

@implementation MapViewController


-(NSArray *)utterers
{
    if(!_utterers){
        _utterers = [SpokenWord getSpeeches];
    }
    return _utterers;
}
-(AVSpeechSynthesizer *)synthesizer
{
    if(!_synthesizer){
        _synthesizer =[[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}
- (IBAction)speak:(UIButton *)sender {
    if(!self.synthesizer.isSpeaking){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger location = [defaults integerForKey:@"location"];
        
        AVSpeechUtterance *utterance = [self.utterers objectAtIndex:location - 1];
        [self.synthesizer speakUtterance:utterance];
    }
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    [UIView animateWithDuration:2.0 animations:^{
        self.godButton.center = CGPointMake(self.center.x, 0 - self.godButton.frame.size.height / 2);
    }completion:^(BOOL finished){
        if (finished) {
            
        }}];
}

- (NSArray *) playerPositions
{
    if(!_playerPositions)
    {
        NSMutableArray *mutablePlayerPositions = [[NSMutableArray alloc] initWithCapacity:[self.annotations count]];
        for(NSInteger i = 0; i < self.annotations.count; i++){
            NSNumber *time = [[NSNumber alloc] initWithDouble:0.0];
            [mutablePlayerPositions addObject:time];
        }
        _playerPositions = mutablePlayerPositions;
    }
    return _playerPositions;
}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    if(overlay == self.route)
    {
        if(!self.routeView)
        {
            self.routeView = [[MKPolylineView alloc] initWithPolyline:self.route];
            self.routeView.fillColor = [UIColor redColor];
            self.routeView.strokeColor = [UIColor redColor];
            self.routeView.lineWidth = 5;
        }
        
        return self.routeView;
    }
    
    return nil;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //if (![defaults integerForKey:@"location"])[defaults setInteger:1 forKey:@"location"];
    [defaults setInteger:1 forKey:@"location"];
    [self updateAnnotations];
    self.center = self.godButton.center;
}

- (void)setMapView:(MKMapView *)mapView
{
    _mapView = mapView;
    
    mapView.delegate = self;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //if (![defaults integerForKey:@"location"])[defaults setInteger:1 forKey:@"location"];
    [defaults setInteger:1 forKey:@"location"];
    [self updateAnnotations];
}
- (void)updateAnnotations
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger location = [defaults integerForKey:@"location"];
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    for (int i = 0; i < location; i++){
        [self.mapView addAnnotation:self.annotations[i]];
        [self.mapView showAnnotations:self.mapView.annotations animated:YES];
    }
    
    if(location > 1){
        [self.mapView removeOverlays:self.mapView.overlays];
        self.routeView = nil;
        CLLocationCoordinate2D coordinateArray[location];
        for(int i = 0; i < location; i ++){
            LocationAnnotation *annotation = self.annotations[i];
            coordinateArray[i] =  annotation.coordinate;
        }
        self.route = [MKPolyline polylineWithCoordinates:coordinateArray count:location];
        [self.mapView addOverlay:self.route];
    }
}

-(NSArray *)annotations
{
    if(!_annotations){
        _annotations = [Location getAnnotations];
    }
    return _annotations;
}


-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
    view.canShowCallout = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UIImage *image = [UIImage imageNamed:@"play@2x.png"];
    [button setImage:image forState:UIControlStateNormal];
    view.rightCalloutAccessoryView = button;
    
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSInteger audioPlayerIndex = 0;
    for(LocationAnnotation *ann in self.annotations){
        if(player.url == ann.soundFile){
            audioPlayerIndex = [self.annotations indexOfObject:ann];
            break;
        }
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger location = [defaults integerForKey:@"location"];
    
    if([self.annotations count] > location && audioPlayerIndex == (location - 1)){
        [defaults setInteger:location+1 forKey:@"location"];
        [self updateAnnotations];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"You have new messages, photos, and voicemails" delegate:nil cancelButtonTitle:@"Dope" otherButtonTitles: nil];
        [alertView show];
        [self.godButton setTitle:[NSString stringWithFormat:@"Chapter %ld", location + 1] forState:UIControlStateNormal];
        [UIView animateWithDuration:2.0 animations:^{
            self.godButton.center = self.center;
        }completion:^(BOOL finished){
            if (finished) {
                
            }}];
    }

}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    if([view.annotation isKindOfClass:[LocationAnnotation class]]){
        LocationAnnotation *locationAnnotation  = (LocationAnnotation *)view.annotation;
        NSError *error;
        if(self.player){
            NSMutableArray *positions = [[NSMutableArray alloc] initWithArray:self.playerPositions];
            
            if (self.player.url == locationAnnotation.soundFile)
            {
                if(self.player.isPlaying){
                    [self.player pause];
                }else{
                    [self.player play];
                }
            }else{
                NSInteger curr_index = [self.annotations indexOfObject:locationAnnotation];
                NSInteger last_index = 0;
                for(LocationAnnotation *ann in self.annotations){
                    if(self.player.url == ann.soundFile){
                        last_index = [self.annotations indexOfObject:ann];
                        break;
                    }
                }
                [positions replaceObjectAtIndex:last_index withObject:[[NSNumber alloc] initWithDouble:self.player.currentTime]];
                
                self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:locationAnnotation.soundFile error:&error];
                 self.player.delegate = self;
                
                NSNumber *time = positions[curr_index];
                
                [self.player setCurrentTime:[time doubleValue]];
                [self.player play];
            }
            self.playerPositions = positions;
        }else{
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:locationAnnotation.soundFile error:&error];
            self.player.delegate = self;
            [self.player play];
        }
    }
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[LocationAnnotation class]]){
        LocationAnnotation *locationAnnotation  = (LocationAnnotation *)annotation;
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"locations"];
        
        if (!annotation){
            annotationView = locationAnnotation.annotationView;
        }else{
            annotationView.annotation = annotation;
        }
        return annotationView;
    }
    return nil;
}


@end
