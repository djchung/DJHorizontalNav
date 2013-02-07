//
//  CarStore.m
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import "CarStore.h"
#import "Car.h"

@implementation CarStore

+ (CarStore *)sharedStore {
    static CarStore *_sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedStore = [[CarStore alloc]initWithCars];
    });
    return _sharedStore;
}

- (id)initWithCars {
    self = [super init];
    if (self) {
        Car *porsche = [self createCarWithName:@"Porsche 911" price:@"$90,000" imageFileName:@"porsche911.png"];
        Car *tesla = [self createCarWithName:@"Tesla Model S" price:@"$60,000" imageFileName:@"teslaModelS.png"];
        Car *rover = [self createCarWithName:@"Land Rover Defender" price:@"$70,000" imageFileName:@"landRoverDefender.png"];
        Car *audi = [self createCarWithName:@"Audi R8" price:@"150,000" imageFileName:@"audiR8.png"];
        Car *aston = [self createCarWithName:@"Aston Martin Vanquish" price:@"$300,000" imageFileName:@"astonMartinVanquish.png"];
        
        self.allCars = [[NSArray alloc]initWithObjects:porsche, tesla, rover, audi, aston, nil];
    }
    
    return self;
    
}

- (Car *)createCarWithName:(NSString *)name price:(NSString *)price imageFileName:(NSString *)imageFileName {
    Car *car = [[Car alloc]init];
    car.name = name;
    car.price = price;
    car.carImageFileName = imageFileName;
    return car;
    
}


@end
