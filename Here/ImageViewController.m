//
//  ImageViewController.m
//  Here
//
//  Created by Joshua J Coronado on 5/21/14.
//  Copyright (c) 2014 Stanford University. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation ImageViewController

- (UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc] init];
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
    
    self.imageView.image = self.image;
    [self.imageView sizeToFit];
    [self.scrollView addSubview:self.imageView];
}

#pragma mark - Properties

- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = .05;
    _scrollView.zoomScale = 1;
      _scrollView.delegate = self;
    self.scrollView.contentSize = self.image ? self.image.size : CGSizeZero;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


@end
