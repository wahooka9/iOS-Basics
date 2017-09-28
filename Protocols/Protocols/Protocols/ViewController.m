//
//  ViewController.m
//  Protocols
//
//  Created by Andrew Riznyk on 8/16/17.
//  Copyright © 2017 Andrew Riznyk. All rights reserved.
//

#import "ViewController.h"
#import "RandomTableViewCell.h"
#import "RandomCellProtocol.h"
#import "Controller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    self.dataArray = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)addAction:(id)sender {
    [self.dataArray addObject:[Controller randomCell]];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]  withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)removeAction:(id)sender {
    
}

#pragma mark TableViewDelegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        RandomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    id<RandomCellProtocol> data = [self.dataArray objectAtIndex:indexPath.row];
    cell.imageView.image = data.image;
    cell.nameLabelOutlet.text = [data name];
    cell.subtextLabelOutlet.text = [data details];
    cell.imageView.layer.masksToBounds = true;
    cell.imageView.layer.cornerRadius = 36;
    
    if ([data respondsToSelector:@selector(functionTest)]){
        [data functionTest];
    }
    
    
    return cell;
}




@end
