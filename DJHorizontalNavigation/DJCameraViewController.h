//
//  DJCameraViewController.h
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJExampleContainerViewController.h"

@interface DJCameraViewController : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (strong, nonatomic) DJExampleContainerViewController *containerVC;

@end
