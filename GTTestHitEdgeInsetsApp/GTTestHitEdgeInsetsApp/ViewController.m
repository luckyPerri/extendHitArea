//
//  ViewController.m
//  GTTestHitEdgeInsetsApp
//
//  Created by zhaoke.hzk on 17/3/28.
//  Copyright © 2017年 zhaoke.hzk. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+extendHitArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* testBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    testBtn.backgroundColor = [UIColor redColor];
    testBtn.extendedHitAreaInsets = UIEdgeInsetsMake(-100, -100, -100, -100);
    [testBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

-(void)test:(id)sender{
    
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"test" message:@"test" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
