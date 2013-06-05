//
//  ViewController.m
//  Partners
//
//  Created by JiaLi on 13-5-13.
//  Copyright (c) 2013年 JiaLi. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (_mainViewController == nil) {
       _mainViewController = [[MainViewController alloc] init];
        _mainViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
         UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:_mainViewController];
        [self.view addSubview:nav.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
