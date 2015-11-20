//
//  NoneViewController.m
//  api_common-methods
//
//  Created by Arslan Asim on 11/05/2015.
//  Copyright (c) 2015 Arslan Asim. All rights reserved.
//

#import "NoneViewController.h"
#import "api_CommonMethods.h"

@interface NoneViewController ()

@end

@implementation NoneViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
//        [api_CommonMethods showSimpleAlertController:@"title" message:@"message" handler:nil];
//        [api_CommonMethods ]

//        [self presentViewController:[api_CommonMethods simpleAlertController:@"title" message:@"message" handler:^(UIAlertAction *action) {
//
//            NSLog(@"hshdfhs");
//        }] animated:YES completion:nil];
        
    });

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
