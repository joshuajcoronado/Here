//
//  PhotoCollectionViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/26/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "ImageViewController.h"
#import "PhotoCollectionViewCell.h"
#import "Photo.h"
@interface PhotoCollectionViewController ()
@property (strong, nonatomic) NSArray *photos;
@end

@implementation PhotoCollectionViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    _photos = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _photos = nil;
    [self.collectionView reloadData];
}


- (NSArray *)photos
{
    if(!_photos){
        _photos = [Photo getPhotos];
    }
    return  _photos;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo" forIndexPath:indexPath];
    if (!photoCell)
        photoCell = [[PhotoCollectionViewCell alloc] init];
    
    photoCell.imageView.image = self.photos [indexPath.row];
    return photoCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[PhotoCollectionViewCell class]]) {
        indexPath = [self.collectionView indexPathForCell:sender];
    }
    
    id destVC = segue.destinationViewController;
    if (indexPath && [destVC isKindOfClass:[ImageViewController class]]) {
        if ([segue.identifier isEqualToString:@"ViewPhoto"]) {
            ImageViewController *imageVC = (ImageViewController *)destVC;
            imageVC.image = self.photos[indexPath.row];
        }
    }
}



@end
