//
//  PrettyDateViewController.h
//  NSDate+PrettyDate
//
//  Created by Ramon Bartl on 19.05.13.
//  Copyright (c) 2013 Ramon Bartl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrettyDateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fromDate;
@property (weak, nonatomic) IBOutlet UILabel *prettyDate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *styleSelector;

@end