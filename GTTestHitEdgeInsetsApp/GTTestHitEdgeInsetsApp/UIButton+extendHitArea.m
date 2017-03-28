//
//  UIButton+extendHitArea.m
//  GTTestHitEdgeInsetsApp
//
//  Created by zhaoke.hzk on 17/3/28.
//  Copyright © 2017年 zhaoke.hzk. All rights reserved.
//

#import "UIButton+extendHitArea.h"
#import <objc/runtime.h>

static const char buttonExtendedHitKey;

@implementation UIButton (extendHitArea)

@dynamic extendedHitAreaInsets;

-(void)setExtendedHitAreaInsets:(UIEdgeInsets)extendedHitAreaInsets{
    
    
    NSValue* vaule = [NSValue valueWithUIEdgeInsets:extendedHitAreaInsets];
    objc_setAssociatedObject(self, &buttonExtendedHitKey, vaule, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)extendedHitAreaInsets{
    
    NSValue* vaule = objc_getAssociatedObject(self, &buttonExtendedHitKey);
    if (vaule) {
        UIEdgeInsets edgeinsets;
         [vaule getValue:&edgeinsets];
        return edgeinsets;
    }else{
        return UIEdgeInsetsZero;
    }
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.hidden||self.alpha<0.01||self.enabled == NO) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect rect = self.bounds;
    
    CGRect extendedRect =UIEdgeInsetsInsetRect(rect, self.extendedHitAreaInsets);
    return CGRectContainsPoint(extendedRect, point);
}

@end
