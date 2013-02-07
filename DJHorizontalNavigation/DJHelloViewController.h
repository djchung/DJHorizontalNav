//
//  DJFirstViewController.h
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJHelloViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *sayHelloButton;

@end
