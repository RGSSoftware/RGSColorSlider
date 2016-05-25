//
//  RGSViewController.h
//  RGSColorSlider
//
//  Created by Randel Smith on 05/25/2016.
//  Copyright (c) 2016 Randel Smith. All rights reserved.
//

@import UIKit;
#import <RGSColorSlider/RGSColorSlider.h>

@interface RGSViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet RGSColorSlider *colorSlider;

- (IBAction)sliderDidChange:(RGSColorSlider *)sender;
@end
