//
//  RandomCellData.h
//  Protocols
//
//  Created by Andrew Riznyk on 8/16/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RandomCellProtocol.h"

@interface RandomCellData : NSObject <RandomCellProtocol>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;

@end
