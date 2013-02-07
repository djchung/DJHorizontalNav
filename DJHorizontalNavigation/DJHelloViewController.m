//
//  DJFirstViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJHelloViewController.h"

@interface DJHelloViewController ()
@property (strong, nonatomic) NSString *nameOfFriend;
@end

@implementation DJHelloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    [self helloButtonValidation];
    [self.nameTextField addTarget:self action:@selector(helloButtonValidation) forControlEvents:UIControlEventEditingChanged];
    self.nameTextField.enablesReturnKeyAutomatically = YES;
    self.nameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    
    self.navigationItem.title = @"Hello!";
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissKeyboard) name:@"dismissKeyboard" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"disapper");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNameTextField:nil];
    [self setSayHelloButton:nil];
    [super viewDidUnload];
}

- (void)sayThankYou {
    UIAlertView *thanksAlert = [[UIAlertView alloc]initWithTitle:@"Thank You!" message:[NSString stringWithFormat:@"%@, thanks for checking this out!", self.nameOfFriend] delegate:self cancelButtonTitle:@"You're Welcome!" otherButtonTitles: nil];
    thanksAlert.delegate = self;
    [thanksAlert show];
    
}

#pragma mark - HelloButton Methods

- (IBAction)sayHelloButtonTouched:(id)sender {
    [self sayThankYou];
}

- (void)helloButtonValidation {
    if ([self sayHelloEnabled]) {
        self.sayHelloButton.enabled = YES;
        UIImage *buttonImage = [[UIImage imageNamed:@"blueButton.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        [self.sayHelloButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [self.sayHelloButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }else if (![self sayHelloEnabled]) {
        self.sayHelloButton.enabled = NO;
        UIImage *buttonImage = [[UIImage imageNamed:@"greyButton.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        [self.sayHelloButton setBackgroundImage:buttonImage forState:UIControlStateDisabled];
        [self.sayHelloButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    }
}

- (BOOL)sayHelloEnabled {
    self.nameOfFriend = [self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"name of friend: %@", self.nameOfFriend);
    if (self.nameOfFriend.length < 1) {
        return NO;
    }
    return YES;
    
}

#pragma mark - UITextFieldDelegateMethods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([self sayHelloEnabled]) {
        [self sayThankYou];
        return YES;
    }
    return NO;
}

#pragma mark - NSNotificationCenter Methods

- (void)dismissKeyboard {
    NSLog(@"dismisskeyboard getting called");
    [self.nameTextField resignFirstResponder];
}

#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.nameTextField resignFirstResponder];
    }
}



@end
