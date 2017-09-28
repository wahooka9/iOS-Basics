//
//  RandomTableViewCell.h
//  Protocols
//
//  Created by Andrew Riznyk on 8/16/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabelOutlet;

@property (weak, nonatomic) IBOutlet UILabel *subtextLabelOutlet;
@property (weak, nonatomic) IBOutlet UILabel *dateLabelOutlet;

@end
