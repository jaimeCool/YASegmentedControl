//
//  YASegmentedControl.h
//  YASegmentCtr
//
//  Created by Jaime on 2017/7/30.
//  Copyright © 2017年 Yaso. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YASegmentedControlDelegate <NSObject>
@optional
- (void)segmentDidChanged:(NSInteger)segmentIndex;
@end

@interface YASegmentedControl : UIView
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *selectedColor;
@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic,strong) UIFont *titleFont;

@property (nonatomic,weak) id <YASegmentedControlDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)addSegmentArray:(NSArray*)segmentArray;
- (void)selectTheSegment:(NSInteger)segmentIndex;

@end
