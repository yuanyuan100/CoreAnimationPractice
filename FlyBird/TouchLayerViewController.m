//
//  TouchLayerViewController.m
//  FlyBird
//
//  Created by Mr.Pyy on 2017/6/29.
//  Copyright © 2017年 Mr.Pyy. All rights reserved.
//

#import "TouchLayerViewController.h"

@interface TouchLayerViewController ()
@property (nonatomic, strong) CALayer *aLayer;
@property (nonatomic, strong) CALayer *bLayer;
@end

@implementation TouchLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.aLayer = [CALayer layer];
    self.aLayer.frame = CGRectMake(50, 84, 200, 200);
    self.aLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:self.aLayer];
    
    
    self.bLayer = [CALayer layer];
    self.bLayer.frame = CGRectMake(50, 50, 100, 100);
    self.bLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.aLayer addSublayer:self.bLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //get touch position relative to main view
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //convert point to the white layer's coordinates
    point = [self.aLayer convertPoint:point fromLayer:self.view.layer];
    //get layer using containsPoint:
    if ([self.aLayer containsPoint:point]) {
        //convert point to blueLayer’s coordinates
        point = [self.bLayer convertPoint:point fromLayer:self.aLayer];
        if ([self.bLayer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }
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
