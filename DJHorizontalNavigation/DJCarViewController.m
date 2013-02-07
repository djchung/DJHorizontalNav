//
//  DJCarViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJCarViewController.h"

@interface DJCarViewController ()
@property (strong, nonatomic) NSString *carImageFileName;
@end

@implementation DJCarViewController

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
    self.navigationItem.title = self.car.name;
    self.priceLabel.text = self.car.price;
    UIImage *carImage = [UIImage imageNamed:self.car.carImageFileName];
    self.carImageView.image = carImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCarImageView:nil];
    [self setPriceLabel:nil];
    [super viewDidUnload];
}
@end
