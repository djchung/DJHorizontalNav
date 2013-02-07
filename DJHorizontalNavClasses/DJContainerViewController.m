//
//  DJContainerViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJContainerViewController.h"

@interface DJContainerViewController ()
@property (assign, nonatomic) int totalPages;
@property (strong, nonatomic) NSArray *viewControllers;
@end

@implementation DJContainerViewController


/***
 The horizontal navigation code is from the Apple Doc's PageControl Example.
 http://developer.apple.com/library/ios/#samplecode/PageControl/Listings/Classes_iPhone_PhoneContentController_m.html
 This is just the stripped down version. 
 Refer to the Example project, DJHorizontalNavigation to see how to configure
 multiple hierarchies within horizontal navigation
 ***/

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
     
     For example:
     
     UIViewController *controller1 = [[UIViewController alloc]init];
     UIViewController *controller2 = [[UIViewController alloc]init];
     UIViewController *controller3 = [[UIViewController alloc]init];
    
     self.viewControllers = [[NSArray alloc] initWithObjects: controller1, controller2, controller3, nil];
    
     
    */
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
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}
@end
