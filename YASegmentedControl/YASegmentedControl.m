//
//  YASegmentedControl.m
//  YASegmentCtr
//
//  Created by Jaime on 2017/7/30.
//  Copyright © 2017年 Yaso. All rights reserved.
//

#import "YASegmentedControl.h"

@interface YASegmentedControl() {
    CGFloat width;
    UIView *lineView;
    NSInteger selectedIndex;
    NSMutableArray *buttonArray;
}
@end

@implementation YASegmentedControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    buttonArray = [NSMutableArray array];
    selectedIndex = 0;
    _titleColor = [UIColor grayColor];
    _selectedColor = [UIColor redColor];
    _lineColor = [UIColor redColor];
    _titleFont = [UIFont systemFontOfSize:14];
    return self;
}

- (void)addSegmentArray:(NSArray *)segmentArray {
    width = self.bounds.size.width/segmentArray.count;
    for (int i=0; i<segmentArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*width, 0, width, self.bounds.size.height-2);
        [btn setTitle:segmentArray[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn.titleLabel setFont:_titleFont];
        [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        [btn setTitleColor:_selectedColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(changeTheSegment:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            lineView = [[UIView alloc]initWithFrame:CGRectMake(i*width, self.bounds.size.height-2, width, 2)];
            lineView.backgroundColor = _lineColor;
            [self addSubview:lineView];
        }
        [self addSubview:btn];
        [buttonArray addObject:btn];
    }
    [[buttonArray firstObject] setSelected:YES];
}

- (void)changeTheSegment:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self selectTheSegment:btn.tag];
}

- (void)selectTheSegment:(NSInteger)segmentIndex {
    if (selectedIndex != segmentIndex) {
        [buttonArray[selectedIndex] setSelected:NO];
        [buttonArray[segmentIndex] setSelected:YES];
        [UIView animateWithDuration:0.2 animations:^{
            [lineView setFrame:CGRectMake(segmentIndex*width, self.bounds.size.height-2, width, 2)];
        }];
        selectedIndex = segmentIndex;
        if (_delegate) {
            [_delegate segmentDidChanged:segmentIndex];
        }
    }
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

