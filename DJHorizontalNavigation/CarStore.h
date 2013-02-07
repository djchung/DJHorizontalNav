//
//  CarStore.h
//  DJHorizontalNavigation
//
//  Created by DJ Chung on 2/5/13.
//  Copyright (c) 2013 Bluekey LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;

@interface CarStore : NSObject
@property (strong, nonatomic) NSArray *allCars;

+(CarStore *)sharedStore;

- (Car *)createCarWithName:(NSString *)name price:(NSString *)price imageFileName:(NSString *)imageFileName;

@end
