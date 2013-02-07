//
//  DJCarViewController.h
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface DJCarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) Car *car;

@end
