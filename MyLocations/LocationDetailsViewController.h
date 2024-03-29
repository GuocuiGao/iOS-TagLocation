//
//  LocationDetailsViewController.h
//  MyLocations
//
//  Created by Shuyan Guo on 6/22/16.
//  Copyright © 2016 GG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Location;

@interface LocationDetailsViewController : UITableViewController

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) CLPlacemark *placemark;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) Location *locationToEdit;

@end
