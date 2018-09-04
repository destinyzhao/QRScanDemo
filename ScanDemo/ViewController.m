//
//  ViewController.m
//  ScanDemo
//
//  Created by Destiny on 2018/8/21.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "ScanViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sacnAction:(UIButton *)sender {
    ScanViewController *scanVC = [[ScanViewController alloc]init];
    [self.navigationController pushViewController:scanVC animated:YES];
}

@end
