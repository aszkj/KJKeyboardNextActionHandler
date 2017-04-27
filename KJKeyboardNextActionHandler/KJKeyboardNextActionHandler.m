//
//  KeyboardNextActionHander.m
//  Operator_JingGang
//
//  Created by 张康健 on 15/10/12.
//  Copyright (c) 2015年 XKJH. All rights reserved.
//

#import "KJKeyboardNextActionHandler.h"

typedef void(^LastNextBlock)(void);

@interface KJKeyboardNextActionHandler()<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *subTextFileds;

@property (nonatomic,weak) UIView *textContainerView;

@property (nonatomic, copy)LastNextBlock lastNextAction;

@end

@implementation KJKeyboardNextActionHandler

-(instancetype)initWithTextContainerView:(UIView *)containerView lastNextAction:(void(^)())lastNextAction
{
    self = [super init];
    if (self) {
        
        self.subTextFileds = [NSMutableArray arrayWithCapacity:0];
        self.textContainerView = containerView;
        self.lastNextAction = lastNextAction;
        
        [self _setSubTextFiledsWithTextContainerView:containerView];
        
        [self _orderTextFields];
        
        [self _setTextFieldsReturnKeyType];
        
    }
    return self;
}


-(void)_setTextFieldsReturnKeyType {

    for (int i=0; i<self.subTextFileds.count; i++) {
        UITextField *textFiled = self.subTextFileds[i];
        if (i == self.subTextFileds.count - 1 ) {
            textFiled.returnKeyType = UIReturnKeyDone;
        }else {
            textFiled.returnKeyType = UIReturnKeyNext;
        }
    }
}

-(void)_setSubTextFiledsWithTextContainerView:(UIView *)containerView {

    if ([containerView isMemberOfClass:[UITextField class]]) {//是textFiled
        UITextField *subTextFiled = (UITextField *)containerView;
        subTextFiled.delegate = self;
        [self.subTextFileds addObject:subTextFiled];
        return;
    }else {//不是textFiled
        if (!containerView.subviews.count) { //没有子视图，返回
            return;
        }else {//有子视图，递归子视图，继续遍历
            for (UIView *subView in containerView.subviews) {
                [self _setSubTextFiledsWithTextContainerView:subView];
            }
        }
    }
}

-(void )_orderTextFields {
    
    [self.subTextFileds sortUsingComparator:^NSComparisonResult(UITextField* textField1, UITextField* textField2) {
        
        CGRect frame1 = [textField1 convertRect:textField1.frame toView:self.textContainerView];
        CGRect frame2 = [textField2 convertRect:textField2.frame toView:self.textContainerView];
        NSNumber *positionY1 = @(frame1.origin.y);
        NSNumber *positionY2 = @(frame2.origin.y);
        return [positionY1 compare:positionY2];
    }];
    
    
}


#pragma mark ----------------------- TextField Method -----------------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger firstResponderTextFieldIndex = [self.subTextFileds indexOfObject:textField];
    if (firstResponderTextFieldIndex == self.subTextFileds.count-1) {//最后一个
        if (self.lastNextAction) {
            self.lastNextAction();
        }
        [textField resignFirstResponder];
    }else {
        UITextField *nextResponseTextField = (UITextField *)[self.subTextFileds objectAtIndex:firstResponderTextFieldIndex+1];
        [nextResponseTextField becomeFirstResponder];
    }
    
    return YES;

}

@end
