//
//  ViewController.m
//  homework
//
//  Created by _ziTai on 16/2/17.
//  Copyright © 2016年 _ziTai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray      *_buttonArr;
    UIButton            *_button;
    BOOL                _isOpen;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _buttonArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (int i = 0; i < 6; i++)
    {
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.view.frame) - 60, 30, 30)];
        but.backgroundColor = [UIColor greenColor];
        but.tag = i;
        [_buttonArr addObject:but];
        [self.view addSubview:but];
    }
    _button = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.view.frame) - 70, 50, 50)];
    _button.backgroundColor = [UIColor redColor];
    [_button addTarget:self action:@selector(clickBigButon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}
-(void)clickBigButon
{
    
    if (!_isOpen)
    {
        for (UIButton *but in _buttonArr)
        {
            but.alpha = 1.0;
            CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
            animationgroup.duration = 0.3 + but.tag / 20.0;
            animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            //移动动画
            CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            keyAn.values = @[[NSValue valueWithCGPoint:CGPointMake(50, 520)],
                             [NSValue valueWithCGPoint:CGPointMake(50 + 200 * sin(18*but.tag * (M_PI/180)), 520 + 200 * -cos(18*but.tag* (M_PI/180)))],
                             [NSValue valueWithCGPoint:CGPointMake(50 + 220 * sin(18*but.tag * (M_PI/180)), 520 + 220 * -cos(18*but.tag* (M_PI/180)))],
                             [NSValue valueWithCGPoint:CGPointMake(50 + 200 * sin(18*but.tag * (M_PI/180)), 520 + 200 * -cos(18*but.tag* (M_PI/180)))]];
            keyAn.keyTimes = @[@(0),@(0.6),@(0.8),@(1)];
            
            //旋转动画
            CABasicAnimation *baseAn = [CABasicAnimation animationWithKeyPath:@"transform"];
            baseAn.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 0)];
            baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
            
            animationgroup.removedOnCompletion = NO;
            animationgroup.fillMode = kCAFillModeForwards;
            
            animationgroup.animations = @[baseAn,keyAn];
            [but.layer addAnimation:animationgroup forKey:@"aa"];
            
            but.frame = CGRectMake(35 + 200 * sin(18*but.tag * (M_PI/180)), 520 - 15 + 200 * -cos(18*but.tag* (M_PI/180)), 30, 30);
            [but addTarget:self action:@selector(clickSmallButton:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            //旋转动画
            CABasicAnimation *baseAn1 = [CABasicAnimation animationWithKeyPath:@"transform"];
//            baseAn1.duration = 0.5;
            baseAn1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/4, 0, 0, 1)];
            baseAn1.removedOnCompletion = NO;
            baseAn1.fillMode = kCAFillModeForwards;
            [_button.layer addAnimation:baseAn1 forKey:@"big"];
        }
        

    }
    else
    {
        for (UIButton *but in _buttonArr)
        {
            CAAnimationGroup *animationgroup = [CAAnimationGroup animation];
            animationgroup.duration = 0.7 - but.tag / 20.0;
            animationgroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            //移动动画
            CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            keyAn.values = @[
                             [NSValue valueWithCGPoint:CGPointMake(50 + 200 * sin(18*but.tag * (M_PI/180)), 520 + 200 * -cos(18*but.tag* (M_PI/180)))],
                             [NSValue valueWithCGPoint:CGPointMake(50 + 220 * sin(18*but.tag * (M_PI/180)), 520 + 220 * -cos(18*but.tag* (M_PI/180)))],
                             [NSValue valueWithCGPoint:CGPointMake(50 + 200 * sin(18*but.tag * (M_PI/180)), 520 + 200 * -cos(18*but.tag* (M_PI/180)))],
                             [NSValue valueWithCGPoint:CGPointMake(50, 520)]
                             ];
            keyAn.keyTimes = @[@(0),@(0.2),@(0.4),@(1)];
            
            //旋转动画
            CABasicAnimation *baseAn = [CABasicAnimation animationWithKeyPath:@"transform"];
            baseAn.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 0)];
            baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
            
            animationgroup.removedOnCompletion = NO;
            animationgroup.fillMode = kCAFillModeForwards;
            
            animationgroup.animations = @[baseAn,keyAn];
            [but.layer addAnimation:animationgroup forKey:@"aa"];
            
            
            //旋转动画
            CABasicAnimation *baseAn1 = [CABasicAnimation animationWithKeyPath:@"transform"];
            
            baseAn1.fromValue = baseAn1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/4, 0, 0, 1)];
            baseAn1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/4 ,0, 0, 0)];
            baseAn1.removedOnCompletion = NO;
            baseAn1.fillMode = kCAFillModeForwards;
            [_button.layer addAnimation:baseAn1 forKey:@"big"];
        }

    }
    _isOpen = !_isOpen;
}
-(void)clickSmallButton:(UIButton*)but
{
    //旋转动画
    CABasicAnimation *baseAn1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    //            baseAn1.duration = 0.5;
    baseAn1.fromValue = baseAn1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/4, 0, 0, 1)];
    baseAn1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/4 ,0, 0, 0)];
    baseAn1.removedOnCompletion = NO;
    baseAn1.fillMode = kCAFillModeForwards;
    [_button.layer addAnimation:baseAn1 forKey:@"big"];
    for (UIButton *butt in _buttonArr)
    {
        if (butt.tag == but.tag)
        {
            CABasicAnimation *baseAn = [CABasicAnimation animation];
            baseAn.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
            baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(3, 3, 3)];
//            baseAn.duration = 1;
            baseAn.keyPath = @"transform";
            baseAn.removedOnCompletion = NO;
            baseAn.fillMode = kCAFillModeForwards;
            [butt.layer addAnimation:baseAn forKey:@"11"];
        }
        else
        {
            CABasicAnimation *baseAn = [CABasicAnimation animation];
            baseAn.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
            baseAn.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)];
            baseAn.keyPath = @"transform";
            baseAn.removedOnCompletion = NO;
            baseAn.fillMode = kCAFillModeForwards;
            [butt.layer addAnimation:baseAn forKey:@"11"];
        }
    }
    [UIView beginAnimations:nil context:nil];
    but.alpha = 0;
    [UIView setAnimationDuration:0.8];
    [UIView commitAnimations];
    _isOpen = !_isOpen;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
