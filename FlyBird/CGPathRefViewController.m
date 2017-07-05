//
//  CGPathRefViewController.m
//  FlyBird
//
//  Created by Mr.Pyy on 2017/7/5.
//  Copyright © 2017年 Mr.Pyy. All rights reserved.
//

/*
**********************************shadowPath属性**********************************
    我们已经知道图层阴影并不总是方的，而是从图层内容的形状继承而来。
    这看上去不错，但是实时计算阴影也是一个非常消耗资源的，尤其是图层有多个子图层，每个图层还有一个有透明效果的寄宿图的时候。

    如果你事先知道你的阴影形状会是什么样子的，你可以通过指定一个shadowPath来提高性能。
    shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。
    CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形。我们可以通过这个属性单独于图层形状之外指定阴影的形状。
*/

#import "CGPathRefViewController.h"

@interface CGPathRefViewController ()
@property (weak, nonatomic) IBOutlet UIView *aView;
@property (weak, nonatomic) IBOutlet UIView *bView;

@end

@implementation CGPathRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.aView.layer.shadowOpacity = 0.5;
    self.bView.layer.shadowOpacity = 0.5;
    
    CGMutablePathRef aPathRef = CGPathCreateMutable();
    CGPathAddRect(aPathRef, NULL, self.aView.bounds);
    self.aView.layer.shadowPath = aPathRef;
    self.aView.layer.shadowOffset = CGSizeMake(0, 3);
    CGPathRelease(aPathRef);
    
    CGMutablePathRef bPathRef = CGPathCreateMutable();
    CGPathAddEllipseInRect(aPathRef, NULL, self.bView.bounds);
    self.bView.layer.shadowPath = bPathRef;
    CGPathRelease(bPathRef);
    
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
