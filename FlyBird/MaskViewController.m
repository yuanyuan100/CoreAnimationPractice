//
//  MaskViewController.m
//  FlyBird
//
//  Created by Mr.Pyy on 2017/7/5.
//  Copyright © 2017年 Mr.Pyy. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *flowImageView;
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CALayer *maskLayer = [CALayer layer];
    self.maskLayer = maskLayer;
    self.maskLayer.frame = self.flowImageView.bounds;
    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"loveA"].CGImage);

    
    self.flowImageView.layer.mask = maskLayer;
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

@end
