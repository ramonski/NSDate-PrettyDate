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
    NSTimer *refresher;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // init UIDatePicker with "Done" Button
    if (keyboardToolbar == nil) {
        keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        [keyboardToolbar setBarStyle:UIBarStyleBlackTranslucent];
        UIBarButtonItem *extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
        [keyboardToolbar setItems:[[NSArray alloc] initWithObjects: extraSpace, done, nil]];
    }
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];

    // init UISegmentedControl
    [self.styleSelector addTarget:self
                           action:@selector(render)
                 forControlEvents:UIControlEventValueChanged];


    // assign date picker as inputview to the fromDate textfield
    self.fromDate.inputAccessoryView = keyboardToolbar;
    self.fromDate.inputView = datePicker;

    date = [NSDate date];
    self.fromDate.text = [date description];

    // render the default PrettyDate style
    [self render];
    [self updateUI];
}

- (void)render
{
    if (self.styleSelector.selectedSegmentIndex == 0) {
        NSLog(@"Render PrettyDate with default style");
        self.prettyDate.text = [date prettyDate];
    } else {
        NSLog(@"Render PrettyDate with extended style");
        self.prettyDate.text = [date prettyDate];
    }
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

- (void)updateUI
{
    refresher = [NSTimer scheduledTimerWithTimeInterval:5
                                                 target:self
                                               selector:@selector(render)
                                               userInfo:nil
                                                repeats:YES];

}

- (void)dealloc
{
    [refresher invalidate];
}

@end