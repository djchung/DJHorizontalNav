//
//  DJCarsViewController.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "DJCarTableViewController.h"
#import "DJCarViewController.h"
#import "CarStore.h"
#import "Car.h"

@interface DJCarTableViewController ()
@property (strong, nonatomic) NSArray *carArray;
@end

@implementation DJCarTableViewController

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
    self.navigationItem.title = @"Cars";
    self.carArray = [[NSArray alloc]initWithArray:[CarStore sharedStore].allCars];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark UITableViewDataSource Methods 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Car *car = [self.carArray objectAtIndex:indexPath.row];
    cell.textLabel.text = car.name;
    return cell;
}

#pragma mark UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DJCarViewController *cvc = [[DJCarViewController alloc]init];
    cvc.car = [self.carArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:cvc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
