//
//  PrettyDateViewController.m
//  NSDate+PrettyDate
//
//  Created by Ramon Bartl on 19.05.13.
//  Copyright (c) 2013 Ramon Bartl. All rights reserved.
//

#import "PrettyDateViewController.h"
#import "NSDate+PrettyDate.h"

@implementation PrettyDateViewController {
    NSDate *date;
    UIDatePicker *datePicker;
    UIToolbar *keyboardToolbar;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (keyboardToolbar == nil) {
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        [keyboardToolbar setBarStyle:UIBarStyleBlackTranslucent];
        UIBarButtonItem *extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
        [keyboardToolbar setItems:[[NSArray alloc] initWithObjects: extraSpace, done, nil]];
    }
    self.fromDate.inputAccessoryView = keyboardToolbar;

    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];

    self.fromDate.inputView = datePicker;

    date = [NSDate date];
    self.fromDate.text = [date description];
    self.prettyDate.text = [date prettyDate];
}

- (void)datePickerValueChanged
{
    self.fromDate.text = [[datePicker date] description];
    date = [datePicker date];
    self.prettyDate.text = [date prettyDate];
}

- (void)done:(id)sender{
    [self.fromDate resignFirstResponder];
}

@end