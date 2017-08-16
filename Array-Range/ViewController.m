//
//  ViewController.m
//  Array-Range
//
//  Created by 陈旭 on 2017/8/16.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "ViewController.h"
//#import "NSArray+Index.h"
#import "NSArray+Index.m"
@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *t_array;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.t_array = [[NSMutableArray alloc] initWithObjects:@"1", nil];

//    NSString *a = self.t_array[1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        NSString *a = [self.t_array objectAtIndex:1];
//    NSLog(@"%@",[self.t_array get_Index:1]);

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
