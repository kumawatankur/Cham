//
//  SecondHome.m
//  chamber
//
//  Created by SSMAC100 on 09/06/16.
//  Copyright © 2016 SSMAC100. All rights reserved.
//

#import "SecondHome.h"
#import "UIImageView+WebCache.h"
#import "CKDemoViewController.h"
#import "MBProgressHUD.h"

@interface SecondHome ()
{
    NSArray*picarray;
    NSArray*date;
    NSArray*title;
    NSArray*img;
    NSMutableArray*des;
    NSArray*evnt_ary;
    NSArray*timeary;
    
       int globalCounter;
     UIActivityIndicatorView *spinner;
}

@end

@implementation SecondHome


- (void)viewDidLoad {
    [super viewDidLoad];
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.center = CGPointMake(170, 350);
    spinner.transform = CGAffineTransformMakeScale(4.0, 4.0);
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];

    
    
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    [HUD show:YES];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background2.png"] forBarMetrics:UIBarMetricsDefault];
  
    
    
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://hispanicchamberfw.com/ws/fetch_event.php"]];
    response =[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:req delegate:self];
    

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
  //  [HUD show: YES];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves  error:&error];
    NSLog(@"response data %@",json);
    
    NSArray *results = [json objectForKey:@"status"];
    title = results;
    
    date =[[results valueForKey:@"event"]valueForKey:@"event_date"];
    NSLog(@"date %@",date);
    ////////////////////////////////////////////////////////////////
    img =[[results valueForKey:@"slider"]valueForKey:@"imageurl"];
     NSLog(@"event name fetch %@",img);
    
    des =[[results valueForKey:@"slider"]valueForKey:@"title"];
    NSLog(@"event name fetch %@",des);
    
    
   
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        
    NSMutableArray *arrayImages = [[NSMutableArray alloc] init];
    
    for (NSString *strImageUrl in img) {
        [arrayImages addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImageUrl]]]];
    }
     dispatch_sync(dispatch_get_main_queue(), ^{
         globalCounter=0;
         if(des.count>0){
             
             [self changeLable];
             
         }

    self.img.animationImages = arrayImages;
    _img.animationDuration=10;
    _img.animationRepeatCount = 0;
    [_img startAnimating];
  //  [HUD hide: YES];
         [spinner stopAnimating];

     });
        
        
    });
}


-(void)changeLable{
    
    if(!(globalCounter<des.count)){
        globalCounter=0;
    }
    
    
  //  NSLog(@"globalCounter %d",globalCounter);
    
    [UIView animateWithDuration:1
                          delay:0.6
                        options: UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [_label setText:[des objectAtIndex:globalCounter]];
                         globalCounter++;
                         
                         [self performSelector:@selector(changeLable) withObject:nil afterDelay:5];
                         
                     }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)event:(id)sender
{
    CKDemoViewController *destVC = [[CKDemoViewController alloc] init];
    destVC.arr = title;
    [self presentViewController:destVC animated:YES completion:nil];
    //    [self.navigationController pushViewController:[[CKDemoViewController alloc] init] animated:YES];
}
@end
