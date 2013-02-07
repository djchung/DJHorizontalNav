//
//  DJHNBaseViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJExampleContainerViewController.h"
#import "DJHelloViewController.h"
#import "DJCarTableViewController.h"
#import "DJCameraViewController.h"

@interface DJExampleContainerViewController ()
@property (strong, nonatomic) NSArray *viewControllers;
@property (nonatomic, assign) int totalPages;
@end

@implementation DJExampleContainerViewController

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
    [self setUpViewControllersForNavigation];
    self.totalPages = self.viewControllers.count;
    [self setUpScrollView];
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Setting up UIViewControllers for Navigation
- (void)setUpViewControllersForNavigation{
    
    /*
     Alloc and init all of the view controllers that you want to be part of your
     horizontal navigation. 
     
     Alloc and init the self.viewControllers array with all of your viewcontrollers
     in the order you want them to appear.
     
     */
    DJHelloViewController *hvc = [[DJHelloViewController alloc]init];
    UINavigationController *hvcnav = [[UINavigationController alloc]initWithRootViewController:hvc];
    DJCarTableViewController *ctvc = [[DJCarTableViewController alloc]init];
    UINavigationController *ctvcnav = [[UINavigationController alloc]initWithRootViewController:ctvc];
    DJCameraViewController *cvc = [[DJCameraViewController alloc]init];
    /*
    in order for UIImagePickerController to display properly, create a property that 
     is of type DJExampleContainerViewController and set it to self. This property will 
     be used to present and dismiss the UIImagePickerController.
    */
    cvc.containerVC = self;
    
    UINavigationController *cvcnav = [[UINavigationController alloc]initWithRootViewController:cvc];
    self.viewControllers = [[NSArray alloc]initWithObjects:hvcnav, ctvcnav, cvcnav, nil];
    
}

#pragma mark - Horizontal Scroll Methods

- (void)setUpScrollView {
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * self.totalPages, self.scrollView.frame.size.height);
    
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0 || page >= self.totalPages) {
        return;
    }
    UIViewController *uivc = [self.viewControllers objectAtIndex:page];
    if (uivc.view.superview == nil) {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        uivc.view.frame = frame;
        [self.scrollView addSubview:uivc.view];
    }
}

#pragma mark UIScrollViewDelegateMethods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //to dismiss keyboard
    NSNotification *note = [NSNotification notificationWithName:@"dismissKeyboard" object:nil];
    [[NSNotificationCenter defaultCenter]postNotification:note];

    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    

}

@end
