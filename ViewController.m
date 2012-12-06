//
//  ViewController.m
//  Gestures
//
//  Created by Thibault Lenclos on 12/11/12.
//  Copyright (c) 2012 Thibault Lenclos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create TAP gesture recognizer
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
    
    // Create LONGPRESS gesture recognizer
    UIGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongpress:)];
    [self.view addGestureRecognizer:longpress];
    
    // Create ROTATION gesture recognizer
    UIGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [self.view addGestureRecognizer:rotation];
    
    // Create ZOOM (pinch) gesture recognizer
    UIPinchGestureRecognizer *zoom =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleZoom:)];
    [[self view] addGestureRecognizer:zoom];
    
    // Create PAN (drag and drop) gesture recognizer
    UIPanGestureRecognizer *drag =
    [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [[self view] addGestureRecognizer:drag];
}

- (void)handleTap:(UIGestureRecognizer *) sender
{
    CGPoint point = [sender locationInView:[self view]];
    self.imageView.center = point;
    
    
    NSLog(@"Tap at x=%f and y=%f", point.x, point.y);
}

- (void)handleLongpress:(UILongPressGestureRecognizer *) sender
{
    CGPoint point = [sender locationInView:[self view]];
    self.imageView.center = point;
    
    NSLog(@"Longpress at x=%f and y=%f", point.x, point.y);
}

- (void)handleRotation:(UIRotationGestureRecognizer *) sender
{    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    
    CGFloat degrees = [sender rotation] * (180 / M_PI);
    NSLog(@"Rotation in degrees : %f°", degrees);
    
    sender.rotation = 0;
}

- (void)handleZoom:(UIPinchGestureRecognizer *) sender
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    NSLog(@"Zoom : %f°", sender.scale);
    
    sender.scale = 1;
}

- (void)handlePan:(UIPanGestureRecognizer *) sender
{
    CGPoint point = [sender translationInView:[self view]];
    self.imageView.center = point;
    
    NSLog(@"Drag and drop x=%f y=%f°", point.x, point.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
