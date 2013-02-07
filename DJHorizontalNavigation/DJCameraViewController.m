//
//  DJCameraViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJCameraViewController.h"

@interface DJCameraViewController ()
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation DJCameraViewController

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
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(choosePicture)];
    self.navigationItem.rightBarButtonItem = cameraButton;
    self.navigationItem.title = @"Photos";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUserImageView:nil];
    [super viewDidUnload];
}

#pragma mark - UIBarButton Method
- (void)choosePicture {
    UIActionSheet *cameraActionSheet = [[UIActionSheet alloc]initWithTitle:@"Add a photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a photo", @"Choose from library", nil];
    [cameraActionSheet showInView:self.containerVC.view];
    
}

#pragma mark - UIActionSheetDelegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [self setUpImagePicker];
    
    if (buttonIndex == 0) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *noCameraAlert = [[UIAlertView alloc]initWithTitle:@"No Camera" message:@"This device does not have a camera. Please select a picture from your library" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [noCameraAlert show];
            return;
        }else {
            [self takePhoto];
        }
    
    }else if (buttonIndex == 1){
        [self choosePhoto];
    }
}

#pragma mark - Photo methods

- (void)takePhoto {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.containerVC presentViewController:self.imagePicker animated:YES completion:nil];

}

- (void)choosePhoto {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.containerVC presentViewController:self.imagePicker animated:YES completion:nil];
}

- (void)setUpImagePicker {
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
}
#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self.containerVC dismissViewControllerAnimated:YES completion:^{
        self.userImageView.image = image;
    }];
}

@end
