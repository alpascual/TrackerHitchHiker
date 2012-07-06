//
//  OnlyHitchhiker.m
//  TrackerHitchhiker
//
//  Created by Albert Pascual on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OnlyHitchhiker.h"

@interface OnlyHitchhiker ()

@end

@implementation OnlyHitchhiker

@synthesize trackingManager = _trackingManager;
@synthesize whereText = _whereText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults]; 
    [myPrefs setObject:self.whereText forKey:@"where"];
    [myPrefs synchronize];
    
    //TODO send a tweet and then send it to the map
    
    MapViewController *map = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    map.trackingManager = self.trackingManager;
    [self presentModalViewController:map animated:YES];
    
}

@end
