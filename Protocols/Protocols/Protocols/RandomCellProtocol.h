//
//  RandomCellProtocol.h
//  Protocols
//
//  Created by Andrew Riznyk on 8/16/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RandomCellProtocol <NSObject>

@required
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;

@optional
@property (strong, nonatomic) NSString *details;
-(void) functionTest;

@end
