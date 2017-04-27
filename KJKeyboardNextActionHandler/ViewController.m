//
//  ViewController.m
//  KJKeyboardNextActionHandler
//
//  Created by mm on 17/4/27.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "ViewController.h"
#import "KJKeyboardNextActionHandler.h"

@interface ViewController ()

@property (nonatomic, strong)KJKeyboardNextActionHandler *keyboardNextActionHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.keyboardNextActionHandler = [[KJKeyboardNextActionHandler alloc] initWithTextContainerView:self.view lastNextAction:^{
        NSLog(@"最后一个");
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
