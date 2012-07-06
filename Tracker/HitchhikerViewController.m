//
//  HitchhikerViewController.m
//  TrackerHitchhiker
//
//  Created by Albert Pascual on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HitchhikerViewController.h"

@interface HitchhikerViewController ()

@end

@implementation HitchhikerViewController

@synthesize trackingManager = _trackingManager;

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

- (IBAction)forHitchHiker:(id)sender
{   
    // TODO add information about where is that person going or take a picture
    
    [self sendToMap:@"hitchhiker"];
}

- (IBAction)forVolunteer:(id)sender
{
    [self sendToMap:@"hitchdriver"];
}

- (void) sendToMap:(NSString*)hashTag
{
    // Make sure to update the map
    [self.trackingManager submitLastNOW];
    
    NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults]; 
    [myPrefs setObject:hashTag forKey:@"hashtag"];
    [myPrefs synchronize];
    
    if ( [hashTag isEqualToString:@"hitchhiker"] == YES )
    {
        OnlyHitchhiker *onlyForHitch = [[OnlyHitchhiker alloc] initWithNibName:@"OnlyHitchhiker" bundle:nil];
        onlyForHitch.trackingManager = self.trackingManager;
        [self presentModalViewController:onlyForHitch animated:YES];
    }
    
    else {
        
        MapViewController *map = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        map.trackingManager = self.trackingManager;
        [self presentModalViewController:map animated:YES];
    }
}

@end
