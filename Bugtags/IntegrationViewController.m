//
//  IntegrationViewController.m
//  Bugtags
//
//  Created by Stephen Zhang on 7/29/15.
//  Copyright (c) 2015 bugtags.com. All rights reserved.
//

#import "IntegrationViewController.h"

@interface IntegrationViewController ()

@end

@implementation IntegrationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"快速集成";
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (IBAction)onCrashClick:(id)sender
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    NSString *s = nil;
    [array addObject:s];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
