//
//  ViewController.h
//  Hello Time
//
//  Created by mookyung song on 6/10/15.
//  Copyright (c) 2015 STW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
@property (weak, nonatomic) IBOutlet UIButton *changeColorButton;
- (IBAction)toggleMode:(id)sender;
- (IBAction)changeColor:(id)sender;


@end

