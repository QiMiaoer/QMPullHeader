//
//  UIView+Category.h
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GetScreenScale [UIView getScreenScale]

@interface UIView (Category)

// 设置x
- (void)fastSetX:(CGFloat)x;

// 设置y
- (void)fastSetY:(CGFloat)y;

// 设置width
- (void)fastSetWidth:(CGFloat)width;

// 设置height
- (void)fastSetHeight:(CGFloat)height;

// 设置center x
- (void)fastSetCenterX:(CGFloat)centerX;

// 设置center y
- (void)fastSetCenterY:(CGFloat)centerY;

// 设置origin
- (void)fastSetOrigin:(CGPoint)origin;

// 设置size
- (void)fastSetSize:(CGSize)size;

// 设置center
- (void)fastSetCenter:(CGPoint)center;

// 上
- (CGFloat)fastTop;

// 下
- (CGFloat)fastBottom;

// 左
- (CGFloat)fastLeft;

// 右
- (CGFloat)fastRight;

// 宽
- (CGFloat)fastWidth;

// 高
- (CGFloat)fastHeight;

@end
