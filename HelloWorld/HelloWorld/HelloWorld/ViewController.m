//
//  ViewController.m
//  HelloWorld
//
//  Created by jiangtao on 4/8/15.
//  Copyright (c) 2015 jiangtao. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)doBtnHide:(id)sender {
  NSLog (@"btn clicked");
  [_lblHelloWorld setText: @"Hello"];
  [sender setTitle:[_lblHelloWorld isHidden]
   ? @"Show" : @"Hide" forState:UIControlStateNormal];
}
@end
