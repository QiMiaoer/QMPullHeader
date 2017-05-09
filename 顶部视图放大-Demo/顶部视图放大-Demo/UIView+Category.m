//
//  UIView+Category.m
//  BaseDemo
//
//  Created by zyx on 16/7/11.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)fastSetX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)fastSetY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)fastSetWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)fastSetHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)fastSetCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)fastSetCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)fastSetOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)fastSetSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)fastSetCenter:(CGPoint)center {
    self.center = center;
}

- (CGFloat)fastTop {
    return self.frame.origin.y;
}

- (CGFloat)fastBottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)fastLeft {
    return self.frame.origin.x;
}

- (CGFloat)fastRight {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)fastWidth {
    return self.frame.size.width;
}

- (CGFloat)fastHeight {
    return self.frame.size.height;
}

@end
