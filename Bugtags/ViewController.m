//
//  ViewController.m
//  Bugtags
//
//  Created by Bugtags on 15/7/28.
//  Copyright (c) 2015年 bugtags.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btg_icon_logo"]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.topConstraint.constant = 0;
}

- (IBAction)onButtonClick:(UIButton *)sender
{
    switch (sender.tag) {
            
        case 1000:
        case 1003:
            [self performSegueWithIdentifier:@"description" sender:nil];
            break;
        case 1001:
            [self performSegueWithIdentifier:@"integration" sender:nil];
            break;
        case 1002:
            [self performSegueWithIdentifier:@"Feedback" sender:nil];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
