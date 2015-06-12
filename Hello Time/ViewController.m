//
//  ViewController.m
//  Hello Time
//
//  Created by mookyung song on 6/10/15.
//  Copyright (c) 2015 STW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self checkTime:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkTime:(id)sender
{
    // to get current date
    NSDateFormatter *formatter = [ [NSDateFormatter alloc] init];
    
    // set format of date: just time
    [formatter setDateFormat:@"h:mm:ss a"];
    
    // set text to label
    [_timeLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    // tell controller to call this method for every second
    [self performSelector:@selector(checkTime:) withObject:self afterDelay:1.0];
}

@end
