//
//  RGSViewController.m
//  RGSColorSlider
//
//  Created by Randel Smith on 05/25/2016.
//  Copyright (c) 2016 Randel Smith. All rights reserved.
//

#import "RGSViewController.h"
#import <RGSColorSlider/RGSColorSlider.h>

@interface RGSViewController ()

@end

@implementation RGSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.colorSlider.color = self.colorView.backgroundColor;
}

-(IBAction)sliderDidChange:(RGSColorSlider *)sender{
    self.colorView.backgroundColor = sender.color;
    
}

@end
