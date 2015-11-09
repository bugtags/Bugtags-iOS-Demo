//
//  FeedbackViewController.m
//  Bugtags
//
//  Created by Stephen Zhang on 7/29/15.
//  Copyright (c) 2015 bugtags.com. All rights reserved.
//

#import "FeedbackViewController.h"
#import <Bugtags/Bugtags.h>

@interface FeedbackViewController ()

@property(nonatomic, weak) IBOutlet UITextField *nameTextField;
@property(nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation FeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"用户反馈";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *submitItem = [[UIBarButtonItem alloc] initWithTitle:@"提交"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(onSubmitClick)];
    self.navigationItem.rightBarButtonItem = submitItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.nameTextField becomeFirstResponder];
}

- (void)onSubmitClick
{
    NSString *name = self.nameTextField.text;
    if (name.length == 0) {
        
        [self.nameTextField becomeFirstResponder];
        return;
    }
    
    NSString *content = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (content.length == 0) {
        
        [self.textView becomeFirstResponder];
        return;
    };
    
    BTGLog(@"正在发反馈"); // 使用Bugtags日志工具，记录日志
    [Bugtags setUserData:name forKey:@"name"];
    [Bugtags sendFeedback:content];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"反馈发送成功"
                                                       delegate:nil
                                              cancelButtonTitle:@"知道了"
                                              otherButtonTitles:nil];
    [alertView show];
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
