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

- (IBAction)toggleMode:(id)sender {
    if ([self.modeButton.titleLabel.text isEqualToString:@"Night"]) {
        self.view.backgroundColor = [UIColor blackColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        [_modeButton setTitle:@"Day" forState:UIControlStateNormal];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeLabel.textColor = [UIColor blackColor];
        [_modeButton setTitle:@"Night" forState:UIControlStateNormal];
    }
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    CGRect timeFrame = _timeLabel.frame;
    float viewHeight = self.view.frame.size.height;
    float viewWidth = self.view.frame.size.width;
    float fontSize = 30.f;
    BOOL hideButton = YES;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        fontSize = 40.f;
        timeFrame.origin.y = (viewWidth / 2) - timeFrame.size.height;
        timeFrame.size.width = viewHeight;
    } else {
        hideButton = NO;
        timeFrame.origin.y = (viewHeight / 2) - timeFrame.size.height;
        timeFrame.size.width = viewWidth;
    }
    
    [_modeButton setHidden:hideButton];
    [_timeLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [_timeLabel setFrame:timeFrame];
}

- (NSUInteger) supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape);
}

@end
