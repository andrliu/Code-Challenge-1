//
//  ViewController.m
//  Code Challenge 1
//
//  Created by Andrew Liu on 10/23/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) IBOutlet UITextField *valueOne;
@property (strong, nonatomic) IBOutlet UITextField *valueTwo;
@property (strong, nonatomic) IBOutlet UIButton *webButton;
@property (nonatomic) NSInteger answer;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webButton setEnabled:NO];
}

- (IBAction)calculate:(id)sender
{
    [self.valueOne resignFirstResponder];
    [self.valueTwo resignFirstResponder];
    NSString *stringOne = self.valueOne.text;
    NSInteger numberOne = stringOne.integerValue;
    NSString *stringTwo = self.valueTwo.text;
    NSInteger numberTwo = stringTwo.integerValue;
    self.answer = numberOne * numberTwo;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld", self.answer];
    if (self.answer % 5 == 0 && self.answer >= 5)
    {
        [self.webButton setEnabled:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = segue.destinationViewController;
    webVC.navigationItem.title = [NSString stringWithFormat:@"%ld", self.answer];
}

@end
