//
//  ViewController.m
//  随机数
//
//  Created by ma c on 16/6/11.
//  Copyright © 2016年 彭盛凇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//使用两个数组实现随机数存储
- (void)doubleArray
{
    
    NSMutableArray *muarr1 = [NSMutableArray array];
    
    NSMutableArray *muarr2 = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 100; i ++) {
        [muarr1 addObject:@(i)];
    }
    
    for (NSInteger i = 0; i < 100; i ++) {
        NSInteger index = arc4random_uniform((int)muarr1.count);
        
        NSInteger value = [muarr1[index] integerValue];
        
        [muarr2 addObject:@(value)];
        
        [muarr1 removeObjectAtIndex:index];
    }
    
    NSLog(@"%@",muarr2);
    
}

//使用GCD来实现随机数存储
- (void)GCD_Apply_Random
{
    NSMutableArray *arr = [NSMutableArray array];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_apply(10, queue, ^(size_t index) {
        
        NSLog(@"%zd,%@",index,[NSThread currentThread]);
        
        [arr addObject:@(index)];
        
    });
    
    NSLog(@"%@",arr);

}

@end
