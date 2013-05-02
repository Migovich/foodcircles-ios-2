//
//  FCSSignUpViewController.m
//  FoodCircles
//
//  Created by David Groulx on 5/1/13.
//  Copyright (c) 2013 FoodCircles. All rights reserved.
//

#import "FCSSignUpViewController.h"

#import "FCSRemoteAPI.h"

@interface FCSSignUpViewController ()

@end

@implementation FCSSignUpViewController

- (id)initWithCoder:(NSCoder *)aCoder;
{
  self = [super initWithCoder:aCoder];
  if (self) {
    // Observe keyboard show and hide to slide the scroll view up
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
  }
  return self;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
  [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
  NSDictionary* info = [aNotification userInfo];
  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
  
  // Move both text fields and the sign up button into view if the keyboard obscures any of them
  if (kbSize.height > self.view.frame.size.height - self.signUpButton.frame.origin.y ) {
    CGPoint scrollPoint = CGPointMake(0.0, kbSize.height - (self.view.frame.size.height - self.signUpButton.frame.origin.y - self.signUpButton.frame.size.height));
    [self.scrollView setContentOffset:scrollPoint animated:YES];
  }
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
  [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"signUp"]) {
    [[FCSRemoteAPI sharedInstance] authorizeEmail:self.emailTextField.text password:self.passwordTextField.text];
  }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
