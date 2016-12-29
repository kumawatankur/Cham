//
//  Home.m
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "Home.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"


@interface Home ()
{
    NSArray *imageUrlArray;
    UIActivityIndicatorView *spinner;
   
}


@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyAppDeviceToken"];
//    NSLog(@"device token in controller: %@ ", deviceToken);
//    self.txtx.text=deviceToken;
   

    
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    [HUD show:YES];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(170, 375);
    spinner.transform = CGAffineTransformMakeScale(4.0, 4.0);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];

    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_slider.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];

 
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [response appendData:data];
    NSLog(@"error receving data %@",response);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error;
    
    NSLog(@"Error in receiving data %@",error);
   // [HUD show: YES];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray* results = [json objectForKey:@"status"];
  imageUrlArray = [results valueForKey:@"slider_image_path"];
    NSLog(@"images %@",imageUrlArray);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
    
   NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    for (NSString *strImageUrl in imageUrlArray) {
        [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
    }

    dispatch_sync(dispatch_get_main_queue(), ^{
    
    self.imageview.animationImages = arrayImages;
    _imageview.animationDuration = 10;
    _imageview.animationRepeatCount = 0;
    [_imageview startAnimating];
    //  [HUD hide: YES];
        [spinner stopAnimating];

    });
        
        
    });
}
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    NSError *error;
//    
//    NSLog(@"Error in receiving data %@",error);
//    // [HUD show: YES];
//    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
//    NSLog(@"response data %@",json);
//    
//    NSArray* results = [json objectForKey:@"status"];
//    imageUrlArray = [results valueForKey:@"slider_image_path"];
//    NSLog(@"images %@",imageUrlArray);
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
//    dispatch_async(queue, ^{
//        
//        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
//                                                                    self.view.frame.size.width,
//                                                                    self.view.frame.size.height)];
//        scrollView.pagingEnabled = YES;
//        [scrollView setAlwaysBounceVertical:NO];
//        //setup internal views
//        
//       
////           NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
////        
////            for (NSString *strImageUrl in imageUrlArray) {
////                [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
////            }
//       
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            
//            int numberOfViews=[imageUrlArray count];
//            
//            
//            for (int i = 0; i < numberOfViews; i++) {
//                CGFloat xOrigin = i * self.view.frame.size.width;
//             UIImageView *image = [[UIImageView alloc] initWithFrame:
//                                      CGRectMake(xOrigin, 0,
//                                                 self.view.frame.size.width,
//                                                 self.view.frame.size.height)];
//                
//                NSDictionary *currentObject=[imageUrlArray objectAtIndex:i];
//                // NSString *userName=[currentObject objectForKey:@"username"];
//                UIImage*img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:currentObject]]];
//                
//                image.image = img, i+1;
//                image.contentMode = UIViewContentModeScaleAspectFit;
//                [scrollView addSubview:image];
//            }
//            //set the scroll view content size
//            scrollView.contentSize = CGSizeMake(self.view.frame.size.width *
//                                                numberOfViews,
//                                                self.view.frame.size.height);
//            //add the scrollview to this view
//            [self.view addSubview:scrollView];
//            
//            [spinner stopAnimating];
//            
//        });
//        
//        
//    });
//}







@end
