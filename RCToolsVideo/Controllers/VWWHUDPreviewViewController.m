//
//  VWWHUDPreviewViewController.m
//  RCToolsVideo
//
//  Created by Zakk Hoyt on 9/18/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import "VWWHUDPreviewViewController.h"
#import "VWWLocationController.h"
#import "VWWMotionMonitor.h"
#import "UIView+ParallaxMotion.h"
#import "VWWHUDView.h"

@interface VWWHUDPreviewViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fieldImageView;
@property (weak, nonatomic) IBOutlet VWWHUDView *hudView;

@end

@implementation VWWHUDPreviewViewController

//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Gesture recognizers
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapGestureHandler:)];
    [doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTapGestureRecognizer];
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureHandler:)];
    [singleTapGestureRecognizer setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
    [singleTapGestureRecognizer requireGestureRecognizerToFail:doubleTapGestureRecognizer];

    NSUInteger index = arc4random() % 2;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"field0%ld", (long)index]];
    self.fieldImageView.image = image;
    
    self.hudView.parallaxIntensity = 40;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)singleTapGestureHandler:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doubleTapGestureHandler:(id)sender{
    [[VWWLocationController sharedInstance]resetStats];
    [[VWWMotionMonitor sharedInstance]resetStats];
}

@end
