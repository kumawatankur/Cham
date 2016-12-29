//
//  Full_picture.m
//  chamber
//
//  Created by ankur kumawat on 09/09/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "Full_picture.h"

@interface Full_picture ()

@end

@implementation Full_picture

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"images ankur %@",_uid_value);
    // Do any additional setup after loading the view.
   
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_uid_value]];
    _recipeImageView.image = [UIImage imageWithData:imageData];
    
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 6.0;
    self.scrollView.contentSize = self.recipeImageView.frame.size;
    self.scrollView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.recipeImageView;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
}


@end
