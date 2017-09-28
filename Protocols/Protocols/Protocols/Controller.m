//
//  Controller.m
//  Protocols
//
//  Created by Andrew Riznyk on 8/17/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

#import "Controller.h"
#import "RandomCellData.h"

@implementation Controller

+(RandomCellData *) randomCell {
    RandomCellData *result = [[RandomCellData alloc] init];
    result.name = @"Name";
    result.date = [[NSDate date] dateByAddingTimeInterval:arc4random()];
    if (arc4random() % 2 == 1){
        result.details = @"Details";
    }
    int random = arc4random() % 3;
    switch (random) {
        case 2:
            result.image = [UIImage imageNamed:@"duck"];
            break;
        case 1:
            result.image = [UIImage imageNamed:@"images"];
            break;
        case 0:
            result.image = [UIImage imageNamed:@"money"];
            break;
        default:
            break;
    }
    return result;
}
@end
