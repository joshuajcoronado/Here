//
//  VideoCollectionViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/21/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "VideoCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "Videos.h"
@interface VideoCollectionViewController ()
@property (strong, nonatomic) NSArray *videoURLs;
@property (strong, nonatomic) MPMoviePlayerViewController *moviePlayer;
@end

@implementation VideoCollectionViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _videoURLs = nil;
    _moviePlayer = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _videoURLs = nil;
    [self.collectionView reloadData];
}

- (NSArray *)videoURLs
{
    if (!_videoURLs)
    {
        _videoURLs = [Videos getVideos];
    }
    return _videoURLs;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videoURLs.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.moviePlayer = [[MPMoviePlayerViewController
                         alloc]initWithContentURL:self.videoURLs[indexPath.row]];
    [self presentMoviePlayerViewControllerAnimated:self.moviePlayer];
}

//I had trouble implementing a good way to pull thumbnails from videos.  Searching online brought me here to
//http://stackoverflow.com/questions/10612634/is-there-any-way-other-than-thumbnail-method-to-take-a-screenshot-of-an-video-in I understand what's going on, but it would've taken me hours to figure this out (as of writing this, we didn't go over AVAsset so instead of doing my best to hide the help, I'm just going to cite Nikhil Bansal's wonderful response.
- (UIImage *)imageFromVideoURL:(NSURL*)videoURL
{
    UIImage *image = nil;
    AVAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];;
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    imageGenerator.appliesPreferredTrackTransform = YES;
    
    Float64 durationSeconds = CMTimeGetSeconds([asset duration]);
    CMTime midpoint = CMTimeMakeWithSeconds(durationSeconds/2.0, 600);
    
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef halfWayImage = [imageGenerator copyCGImageAtTime:midpoint actualTime:&actualTime error:&error];
    
    if (halfWayImage != NULL)
    {
        image = [[UIImage alloc] initWithCGImage:halfWayImage];
        CGImageRelease(halfWayImage);
    }
    return image;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Video" forIndexPath:indexPath];
    if (!photoCell)
        photoCell = [[PhotoCollectionViewCell alloc] init];
    photoCell.imageView.image = [self imageFromVideoURL:self.videoURLs[indexPath.row]];
    
    return photoCell;
}



@end