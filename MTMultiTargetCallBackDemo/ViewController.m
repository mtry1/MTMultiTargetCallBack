//
//  ViewController.m
//  MTMultiTargetCallBackDemo
//
//  Created by zhourongqing on 2016/11/22.
//  Copyright © 2016年 mtry. All rights reserved.
//

#import "ViewController.h"
#import "MTMultiTargetCallBack.h"

@interface MTObject : NSObject

- (void)hello;
- (void)helloWithParameter1:(id)parameter1 parameter2:(NSInteger)parameter2;

@end

@implementation MTObject

- (void)hello
{
    NSLog(@"%@ %@", self, NSStringFromSelector(_cmd));
}

- (void)helloWithParameter1:(id)parameter1 parameter2:(NSInteger)parameter2
{
    NSLog(@"%@ %@ %@ %ld", self, NSStringFromSelector(_cmd), parameter1, parameter2);
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MTObject *obj1 = [MTObject new];
    MTObject *obj2 = [MTObject new];
    
    MTMultiTargetCallBack *targetCallBack = [MTMultiTargetCallBack new];
    [targetCallBack addTarget:obj1];
    [targetCallBack addTarget:obj2];
    
    [targetCallBack callBackSelector:@selector(hello)];
    [targetCallBack callBackSelector:@selector(helloWithParameter1:parameter2:) params:nil, 1];
}


@end
