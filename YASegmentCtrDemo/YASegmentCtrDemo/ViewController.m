//
//  ViewController.m
//  YASegmentCtrDemo
//
//  Created by Jaime on 2017/7/30.
//  Copyright © 2017年 Yaso. All rights reserved.
//

#import "ViewController.h"
#import "YASegmentedControl.h"

@interface ViewController () <YASegmentedControlDelegate> {
    NSArray *segmentArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI {
    YASegmentedControl *sc = [[YASegmentedControl alloc]initWithFrame:CGRectMake(30, 100, 300, 40)];
    sc.delegate = self;
    sc.backgroundColor = [UIColor whiteColor];
    sc.selectedColor = [UIColor orangeColor];
    
    segmentArr = [NSArray arrayWithObjects:@"GG",@"ZZ",@"YY",@"KK", nil];
    [sc addSegmentArray:segmentArr];
    [sc selectTheSegment:1];
    [self.view addSubview:sc];
}

- (void)segmentDidChanged:(NSInteger)segmentIndex {
    NSLog(@"%@ is Clicked",segmentArr[segmentIndex]);
}

@end
