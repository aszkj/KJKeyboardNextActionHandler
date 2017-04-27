//
//  KeyboardNextActionHander.h
//  Operator_JingGang
//
//  Created by 张康健 on 15/10/12.
//  Copyright (c) 2015年 XKJH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KJKeyboardNextActionHandler : NSObject

/**
 create KJKeyboardNextActionHandler

 @param containerView  所有textfiled的父视图
 @param lastNextAction 点击最后一个textfiled的键盘完成回调

 @return KJKeyboardNextActionHandler实例
 */
-(instancetype)initWithTextContainerView:(UIView *)containerView lastNextAction:(void(^)())lastNextAction;

@end
