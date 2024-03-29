//
//  CategoryPickerViewController.m
//  MyLocations
//
//  Created by Shuyan Guo on 6/22/16.
//  Copyright © 2016 GG. All rights reserved.
//

#import "CategoryPickerViewController.h"

@interface CategoryPickerViewController ()

@end

@implementation CategoryPickerViewController {
    
    NSArray *_categories;
    NSIndexPath *_selectedIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:1.0f alpha:0.2f];
    
    _categories = @[
                    @"No Category",
                    @"Apple Store",
                    @"Bar",
                    @"Bookstore",
                    @"Club",
                    @"Grocery Store",
                    @"Historic Building",
                    @"House",
                    @"Icecream Vendor",
                    @"Landmark",
                    @"Park"
                    ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *category = _categories[indexPath.row];
    cell.textLabel.text = category;
    
    if([category isEqualToString:_selectedCategoryName]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        _selectedIndexPath = indexPath;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath != _selectedIndexPath) {
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
        [[tableView cellForRowAtIndexPath:_selectedIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
        
        _selectedIndexPath = indexPath;
        _selectedCategoryName = _categories[indexPath.row];
    }
    [_delegate categoryPicker:self didFinishSelect:_selectedCategoryName];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.highlightedTextColor = cell.textLabel.textColor;
    UIView *selectionView = [[UIView alloc] initWithFrame:CGRectZero];
    selectionView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.2f];
    cell.selectedBackgroundView = selectionView;
}

@end
